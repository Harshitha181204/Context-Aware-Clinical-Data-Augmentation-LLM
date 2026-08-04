from django import forms
from .models import MedicalRecord, Patient


class PatientForm(forms.ModelForm):
    class Meta:
        model = Patient
        fields = [
            'patient_code',
            'full_name',
            'age',
            'gender',
            'phone_number'
        ]


from django import forms
from django.contrib.auth.models import User
from .models import UserProfile


class RegisterForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)

    role = forms.ChoiceField(choices=UserProfile.ROLE_CHOICES)
    hospital_name = forms.CharField(max_length=200)
    specialization = forms.CharField(max_length=200, required=False)

    class Meta:
        model = User
        fields = ['username', 'email', 'password']

    def clean_username(self):
        username = self.cleaned_data['username']
        if User.objects.filter(username=username).exists():
            raise forms.ValidationError("Username already exists.")
        return username
    

from .models import MedicalRecord

class MedicalRecordForm(forms.ModelForm):
    class Meta:
        model = MedicalRecord
        fields = [
            'temperature',
            'heart_rate',
            'respiratory_rate',
            'oxygen_saturation',
            'systolic_bp',
            'diastolic_bp'
        ]