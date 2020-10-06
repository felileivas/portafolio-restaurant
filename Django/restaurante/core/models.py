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
    fecha = models.DateField()
    montototal = models.FloatField()
    mediopago_id_mediopago = models.ForeignKey('Mediopago', models.DO_NOTHING, db_column='mediopago_id_mediopago')
    pedido_id_pedido = models.ForeignKey('Pedido', models.DO_NOTHING, db_column='pedido_id_pedido')

    class Meta:
        managed = False
        db_table = 'boleta'
        verbose_name = 'Boleta'
        verbose_name_plural = 'Boletas'
        ordering = ['-fecha']
    def __str__(self):
        return 'ID: {} - Fecha Emision: {}'.format(self.id_boleta, self.fecha)



class Insumo(models.Model):
    id_insumo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    tipo = models.CharField(max_length=50)
    cantidad = models.FloatField()

    class Meta:
        managed = False
        db_table = 'insumo'
        verbose_name = 'Insumo'
        verbose_name_plural = 'Insumos'
    def __str__(self):
        return 'ID: {} - Nombre: {}'.format(self.id_insumo, self.nombre)


class Mediopago(models.Model):
    id_mediopago = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    estado = models.FloatField()

    class Meta:
        managed = False
        db_table = 'mediopago'
        verbose_name = 'Medio de pago'
        verbose_name_plural = 'Medios de pagos'
    def __str__(self):
        return '{}'.format(self.nombre)


class Mesa(models.Model):
    id_mesa = models.AutoField(primary_key=True)
    capacidad = models.FloatField()
    sector = models.CharField(max_length=50, blank=True, null=True)
    estado = models.FloatField()

    class Meta:
        managed = False
        db_table = 'mesa'
        verbose_name = 'Mesa'
        verbose_name_plural = 'Mesas'

    def __str__(self):
        return 'ID: {} - Sector: {} - Capacidad: {}'.format(self.id_mesa, self.sector, self.capacidad)



class Mesero(models.Model):
    id_mesero = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    correo = models.CharField(max_length=100)
    contrasenna = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'mesero'
        verbose_name = 'Mesero'
        verbose_name_plural = 'Meseros'
    def __str__(self):
        return '{}'.format(self.nombre)


class Pedido(models.Model):
    id_pedido = models.AutoField(primary_key=True)
    fecha = models.DateField()
    comentario = models.CharField(max_length=50, blank=True, null=True)
    mesero_id_mesero = models.ForeignKey(Mesero, models.DO_NOTHING, db_column='mesero_id_mesero')
    reserva_id_reserva = models.ForeignKey('Reserva', models.DO_NOTHING, db_column='reserva_id_reserva')
    preparacion_id_preparacion = models.ForeignKey('Preparacion', models.DO_NOTHING, db_column='preparacion_id_preparacion')

    class Meta:
        managed = False
        db_table = 'pedido'
        verbose_name = 'Pedido'
        verbose_name_plural = 'Pedidos'
    def __str__(self):
        return '{}'.format(self.reserva_id_reserva)


class Preparacion(models.Model):
    id_preparacion = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    precio = models.FloatField()
    estado = models.FloatField()

    class Meta:
        managed = False
        db_table = 'preparacion'
        verbose_name = 'Preparacion'
        verbose_name_plural = 'Preparaciones'
    def __str__(self):
        return '{}'.format(self.nombre)



class Receta(models.Model):
    id_receta = models.AutoField(primary_key=True)
    insumo_id_insumo = models.ForeignKey(Insumo, models.DO_NOTHING, db_column='insumo_id_insumo')
    preparacion_id_preparacion = models.ForeignKey(Preparacion, models.DO_NOTHING, db_column='preparacion_id_preparacion')

    class Meta:
        managed = False
        db_table = 'receta'
        verbose_name = 'Receta'
        verbose_name_plural = 'Recetas'
    def __str__(self):
        return '{}'.format( self.preparacion_id_preparacion)


class Reserva(models.Model):
    id_reserva = models.AutoField(primary_key=True)
    fecha = models.DateField()
    mesa_id_mesa = models.ForeignKey(Mesa, models.DO_NOTHING, db_column='mesa_id_mesa')
    usuario_id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='usuario_id_usuario')

    class Meta:
        managed = False
        db_table = 'reserva'
        verbose_name = 'Reserva'
        verbose_name_plural = 'Reservas'
    def __str__(self):
        return '{} {} {}'.format(self.fecha, self.mesa_id_mesa, self.usuario_id_usuario)



class Usuario(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    correo = models.CharField(max_length=50)
    contrasenna = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'usuario'
        verbose_name = 'Usuario'
        verbose_name_plural = 'Usuarios'
    def __str__(self):
        return 'ID: {} - Cliente: {}'.format(self.id_usuario, self.nombre)


