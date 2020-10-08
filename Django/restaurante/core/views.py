from django.shortcuts import render, HttpResponse

# Create your views here.

"""
Home home/
Login login/

#Cliente
Reserva reserva/
Pagar pagar/
PedirOrden pedirorden/

#Recepcion
AsignarMesa asignarmesa/

#Cocina
ListaPedidos pedidos/
IngresarRecetas recetas/

#Bodega
Insumo insumos/

#Finanzas
CalcularGanancias ganancias/
EmitirBoleta boleta/
"""

def home(request):
    return HttpResponse("Home")

def login(request):
    return render(request, "core/login.html")

#Cliente
def reserva(request):
    return HttpResponse("Reserva")

def pagar(request):
    return HttpResponse("Pagar")

def pedirorden(request):
    return HttpResponse("Pedir Orden")

#Recepcion
def asignarmesa(request):
    return HttpResponse("Asignar Mesa")

#Cocina
def pedidos(request):
    return HttpResponse("Lista de Pedidos")

def recetas(request):
    return HttpResponse("Ingresar Recetas")

#Bodega
def insumos(request):
    return HttpResponse("Insumos")

#Finanzas
def ganancias(request):
    return HttpResponse("Calcular Ganancias")

def boleta(request):
    return HttpResponse("Emitir Boleta")