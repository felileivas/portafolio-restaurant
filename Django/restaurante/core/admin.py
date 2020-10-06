from django.contrib import admin

from .models import Usuario, Reserva, Receta, Preparacion, Pedido, Mesero, Mesa, Mediopago, Insumo, Boleta

# Register your models here.
admin.site.register(Usuario)
admin.site.register(Reserva)
admin.site.register(Receta)
admin.site.register(Preparacion)
admin.site.register(Pedido)
admin.site.register(Mesero)
admin.site.register(Mesa)
admin.site.register(Mediopago)
admin.site.register(Insumo)
admin.site.register(Boleta)