"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from rest_framework.authtoken import views as vw

from users.views import viewsToken, viewsUser

urlpatterns = [
    path(r'', viewsUser.index),
    # TOKEN
    path('api_generate_token/', vw.obtain_auth_token),
    path('get_token', viewsToken.GetAuthToken.as_view(), name='get_token'),
    path('register-user', viewsUser.RegisterNewUser.as_view(), name='register_user'),
    # ADMIN
    path('admin/', admin.site.urls),
    path('admin/doc/', include('django.contrib.admindocs.urls')),

    # LOGIN
    path('login/', include('users.urls')),

    # USUARIOS
    path('users/', include('users.urls')),
    # PROYECTOS
    path('project/', include('projects.urls.urlsProject')),
    path('block/', include('projects.urls.urlsBloc')),
    path('task/', include('projects.urls.urlsTask')),
    path('state/', include('projects.urls.urlsState')),
    path('priority/', include('projects.urls.urlsPriority')),
]
