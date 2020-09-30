"""TFG URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
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
from django.conf.urls import url
from rest_framework.authtoken import views as vw
from rest_framework.urlpatterns import format_suffix_patterns
from Login import views
from Login.views import UsuariosList
from Proyectos.urls import urlsBloc, urlsProject

urlpatterns = [
    path(r'', views.index),
    path('admin/', admin.site.urls),
    path('admin/doc/', include('django.contrib.admindocs.urls')),
    path('usuarios/', UsuariosList.as_view(), name='list_usuarios'),
    path('api_generate_token/', vw.obtain_auth_token),
    path('login/', include('Login.urls')),
    path('project/', include('Proyectos.urls.urlsProject')),
    path('block/', include('Proyectos.urls.urlsBloc')),
    path('task/',include('Proyectos.urls.urlsTask')),
]

#urlpatterns = format_suffix_patterns(urlpatterns)
