# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Boleta(models.Model):
    id_boleta = models.AutoField(primary_key=True)
    montototal = models.FloatField()
    id_mediopago = models.ForeignKey(
        'Mediopago', models.DO_NOTHING, db_column='id_mediopago')
    id_pedido = models.ForeignKey(
        'Pedido', models.DO_NOTHING, db_column='id_pedido')

    class Meta:
        managed = False
        db_table = 'boleta'


class Cliente(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    correo = models.CharField(max_length=50)
    contrasenna = models.CharField(max_length=256)

    class Meta:
        managed = False
        db_table = 'cliente'


class Insumo(models.Model):
    id_insumo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    tipo = models.CharField(max_length=50)
    stock = models.FloatField()

    class Meta:
        managed = False
        db_table = 'insumo'


class InsumoSolicitud(models.Model):
    id_solicitud = models.OneToOneField(
        'Solicitudinsumo', models.DO_NOTHING, db_column='id_solicitud', primary_key=True)
    id_insumo = models.ForeignKey(
        Insumo, models.DO_NOTHING, db_column='id_insumo')
    cantidadsolicitada = models.FloatField()

    class Meta:
        managed = False
        db_table = 'insumo_solicitud'
        unique_together = (('id_solicitud', 'id_insumo'),)


class Mediopago(models.Model):
    id_mediopago = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=25)
    estado = models.FloatField()

    class Meta:
        managed = False
        db_table = 'mediopago'


class Menucategoria(models.Model):
    id_menucategoria = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=25)

    class Meta:
        managed = False
        db_table = 'menucategoria'


class Menuitem(models.Model):
    id_menuitem = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    precio = models.FloatField()
    estado = models.FloatField()
    id_menucategoria = models.ForeignKey(
        Menucategoria, models.DO_NOTHING, db_column='id_menucategoria')

    class Meta:
        managed = False
        db_table = 'menuitem'


class Menuiteminsumo(models.Model):
    id_menuitem = models.OneToOneField(
        Menuitem, models.DO_NOTHING, db_column='id_menuitem', primary_key=True)
    id_insumo = models.ForeignKey(
        Insumo, models.DO_NOTHING, db_column='id_insumo')
    cantidad = models.FloatField()
    comentario = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'menuiteminsumo'
        unique_together = (('id_menuitem', 'id_insumo'),)


class Mesa(models.Model):
    numeromesa = models.AutoField(primary_key=True)
    capacidad = models.FloatField()
    sector = models.CharField(max_length=25, blank=True, null=True)
    estado = models.FloatField()

    class Meta:
        managed = False
        db_table = 'mesa'


class Pedido(models.Model):
    id_pedido = models.AutoField(primary_key=True)
    fechapedido = models.DateField()
    numeromesa = models.ForeignKey(
        Mesa, models.DO_NOTHING, db_column='numeromesa')
    id_trabajador = models.ForeignKey(
        'Trabajador', models.DO_NOTHING, db_column='id_trabajador')
    id_cliente = models.ForeignKey(
        Cliente, models.DO_NOTHING, db_column='id_cliente', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pedido'


class Pedidomenuitem(models.Model):
    id_pedido = models.OneToOneField(
        Pedido, models.DO_NOTHING, db_column='id_pedido', primary_key=True)
    id_menuitem = models.ForeignKey(
        Menuitem, models.DO_NOTHING, db_column='id_menuitem')
    cantidad = models.FloatField()
    comentario = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pedidomenuitem'
        unique_together = (('id_pedido', 'id_menuitem'),)


class Reserva(models.Model):
    id_reserva = models.AutoField(primary_key=True)
    fechareserva = models.DateField()
    horareserva = models.CharField(max_length=25)
    numeromesa = models.FloatField()
    estadoreserva = models.FloatField()
    id_cliente = models.ForeignKey(
        Cliente, models.DO_NOTHING, db_column='id_cliente')

    class Meta:
        managed = False
        db_table = 'reserva'
        unique_together = (('id_reserva', 'id_cliente'),)


class Roltrabajador(models.Model):
    id_rol = models.AutoField(primary_key=True)
    descripcionrol = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'roltrabajador'


class Solicitudinsumo(models.Model):
    id_solicitud = models.AutoField(primary_key=True)
    fechasolicitud = models.DateField()
    estado = models.FloatField()
    comentario = models.CharField(max_length=150, blank=True, null=True)
    id_trabajador = models.ForeignKey(
        'Trabajador', models.DO_NOTHING, db_column='id_trabajador')

    class Meta:
        managed = False
        db_table = 'solicitudinsumo'


class Trabajador(models.Model):
    id_trabajador = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    correo = models.CharField(max_length=50)
    contrasenna = models.CharField(max_length=256)
    id_rol = models.ForeignKey(
        Roltrabajador, models.DO_NOTHING, db_column='id_rol')

    class Meta:
        managed = False
        db_table = 'trabajador'
