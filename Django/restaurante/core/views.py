from django.shortcuts import render, HttpResponse

from .forms import BoletaForm, ClienteForm, InsumoForm, InsumoSolicitudForm, MediopagoForm, MenucategoriaForm, MenuitemForm, MenuiteminsumoForm, MesaForm, PedidoForm, PedidomenuitemForm, ReservaForm, RoltrabajadorForm, SolicitudinsumoForm, TrabajadorForm
from .models import Reserva, Cliente, Pedido, Trabajador, Mesa, Boleta, Mediopago, Menuitem
from django.db import connection
import cx_Oracle


def agregar_pedidomenuitem(idpedido,idmenuitem,cantidad,comentario):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    cursor.callproc("insertarPedidoMenuItem", [idpedido,idmenuitem,cantidad,comentario])


def calculartotalboleta(idpedido,idmenuitem,cantidad,comentario):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    cursor.callproc("insertarPedidoMenuItem", [idpedido,idmenuitem,cantidad,comentario])

def agregar_boleta(idpedido,idmenuitem,cantidad,comentario):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    cursor.callproc("insertarPedidoMenuItem", [idpedido,idmenuitem,cantidad,comentario])


def reserva(request):
    mesas = Mesa.objects.filter(estado='1')
    data = {
        'variable_usuario': 'Cliente',
        'mesas': mesas,
        }
    if request.method == 'POST':
        reserva = Reserva()
        reserva.fechareserva = request.POST.get('fecha')
        reserva.horareserva = request.POST.get('hora')
        reserva.numeromesa = request.POST.get('mesaForm')
        reserva.estadoreserva = 1
        reserva.id_cliente = Cliente.objects.get(id_cliente='6')
        reserva.save()
    return render(request, "core/reserva.html", data)

# reserva = Cliente.objects.get(id_cliente='6') #estatico
# myDate = datetime.now()
# fechaFormato = myDate.strftime("%Y-%m-%d") #recuperarse desde un datepicker

# Reserva.objects.create(fechareserva=fechaFormato, horareserva='18', numeromesa='0', estadoreserva='1', id_cliente=reserva)


def home(request):
    
    menu = Menuitem.objects.filter(estado='1')
    data = {
        'variable_usuario': 'Cliente',
        'menu': menu,
        }

    print("hola home despues de data")
    return render(request, "core/home.html", data)

def login(request):
    return render(request, "core/login.html") 

#Cambios 13/12/2020 FLS

def pagar(request):
    data = {
        'variable_usuario': 'Cliente'}
    return render(request, "core/pagar.html", data)

#Seleccionar MenuItem
def pedirorden(request):
    platosorden = []
    reservas = Reserva.objects.filter(id_cliente='6')
    menuItem = Menuitem.objects.filter(estado='1')
if request me.method == ""POST:
        reserv = Reserva()
        
    data = {
        'variable_usuario': 'Cliente',
        'menuItem': menuItem,
        'reservas': reservas}

    if request.method=='POST' and 'btnform1' in request.POST:
        #agregar_pedidomenuitem(3,2,10,"Prueba desde django procedure")
        print()

    return render(request, "core/pedirorden.html", data)


#Recepcion
def asignarmesa(request):
    data = {
        'variable_usuario': 'Trabajador'}
    return render(request, "core/mesas.html", data)

#Cocina


#template para formulario de pedidos

def pedidos(request):
    reserva = Cliente.objects.get(id_cliente='6')
    mesero = Trabajador.objects.get(id_trabajador='2')
    mesa = Mesa.objects.get(numeromesa='1')
    data = {
        'variable_usuario': 'Usuario'
        }

    #Pedido.objects.create(fechapedido=fechaFormato, numeromesa=mesa, id_trabajador=mesero, id_cliente=reserva)

    return render(request, "core/pedidos.html", data)

################### 




##################



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

#########################

#Boleta

#llamar sp para calcular el total



#medio_pago = Mediopago.objects.get(id_mediopago='3')
#pedido = Pedido.objects.get(id_pedido='3')

#Boleta.objects.create(montototal=22000,id_mediopago=medio_pago,id_pedido=pedido )

#########################


def formadmin(request):
    data = {
        'variable_usuario': 'Administrador'}

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

