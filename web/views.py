from django.shortcuts import render
# importamos la libreria generic

# Create your views here.
def index(request):
    return render(request,'index.html')