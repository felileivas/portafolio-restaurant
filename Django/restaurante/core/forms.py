from django import forms

from .models import Boleta, Cliente, Insumo, InsumoSolicitud, Mediopago, Menucategoria, Menuitem, Menuiteminsumo, Mesa, Pedido, Pedidomenuitem, Reserva, Roltrabajador, Solicitudinsumo, Trabajador


class TrabajadorForm(forms.ModelForm):

    class Meta:
        model = Trabajador
        fields = '__all__'

class ClienteForm(forms.ModelForm):

    class Meta:
        model = Cliente
        fields = '__all__'

class BoletaForm(forms.ModelForm):

    class Meta:
        model = Boleta
        fields = '__all__'

class InsumoForm(forms.ModelForm):

    class Meta:
        model = Insumo
        fields = '__all__'

class InsumoSolicitudForm(forms.ModelForm):

    class Meta:
        model = InsumoSolicitud
        fields = '__all__'

class MediopagoForm(forms.ModelForm):

    class Meta:
        model = Mediopago
        fields = '__all__'

class MenucategoriaForm(forms.ModelForm):

    class Meta:
        model = Menucategoria
        fields = '__all__'

class MenuitemForm(forms.ModelForm):

    class Meta:
        model = Menuitem
        fields = '__all__'

class MenuiteminsumoForm(forms.ModelForm):

    class Meta:
        model = Menuiteminsumo
        fields = '__all__'

class MesaForm(forms.ModelForm):

    class Meta:
        model = Mesa
        fields = '__all__'

class PedidoForm(forms.ModelForm):

    class Meta:
        model = Pedido
        fields = '__all__'

class PedidomenuitemForm(forms.ModelForm):

    class Meta:
        model = Pedidomenuitem
        fields = '__all__'

class ReservaForm(forms.ModelForm):

    class Meta:
        model = Reserva
        fields = '__all__'

class RoltrabajadorForm(forms.ModelForm):

    class Meta:
        model = Roltrabajador
        fields = '__all__'

class SolicitudinsumoForm(forms.ModelForm):

    class Meta:
        model = Solicitudinsumo
        fields = '__all__'