from django.shortcuts import render, HttpResponse

from .forms import BoletaForm, ClienteForm, InsumoForm, InsumoSolicitudForm, MediopagoForm, MenucategoriaForm, MenuitemForm, MenuiteminsumoForm, MesaForm, PedidoForm, PedidomenuitemForm, ReservaForm, RoltrabajadorForm, SolicitudinsumoForm, TrabajadorForm
from .models import Trabajador, Mesa


def home(request):
    data = {
        'variable_usuario': 'Cliente'}
    return render(request, "core/home.html", data)

def login(request):
    return render(request, "core/login.html")

#Cliente
def reserva(request):

    #Mesas disponibles para reservas
    mesas = Mesa.objects.filter(estado='1')
    #mesas = Mesa.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    data = {
        'variable_usuario': 'Cliente',
        'mesas': mesas}
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

def formtrabajador(request):

    data = {
        'form': TrabajadorForm()
    }

    if request.method == "POST":
        formulario = TrabajadorForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
    return render(request, 'core/formulariotrabajador.html', data)

def formcliente(request):

    data = {
        'form': ClienteForm()
    }

    if request.method == "POST":
        formulario = ClienteForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
    return render(request, 'core/formulariocliente.html', data)

def formularioBoleta(request):

    data = {
        'form': BoletaForm()
    }

    if request.method == "POST":
        formulario = BoletaForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
    return render(request, 'core/boletas.html', data) 

def forminsumo(request):

    data = {
        'form': InsumoForm()
    }

    if request.method == "POST":
        formulario = InsumoForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
    # return render(request, 'core/home.html', data) 

def forminsumosolicitud(request):

    data = {
        'form': InsumoSolicitudForm()
    }

    if request.method == "POST":
        formulario = InsumoSolicitudForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
    # return render(request, 'core/home.html', data) 

def formmediopago(request):

    data = {
        'form': MediopagoForm()
    }

    if request.method == "POST":
        formulario = MediopagoForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
   # return render(request, 'core/home.html', data) 

def formmenucategoria(request):

    data = {
        'form': MenucategoriaForm()
    }

    if request.method == "POST":
        formulario = MenucategoriaForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
  #  return render(request, 'core/home.html', data) 

def formmenuitem(request):

    data = {
        'form': MenuitemForm()
    }

    if request.method == "POST":
        formulario = MenuitemForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
  #  return render(request, 'core/home.html', data)  

def formmenuiteminsumo(request):

    data = {
        'form': MenuiteminsumoForm()
    }

    if request.method == "POST":
        formulario = MenuiteminsumoForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
  #  return render(request, 'core/home.html', data)  

def formmesa(request):

    data = {
        'form': MesaForm()
    }

    if request.method == "POST":
        formulario = MesaForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
    return render(request, 'core/mesas.html', data)  

def formpedido(request):

    data = {
        'form': PedidoForm()
    }

    if request.method == "POST":
        formulario = PedidoForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
  #  return render(request, 'core/home.html', data)  
    
def formpedidomenuitem(request):

    data = {
        'form': PedidomenunitemForm()
    }

    if request.method == "POST":
        formulario = PedidomenuitemForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
  #  return render(request, 'core/home.html', data)  

def formreserva(request):

    data = {
        'form': ReservaForm()
    }

    if request.method == "POST":
        formulario = ReservaForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
  #  return render(request, 'core/home.html', data)  

def formroltrabajador(request):

    data = {
        'form': RoltrabajadorForm()
    }

    if request.method == "POST":
        formulario = RoltrabajadorForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
  #  return render(request, 'core/home.html', data)  

def formsolicitudinsumo(request):

    data = {
        'form': SolicitudinsumoForm()
    }

    if request.method == "POST":
        formulario = Solicitudinsumo(data=request.POST)
        if formulario.is_valid():
            formulario.save()
        else:
            data["form"] = formulario
  #  return render(request, 'core/home.html', data)  

