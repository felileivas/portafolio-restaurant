from django.db import models

class Boleta(models.Model):
    id_boleta = models.AutoField(primary_key=True)
    montototal = models.FloatField()
    id_mediopago = models.ForeignKey('Mediopago', models.DO_NOTHING, db_column='id_mediopago', verbose_name='Medio de pago')
    id_pedido = models.ForeignKey('Pedido', models.DO_NOTHING, db_column='id_pedido',verbose_name='Pedido')

    class Meta:
        managed = False
        db_table = 'boleta'
        verbose_name = 'Boleta'
        verbose_name_plural = 'Boletas'

    def __str__(self):
        return '{} {} {} {}'.format(self.id_boleta, self.montototal, self.id_mediopago, self.id_pedido)


class Cliente(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    correo = models.CharField(max_length=50)
    contrasenna = models.CharField(max_length=256, verbose_name='Contraseña')

    class Meta:
        managed = False
        db_table = 'cliente'
        verbose_name = 'Cliente'
        verbose_name_plural = 'Clientes'
    def __str__(self):
        return '{} {}'.format(self.id_cliente, self.correo)


class Insumo(models.Model):
    id_insumo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    tipo = models.CharField(max_length=50)
    stock = models.FloatField()

    class Meta:
        managed = False
        db_table = 'insumo'
        verbose_name = 'Bodega'
        verbose_name_plural = 'Insumos en Bodega'
    def __str__(self):
        return '{}'.format(self.nombre)


class InsumoSolicitud(models.Model):
    id_solicitud = models.OneToOneField(
        'Solicitudinsumo', models.DO_NOTHING,primary_key=True, db_column='id_solicitud')
    id_insumo = models.ForeignKey(
        Insumo, models.DO_NOTHING, db_column='id_insumo', verbose_name='Insumo')
    cantidadsolicitada = models.FloatField()

    class Meta:
        managed = False
        db_table = 'insumo_solicitud'
        unique_together = (('id_solicitud', 'id_insumo'),)
        verbose_name = 'Insumo en Solicitud'
        verbose_name_plural = 'Insumos en Solicitud'
    def __str__(self):
        return '{} {} {}'.format(self.id_solicitud, self.id_insumo, self.cantidadsolicitada)


class Mediopago(models.Model):
    id_mediopago = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=25)
    estado = models.FloatField()

    class Meta:
        managed = False
        db_table = 'mediopago'
        verbose_name = 'Medio de Pago'
        verbose_name_plural = 'Medios de Pago'
    def __str__(self):
        return '{}'.format(self.nombre)


class Menucategoria(models.Model):
    id_menucategoria = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=25)

    class Meta:
        managed = False
        db_table = 'menucategoria'
        verbose_name = 'Categoría del menu'
        verbose_name_plural = 'Categorías del menu'
    def __str__(self):
        return '{}'.format(self.nombre)


class Menuitem(models.Model):
    id_menuitem = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    precio = models.FloatField()
    estado = models.FloatField()
    id_menucategoria = models.ForeignKey(
        Menucategoria, models.DO_NOTHING, db_column='id_menucategoria', verbose_name='Categoría')

    class Meta:
        managed = False
        db_table = 'menuitem'
        verbose_name = 'Carta'
        verbose_name_plural = 'Platos'
    def __str__(self):
       return '{} {} {}'.format(self.id_menuitem, self.nombre, self.precio)


class Menuiteminsumo(models.Model):
    id_menuitem = models.OneToOneField(
        Menuitem, models.DO_NOTHING, db_column='id_menuitem',primary_key=True, verbose_name='Nombre de la preparacion de la receta')
    id_insumo = models.ForeignKey(
        Insumo, models.DO_NOTHING, db_column='id_insumo', verbose_name='Insumo')
    cantidad = models.FloatField()
    comentario = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'menuiteminsumo'
        unique_together = (('id_menuitem', 'id_insumo'),)
        verbose_name = 'Ingrediente para receta'
        verbose_name_plural = 'Ingredientes para receta'
    def __str__(self):
        return '{} {} {} {}'.format(self.id_menuitem, self.id_insumo, self.cantidad, self.comentario)


