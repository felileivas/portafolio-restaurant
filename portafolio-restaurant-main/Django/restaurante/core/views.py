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
    return render(request, "core/home.html")

def login(request):
    return render(request, "core/login.html")

#Cliente
def reserva(request):
    return render(request, "core/reserva.html")

def pagar(request):
    return render(request, "core/pagar.html")

def pedirorden(request):
    return render(request, "core/pedirorden.html")

#Recepcion
def asignarmesa(request):
    return render(request, "core/mesas.html")

#Cocina
def pedidos(request):
    return render(request, "core/pedidos.html")

def recetas(request):
    return render(request, "core/recetas.html")

#Bodega
def insumos(request):
    return render(request, "core/insumos.html")

#Finanzas
def ganancias(request):
    return render(request, "core/ganancias.html")

def boleta(request):
    return render(request, "core/boletas.html")