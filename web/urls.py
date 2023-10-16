from django.urls import path
from django.views.decorators.http import require_http_methods
from . import views

app_name = 'web'

urlpatterns = [
    path('', views.AlumnoView.as_view(),name='index'),
    path('eliminar/', views.EliminarAlumnoView.as_view(), name='eliminar_alumno'),
    path('profesor/', views.ProfesorView.as_view(),name='profesor'),
    path('eliminar_profesor/', views.EliminarProfesorView.as_view(), name='eliminar_profesor'),
]
 