class Mesa(models.Model):
    numeromesa = models.AutoField(primary_key=True)
    capacidad = models.FloatField()
    sector = models.CharField(max_length=25, blank=True, null=True)
    estado = models.FloatField()

    class Meta:
        managed = False
        db_table = 'mesa'
        verbose_name = 'Mesa'
        verbose_name_plural = 'Mesas'

    def __str__(self):
        return 'Numero mesa: {} - {}'.format(self.numeromesa, self.sector)



class Pedido(models.Model):
    id_pedido = models.AutoField(primary_key=True)
    fechapedido = models.DateField()
    numeromesa = models.ForeignKey(
        Mesa, models.DO_NOTHING, db_column='numeromesa', verbose_name='Mesa')
    id_trabajador = models.ForeignKey(
        'Trabajador', models.DO_NOTHING, db_column='id_trabajador',verbose_name='Trabajador')
    id_cliente = models.ForeignKey(
        Cliente, models.DO_NOTHING, db_column='id_cliente', blank=True, null=True, verbose_name='Cliente')

    class Meta:
        managed = False
        db_table = 'pedido'
        verbose_name = 'Pedido'
        verbose_name_plural = 'Pedidos'
    def __str__(self):
        return '{} - {} ({})'.format(self.id_pedido, self.id_cliente, self.fechapedido)


class Pedidomenuitem(models.Model):
    id_pedido = models.OneToOneField(
        Pedido, models.DO_NOTHING, db_column='id_pedido',primary_key=True)
    id_menuitem = models.ForeignKey(
        Menuitem, models.DO_NOTHING, db_column='id_menuitem', verbose_name='Item del Menú')
    cantidad = models.FloatField()
    comentario = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pedidomenuitem'
        unique_together = (('id_pedido', 'id_menuitem'),)
        verbose_name = 'Item Pedido'
        verbose_name_plural='Items Pedidos'
    def __str__(self):
        return '{} {} {} {}'.format(self.id_pedido, self.id_menuitem, self.cantidad, self.comentario)


class Reserva(models.Model):
    id_reserva = models.AutoField(primary_key=True)
    fechareserva = models.DateField(verbose_name='fecha de creacion reserva')
    horareserva = models.CharField(max_length=25)
    numeromesa = models.FloatField()
    estadoreserva = models.FloatField()
    id_cliente = models.ForeignKey(
        Cliente, models.DO_NOTHING, db_column='id_cliente', verbose_name='Cliente')

    class Meta:
        managed = False
        db_table = 'reserva'
        unique_together = (('id_reserva', 'id_cliente'),)
        verbose_name = 'Reserva'
        verbose_name_plural = 'Reservas'

    def __str__(self):
        return '{} {} {} {} {}'.format(self.id_reserva, self.fechareserva, self.horareserva, self.numeromesa, self.id_cliente)


class Roltrabajador(models.Model):
    id_rol = models.AutoField(primary_key=True)
    descripcionrol = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'roltrabajador'
        verbose_name = 'Rol de trabajador'
        verbose_name_plural = 'Roles de trabajadores'

    def __str__(self):
        return '{} '.format(self.descripcionrol)


class Solicitudinsumo(models.Model):
    id_solicitud = models.AutoField(primary_key=True)
    fechasolicitud = models.DateField()
    estado = models.FloatField()
    comentario = models.CharField(max_length=150, blank=True, null=True)
    id_trabajador = models.ForeignKey(
        'Trabajador', models.DO_NOTHING, db_column='id_trabajador', verbose_name='Solicitud de Insumo')

    class Meta:
        managed = False
        db_table = 'solicitudinsumo'
        verbose_name = 'Solicitud de insumo'
        verbose_name_plural = 'Solicitudes de insumo'
    def __str__(self):
       return '{} {} {} {}'.format(self.id_solicitud, self.fechasolicitud, self.estado, self.id_trabajador)


class Trabajador(models.Model):
    id_trabajador = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    correo = models.CharField(max_length=50)
    contrasenna = models.CharField(max_length=256)
    id_rol = models.ForeignKey(
        Roltrabajador, models.DO_NOTHING, db_column='id_rol', verbose_name='Rol')

    class Meta:
        managed = False
        db_table = 'trabajador'
        verbose_name = 'Trabajador'
        verbose_name_plural = 'Trabajadores'

    def __str__(self):
        return '{} - {}'.format(self.nombre, self.id_rol)
