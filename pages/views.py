# pages/views.py
from django.shortcuts import render
from django.views.generic import TemplateView


class HomePageView(TemplateView):
    template_name = 'home1.html'


class AboutPageView(TemplateView):
    template_name = 'about.html'

class TeamPageView(TemplateView):
    template_name = 'team.html'

class ContactPageView(TemplateView):
    template_name = 'contact.html'


class PrivacyPolicy(TemplateView):
    template_name = 'privacy_policy.html'