from django.db import models

from django.contrib.auth.models import User


class UserProfile(models.Model):
    ROLE_CHOICES = [
        ('Doctor', 'Doctor'),
        ('Admin', 'Admin'),
    ]

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    role = models.CharField(max_length=20, choices=ROLE_CHOICES)
    hospital_name = models.CharField(max_length=200)
    specialization = models.CharField(max_length=200, blank=True, null=True)

    def __str__(self):
        return self.user.username
    
from django.db import models


class Patient(models.Model):
    GENDER_CHOICES = [
        ('Male', 'Male'),
        ('Female', 'Female'),
        ('Other', 'Other'),
    ]

    patient_code = models.CharField(max_length=20, unique=True)  # Unique Key
    full_name = models.CharField(max_length=200)
    age = models.IntegerField()
    gender = models.CharField(max_length=10, choices=GENDER_CHOICES)
    phone_number = models.CharField(max_length=15, blank=True, null=True)

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.patient_code} - {self.full_name}"

class MedicalRecord(models.Model):
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE, related_name='records')

    temperature = models.FloatField()
    heart_rate = models.FloatField()
    respiratory_rate = models.FloatField()
    oxygen_saturation = models.FloatField()
    systolic_bp = models.FloatField()
    diastolic_bp = models.FloatField()

    visit_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Medical Record for {self.patient.full_name}"


# 2️⃣ Augmented Features (LLM + GAN Generated)
class AugmentedFeature(models.Model):
    patient = models.OneToOneField(Patient, on_delete=models.CASCADE)

    # Dynamic feature storage
    generated_features = models.JSONField()

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Augmented Features for Patient {self.patient.id}"


# 3️⃣ Final Prediction Result
class PredictionResult(models.Model):
    patient = models.OneToOneField(Patient, on_delete=models.CASCADE)

    predicted_disease = models.CharField(max_length=100)
    probability = models.FloatField()

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Prediction for Patient {self.patient.id}"