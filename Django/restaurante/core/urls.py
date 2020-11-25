from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="home"),
    path('login/', views.login, name="login"),
    path('reserva/', views.reserva, name="reserva"),
    path('pagar/', views.pagar, name="pagar"),
    path('pedirorden/', views.pedirorden, name="pedirorden"),
    path('asignarmesa/', views.asignarmesa, name="asignarmesa"),
    path('pedidos/', views.pedidos, name="pedidos"),
    path('recetas/', views.recetas, name="recetas"),
    path('insumos/', views.insumos, name="insumos"),
    path('ganancias/', views.ganancias, name="ganancias"),
    path('boleta/', views.boleta, name="boleta"),
    path('administrador/', views.formadmin, name="formadmin"),
    path('cliente/', views.formcliente, name="formcliente"),
    path('trabajador/', views.formtrabajador, name="formtrabajador"),
]