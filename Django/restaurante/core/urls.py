from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="home"),
    path('login/', views.login, name="login"),
    path('reserva/', views.reserva, name="reserva"),
    path('pagar/', views.pagar, name="pagar"),
    path('pedirorden/', views.pedirorden, name="pedirorden"),
    path('mesa/new', views.formmesa, name="formmesa"),
    path('pedidos/', views.pedidos, name="pedidos"),
    path('recetas/', views.recetas, name="recetas"),
    path('insumos/', views.insumos, name="insumos"),
    path('ganancias/', views.ganancias, name="ganancias"),
    path('boleta/new/', views.formularioBoleta, name="formularioBoleta"),
    path('administrador/', views.formadmin, name="formadmin"),
    path('cliente/new/', views.formcliente, name="formcliente"),
    path('trabajador/new/', views.formtrabajador, name="formtrabajador"),


]

#Cliente.objects.all()
#Cliente.objects.create(nombre='test', apellido='test', correo='test@test.cl', contrasenna='test' )
#Cliente.objects.get(correo='test@test.cl')
#Cliente.objects.filter(correo='test@test.cl')

######################

#Trabajador.objects.all()
#Trabajador.objects.create(nombre='test', apellido='test', correo='test@test.cl', contrasenna='test', id_rol= '1')
#Trabajador.objects.get(correo='test@test.cl')
#Trabajador.objects.filter(correo='test@test.cl')