"""URLS DE LA APLICACIÓN PARA EL LOGUEO"""
from django.urls import path

from Login import views

urlpatterns = [

    path('login/', views.Login.as_view(), name='login'),
    path('logout/', views.Logout.as_view(), name='logout')
]
