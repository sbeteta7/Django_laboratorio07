from django.shortcuts import render, redirect
from .forms import *
# importamos la clase View
from .models import *
from django.views import View
from django.core.exceptions import ObjectDoesNotExist
from .models import TblAlumno
from .models import TblAlumno
from django.contrib import messages
# Create your views here.
class AlumnoView(View):
    
    def get(self,request):
        listaAlumnos = TblAlumno.objects.all()
        formAlumno = AlumnoForm()
        context = {
            'alumnos' : listaAlumnos,
            'formAlumno': formAlumno
        }
        return render(request,'index.html',context)

    def post(self, request):
        formAlumno = AlumnoForm(request.POST)
        if formAlumno.is_valid():
            formAlumno.save()
            return redirect('/')
        return redirect('/')
    
class EliminarAlumnoView(View):
    def post(self, request):
        try:
            alumno_id = request.POST.get('alumno_id')
            alumno = TblAlumno.objects.get(alumno_id=alumno_id)
            alumno.delete()
       
            messages.success(request, 'Alumno eliminado correctamente')
        except ObjectDoesNotExist:
           
            messages.error(request, 'Alumno no encontrado')
        except Exception as e:
           
            messages.error(request, 'Error al eliminar el alumno')

       
        return redirect('web:index')
    

class ProfesorView(View):
    
    def get(self,request):
        listaProfesores = TblProfesor.objects.all()
        formProfesor = ProfesorForm()
        context = {
            'profesores' : listaProfesores,
            'formProfesor': formProfesor
        }
        return render(request,'profesor.html',context)

    def post(self, request):
        formProfesor = ProfesorForm(request.POST)
        if formProfesor.is_valid():
            formProfesor.save()
            return redirect('web:profesor')
        return redirect('/')
    
class EliminarProfesorView(View):
    def post(self, request):
        try:
            profesor_id = request.POST.get('profesor_id')
            profesor = TblProfesor.objects.get(profesor_id=profesor_id)
            profesor.delete()
    
            messages.success(request, 'Profesor eliminado correctamente')
        except ObjectDoesNotExist:
   
            messages.error(request, 'Profesor no encontrado')
        except Exception as e:
   
            messages.error(request, 'Error al eliminar el profesor')

    
        return redirect('web:profesor')
    

