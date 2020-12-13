from django.contrib import admin

from .models import Boleta, Cliente, Insumo, InsumoSolicitud, Mediopago, Menucategoria, Menuitem, Menuiteminsumo, Mesa, Pedido, Pedidomenuitem, Reserva, Roltrabajador, Solicitudinsumo, Trabajador

class MesaAdmin(admin.ModelAdmin):
        list_display = ('numeromesa','capacidad','sector','estado')
        list_filter = ('sector','capacidad')

class BoletaAdmin(admin.ModelAdmin):
        list_display = ('montototal','id_mediopago','id_pedido')

class ClienteAdmin(admin.ModelAdmin):
        list_display = ('nombre','apellido','correo','contrasenna')

class InsumoAdmin(admin.ModelAdmin):
        list_display = ('nombre','tipo','stock')
        list_filter = ('tipo',)

class InsumoSolicitudAdmin(admin.ModelAdmin):
        list_display = ('id_insumo','cantidadsolicitada')

class MediopagoAdmin(admin.ModelAdmin):
        list_display = ('nombre',)

class MenucategoriaAdmin(admin.ModelAdmin):
        list_display = ('nombre',)
        list_filter = ('id_menucategoria',)

class MenuitemAdmin(admin.ModelAdmin):
        list_display = ('nombre','precio','estado', 'id_menucategoria')

class MenuiteminsumoAdmin(admin.ModelAdmin):
        list_display = ('id_insumo','cantidad','comentario')

class PedidoAdmin(admin.ModelAdmin):
        list_display = ('fechapedido','numeromesa','id_trabajador','id_cliente')

class PedidomenuitemAdmin(admin.ModelAdmin):
        list_display = ('id_menuitem','cantidad','comentario')

class ReservaAdmin(admin.ModelAdmin):
        list_display = ('fechareserva','horareserva','numeromesa', 'estadoreserva','id_cliente')

class RoltrabajadorAdmin(admin.ModelAdmin):
        list_display = ('descripcionrol',) 

class SolicitudinsumoAdmin(admin.ModelAdmin):
        list_display = ('fechasolicitud', 'estado', 'comentario', 'id_trabajador')

class TrabajadorAdmin(admin.ModelAdmin):
        list_display = ('nombre', 'apellido', 'correo', 'contrasenna', 'id_rol')
        list_filter = ('id_rol',)

admin.site.register(Boleta, BoletaAdmin)
admin.site.register(Cliente, ClienteAdmin)
admin.site.register(Insumo, InsumoAdmin)
admin.site.register(InsumoSolicitud, InsumoSolicitudAdmin)
admin.site.register(Mediopago, MediopagoAdmin)
admin.site.register(Menucategoria, MenucategoriaAdmin)
admin.site.register(Menuitem, MenuitemAdmin)
admin.site.register(Menuiteminsumo, MenuiteminsumoAdmin)
admin.site.register(Mesa, MesaAdmin)
admin.site.register(Pedido, PedidoAdmin)
admin.site.register(Pedidomenuitem, PedidomenuitemAdmin)
admin.site.register(Reserva, ReservaAdmin)
admin.site.register(Roltrabajador, RoltrabajadorAdmin)
admin.site.register(Solicitudinsumo, SolicitudinsumoAdmin)
admin.site.register(Trabajador, TrabajadorAdmin)

