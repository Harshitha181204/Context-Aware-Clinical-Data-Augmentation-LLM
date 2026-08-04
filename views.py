from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required

from clinical_app.services.augmentation_engine import augment_patient_data


@login_required(login_url='login')
def home(request):
    return render(request, 'home.html')

def user_login(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.error(request, "Invalid username or password")

    return render(request, 'login.html')


def user_logout(request):
    logout(request)
    return redirect('login')


from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from .models import UserProfile, Patient, AugmentedFeature
from .forms import RegisterForm


def register(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = User.objects.create_user(
                username=form.cleaned_data['username'],
                email=form.cleaned_data['email'],
                password=form.cleaned_data['password']
            )

            UserProfile.objects.create(
                user=user,
                role=form.cleaned_data['role'],
                hospital_name=form.cleaned_data['hospital_name'],
                specialization=form.cleaned_data['specialization']
            )

            login(request, user)
            return redirect('home')
    else:
        form = RegisterForm()

    return render(request, 'register.html', {'form': form})

from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from .models import UserProfile


@login_required(login_url='login')
def profile(request):

    profile, created = UserProfile.objects.get_or_create(
        user=request.user,
        defaults={
            'role': 'Doctor',
            'hospital_name': 'Not Provided',
            'specialization': ''
        }
    )

    return render(request, 'profile.html', {
        'profile': profile
    })

@login_required(login_url='login')
def edit_profile(request):
    profile = UserProfile.objects.get(user=request.user)

    if request.method == 'POST':
        profile.role = request.POST.get('role')
        profile.hospital_name = request.POST.get('hospital_name')
        profile.specialization = request.POST.get('specialization')
        profile.save()
        return redirect('profile')

    return render(request, 'edit_profile.html', {'profile': profile})

from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect, get_object_or_404
from .forms import PatientForm, MedicalRecordForm
from .models import Patient, MedicalRecord


# --------------------------------------
# STEP 1: Add Patient (Master Data)
# --------------------------------------
@login_required(login_url='login')
def add_patient(request):

    if request.method == 'POST':
        form = PatientForm(request.POST)

        if form.is_valid():
            patient = form.save()

            # Redirect to Step 2
            return redirect('add_medical_record', patient_id=patient.id)

    else:
        form = PatientForm()

    return render(request, 'add_patient.html', {'form': form})


# --------------------------------------
# STEP 2: Add Medical Record (Visit Data)
# --------------------------------------

@login_required(login_url='login')
def add_medical_record(request, patient_id):

    patient = get_object_or_404(Patient, id=patient_id)

    if request.method == 'POST':
        form = MedicalRecordForm(request.POST)

        if form.is_valid():
            record = form.save(commit=False)
            record.patient = patient
            record.save()

            # After saving record → redirect to patient list
            return redirect('patient_list')

    else:
        form = MedicalRecordForm()

    return render(request, 'add_medical_record.html', {
        'form': form,
        'patient': patient
    })


from clinical_app.models import MedicalRecord

def patient_list(request):
    patients = Patient.objects.all()

    # Attach record existence flag
    for patient in patients:
        patient.has_record = MedicalRecord.objects.filter(patient=patient).exists()

    return render(request, "patient_list.html", {
        "patients": patients
    })



from django.shortcuts import redirect
from clinical_app.models import MedicalRecord

@login_required(login_url='login')
def augment_patient(request, patient_id):

    patient = Patient.objects.get(id=patient_id)

    medical_record = MedicalRecord.objects.filter(patient=patient).last()

    if not medical_record:
        return redirect('add_medical_record', patient_id=patient.id)

    try:
        augmented = AugmentedFeature.objects.get(patient=patient)
        generated_features = augmented.generated_features

    except AugmentedFeature.DoesNotExist:
        generated_features = augment_patient_data(patient)

        AugmentedFeature.objects.create(
            patient=patient,
            generated_features=generated_features
        )

    return render(request, "augmentation_result.html", {
        "patient": patient,
        "features": generated_features
    })