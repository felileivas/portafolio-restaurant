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
    data = {
        'variable_usuario': 'Cliente'}
    return render(request, "core/home.html", data)

def login(request):
    return render(request, "core/login.html")

#Cliente
def reserva(request):
    data = {
        'variable_usuario': 'Cliente'}
    return render(request, "core/reserva.html", data)

def pagar(request):
    data = {
        'variable_usuario': 'Cliente'}
    return render(request, "core/pagar.html", data)

def pedirorden(request):
    data = {
        'variable_usuario': 'Cliente'}
    return render(request, "core/pedirorden.html", data)

#Recepcion
def asignarmesa(request):
    data = {
        'variable_usuario': 'Trabajador'}
    return render(request, "core/mesas.html", data)

#Cocina
def pedidos(request):
    data = {
        'variable_usuario': 'Trabajador'}
    return render(request, "core/pedidos.html", data)

def recetas(request):
    data = {
        'variable_usuario': 'Trabajador'}
    return render(request, "core/recetas.html", data)

#Bodega
def insumos(request):
    data = {
        'variable_usuario': 'Administrador'}
    return render(request, "core/insumos.html")

#Finanzas
def ganancias(request):
    data = {
        'variable_usuario': 'Administrador'}
    return render(request, "core/ganancias.html", data)

def boleta(request):
    data = {
        'variable_usuario': 'Administrador'}
    return render(request, "core/boletas.html", data)

def formadmin(request):
    data = {
        'variable_usuario': 'Administrador'}
    return render(request, "core/formularioadministrador.html", data)

def formcliente(request):
    data = {
        'variable_usuario': 'Cliente'}
    return render(request, "core/formulariocliente.html", data)

def formtrabajador(request):
    data = {
        'variable_usuario': 'Trabajador'}
    return render(request, "core/formulariotrabajador.html", data)