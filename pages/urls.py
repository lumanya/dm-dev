# pages/urls.py
from .views import HomePageView, AboutPageView, TeamPageView, ContactPageView, PrivacyPolicy
from django.urls import path


urlpatterns = [
    path('', HomePageView.as_view(), name='home'),
    path('about/', AboutPageView.as_view(), name='about'),
    path('team/', TeamPageView.as_view(), name='team'),
    path('contact/', ContactPageView.as_view(), name='contact'),
    path('privacy-policy/', PrivacyPolicy.as_view(), name='privacy')
]


