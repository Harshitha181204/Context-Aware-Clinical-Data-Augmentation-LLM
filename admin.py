from django.contrib import admin
from .models import Patient, AugmentedFeature, PredictionResult

admin.site.register(Patient)
admin.site.register(AugmentedFeature)
admin.site.register(PredictionResult)