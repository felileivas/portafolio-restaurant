from django.contrib import admin

# from .models import Usuario, Reserva, Receta, Preparacion, Pedido, Mesero, Mesa, Mediopago, Insumo, Boleta

# # Register your models here.

# class BoletaAdmin(admin.ModelAdmin):
#     list_display = ('id_boleta','fecha','mediopago_id_mediopago', 'pedido_id_pedido')
#     date_hierarchy = 'fecha'

# class RecetaAdmin(admin.ModelAdmin):
#     list_display = ('id_receta','preparacion_id_preparacion','insumo_id_insumo')
#     list_filter = ('preparacion_id_preparacion',)

# class MesaAdmin(admin.ModelAdmin):
#     list_display = ('id_mesa','capacidad','sector')
#     list_filter = ('sector','capacidad',)

# class InsumoAdmin(admin.ModelAdmin):
#     list_display = ('id_insumo','nombre','tipo','cantidad')
#     list_filter = ('tipo',)

# class UsuarioAdmin(admin.ModelAdmin):
#     list_display = ('id_usuario','nombre')

# class MeseroAdmin(admin.ModelAdmin):
#     list_display = ('id_mesero','nombre')

# class ReservaAdmin(admin.ModelAdmin):
#     list_display = ('id_reserva','fecha', 'mesa_id_mesa', 'usuario_id_usuario')
#     date_hierarchy = 'fecha'

# class MedioPagoAdmin(admin.ModelAdmin):
#     list_display = ('id_mediopago','nombre')

# class PedidosAdmin(admin.ModelAdmin):
#     list_display = ('id_pedido','fecha','reserva_id_reserva')
#     date_hierarchy = 'fecha'

# class PreparacionAdmin(admin.ModelAdmin):
#     list_display = ('id_preparacion','nombre','precio')
#     list_filter = ('precio',)


# admin.site.register(Usuario, UsuarioAdmin)
# admin.site.register(Reserva,ReservaAdmin)
# admin.site.register(Receta,RecetaAdmin)
# admin.site.register(Preparacion,PreparacionAdmin)
# admin.site.register(Pedido,PedidosAdmin)
# admin.site.register(Mesero,MeseroAdmin)
# admin.site.register(Mesa,MesaAdmin)
# admin.site.register(Mediopago,MedioPagoAdmin)
# admin.site.register(Insumo, InsumoAdmin)
# admin.site.register(Boleta,BoletaAdmin)
