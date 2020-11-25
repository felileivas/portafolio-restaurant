---------------------------------------------------------------
--- PROCEDURES

-- Cliente
-- LISTAR

create or replace procedure listarclientes (registros out sys_refcursor)
as
begin
    open registros for select * from Cliente;
end;

-- AGREGAR

create or replace procedure insertarcliente (
v_nombre in VARCHAR2,
v_apellido in VARCHAR2,
v_correo in VARCHAR2,
v_contrasenna in VARCHAR2
)
AS
begin
    insert into cliente (
    nombre,
    apellido,
    correo,
    contrasenna,
    ) values(v_nombre,v_apellido,v_correo,v_contrasenna);
end;

--ACTUALIZAR

create or replace procedure actualizarcliente (
id_cliente in NUMBER,
nombre in VARCHAR2,
apellido in VARCHAR2,
correo in VARCHAR2,
contrasenna in VARCHAR2
)
is
v_id_cliente NUMBER;
v_nombre VARCHAR2;
v_apellido in VARCHAR2;
v_correo VARCHAR2;
v_contrasenna VARCHAR2;

BEGIN
v_id_cliente := id_cliente;
v_nombre  := nombre;
v_apellido  := apellido;
v_correo := correo;
v_contrasenna := contrasenna;

    update cliente set
    nombre = v_nombre,
    apellido = v_apellido,
    correo = v_correo,
    contrasenna = v_contrasenna
    where id_cliente = v_id_cliente;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

-- BORRAR

create or replace procedure borrarcliente (
id_cliente in NUMBER)
is
v_id_cliente NUMBER;

BEGIN
    v_id_cliente := id_cliente;
    delete from cliente where id_cliente = v_id_cliente;
end;

---------------------------------------------------------------
-- MESERO

-- LISTAR


create or replace procedure listarMeseros (registros out sys_refcursor)
as
begin
    open registros for select * from meseros;
end;

-- AGREGAR

create or replace procedure insertarMesero (
v_nombre in VARCHAR2,
v_correo in VARCHAR2,
v_contrasenna in VARCHAR2
)
AS
begin
    insert into mesero (
    nombre,
    correo,
    contrasenna,
    ) values(v_nombre,v_correo,v_contrasenna);
end;

--ACTUALIZAR

create or replace procedure actualizarMesero (
id_mesero in NUMBER,
nombre in VARCHAR2,
correo in VARCHAR2,
contrasenna in VARCHAR2
)
is
v_id_mesero NUMBER;
v_nombre VARCHAR2;
v_correo VARCHAR2;
v_contrasenna VARCHAR2;

BEGIN
v_id_mesero := id_mesero;
v_nombre  := nombre;
v_correo := correo;
v_contrasenna := contrasenna;

    update mesero set
    nombre = v_nombre,
    correo = v_correo,
    contrasenna = v_contrasenna
    where id_mesero = v_id_mesero;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

-- BORRAR

create or replace procedure borrarMesero (
id_mesero in NUMBER)
is
v_id_mesero NUMBER;

BEGIN
    v_id_mesero := id_mesero;
    delete from cliente where id_mesero = v_id_mesero;
end;

---------------------------------------------------------------
-- MESA

-- LISTAR

create or replace procedure listarMesas (registros out sys_refcursor)
as
begin
    open registros for select * from mesa;
end;

-- AGREGAR

create or replace procedure insertarMesas (
V_capacidad in NUMBER,
V_sector in VARCHAR2,
V_estado in NUMBER
)
AS
begin
    insert into MESA (
    CAPACIDAD,
    SECTOR,
    ESTADO,
    ) values(V_capacidad,V_sector,V_estado);
end;

--ACTUALIZAR

create or replace procedure actualizarMesas (
id_mesa in NUMBER,
capacidad in NUMBER,
sector in VARCHAR2,
estado in NUMBER
)
is
v_id_mesa NUMBER;
v_capacidad VARCHAR2;
v_sector NUMBER;
v_estado NUMBER;

BEGIN
v_id_mesa := id_mesa;
v_capacidad  := capacidad;
v_sector := sector;
v_estado := estado;

    update mesa set
    capacidad = v_capacidad,
    sector = v_sector,
    estado = v_estado
    where id_mesa = v_id_mesa;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

-- BORRAR

create or replace procedure borrarMesas (
id_mesa in NUMBER)
is
v_id_mesa NUMBER;

BEGIN
    v_id_mesa := id_mesa;
    delete from mesa where id_mesa = v_id_mesa;
end;

---------------------------------------------------------------
-- MEDIO DE PAGO

-- LISTAR

create or replace procedure listarMediopago (registros out sys_refcursor)
as
begin
    open registros for select * from mediopago;
end;

-- AGREGAR

create or replace procedure insertarMediopago (
v_nombre in VARCHAR2,
v_estado in NUMBER
)
AS
begin
    insert into mediopago (
    nombre,
    estado
    ) values(v_nombre,v_estado);
end;

--ACTUALIZAR

create or replace procedure actualizarMediopago (
id_mediopago in NUMBER,
nombre in VARCHAR2,
estado in NUMBER
)
is
v_id_mediopago NUMBER;
v_nombre VARCHAR2;
v_estado NUMBER;

BEGIN
v_id_mediopago := id_mediopago;
v_nombre  := nombre;
v_estado := estado;

    update mediopago set
    nombre = v_nombre,
    estado = v_estado
    where id_mediopago = v_id_mediopago;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

-- BORRAR

create or replace procedure borrarMediopago (
id_mediopago in NUMBER)
is
v_id_mediopago NUMBER;

BEGIN
    v_id_mediopago := id_mediopago;
    delete from mediopago where id_mediopago = v_id_mediopago;
end;

---------------------------------------------------------------
-- INSUMO

-- LISTAR

create or replace procedure listarInsumos (registros out sys_refcursor)
as
begin
    open registros for select * from insumo;
end;

-- AGREGAR

create or replace procedure insertarInsumo (
v_nombre in VARCHAR2,
v_tipo in VARCHAR2,
v_cantidad in NUMBER
)
AS
begin
    insert into insumo (
    nombre,
    tipo,
    cantidad
    ) values(v_nombre,v_tipo,v_cantidad);
end;

--ACTUALIZAR

create or replace procedure actualizarInsumo (
id_insumo in NUMBER,
nombre in VARCHAR2,
tipo in VARCHAR2,
cantidad in NUMBER
)
is
v_id_insumo NUMBER;
v_nombre VARCHAR2;
v_tipo VARCHAR2;
v_cantidad NUMBER;

BEGIN
v_id_insumo := id_insumo;
v_nombre  := nombre;
v_tipo := tipo;
v_cantidad := cantidad;


    update insumo set
    nombre = v_nombre,
    tipo = v_tipo,
    cantidad = v_cantidad
    where id_insumo = v_id_insumo;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

-- BORRAR

create or replace procedure borrarInsumo (
id_insumo in NUMBER)
is
v_id_insumo NUMBER;

BEGIN
    v_id_insumo := id_insumo;
    delete from insumo where id_insumo = v_id_insumo;
end;

---------------------------------------------------------------
-- PREPARACION

-- LISTAR

create or replace procedure listarPreparaciones (registros out sys_refcursor)
as
begin
    open registros for select * from preparacion;
end;

-- AGREGAR

create or replace procedure insertarPreparaciones (
v_nombre in VARCHAR2,
v_precio in NUMBER,
v_estado in NUMBER
)
AS
begin
    insert into preparacion (
    nombre,
    precio,
    estado
    ) values(v_nombre,v_precio,v_estado);
end;

--ACTUALIZAR

create or replace procedure actualizarInsumo (
id_preparacion in NUMBER,
nombre in VARCHAR2,
precio in NUMBER,
estado in NUMBER
)
is
v_id_preparacion NUMBER;
v_nombre VARCHAR2;
v_precio NUMBER;
v_estado NUMBER;

BEGIN
v_id_preparacion := id_preparacion;
v_nombre  := nombre;
v_precio := precio;
v_estado := estado;


    update preparacion set
    nombre = v_nombre,
    precio = v_precio,
    estado = v_estado
    where id_preparacion = v_id_preparacion;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

-- BORRAR

create or replace procedure borrarInsumo (
id_preparacion in NUMBER)
is
v_id_preparacion NUMBER;

BEGIN
    v_id_preparacion := id_preparacion;
    delete from preparacion where id_preparacion = v_id_preparacion;
end;

---------------------------------------------------------------
-- RECETA

-- LISTAR

create or replace procedure listarRecetas (registros out sys_refcursor)
as
begin
    open registros for select * from receta;
end;

-- AGREGAR

create or replace procedure insertarRecetas (
v_insumo_id_insumo in NUMBER,
v_preparacion_id_preparacion in NUMBER
)
AS
begin
    insert into receta (
    insumo_id_insumo,
    preparacion_id_preparacion
    ) values(v_insumo_id_insumo,v_preparacion_id_preparacion);
end;

--ACTUALIZAR

create or replace procedure actualizarRecetas (
id_receta in NUMBER,
insumo_id_insumo in NUMBER,
preparacion_id_preparacion in NUMBER
)
is
v_id_receta NUMBER;
v_insumo_id_insumo NUMBER;
v_preparacion_id_preparacion NUMBER;

BEGIN
v_id_receta := id_receta;
v_insumo_id_insumo  := insumo_id_insumo;
v_preparacion_id_preparacion := preparacion_id_preparacion;

    update receta set
    insumo_id_insumo = v_insumo_id_insumo,
    preparacion_id_preparacion = v_preparacion_id_preparacion
    where id_receta = v_id_receta;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

-- BORRAR
create or replace procedure borrarRecetas (
preparacion_id_preparacion in NUMBER)
is
v_preparacion_id_preparacion NUMBER;

BEGIN
    v_preparacion_id_preparacion := preparacion_id_preparacion;
    delete from receta where preparacion_id_preparacion = v_preparacion_id_preparacion;
end;

---------------------------------------------------------------
-- RESERVA

-- LISTAR

create or replace procedure listarReservas (registros out sys_refcursor)
as
begin
    open registros for select * from reserva;
end;

-- AGREGAR

create or replace procedure insertarReservas (
v_fecha in DATE,
v_mesa_id_mesa in NUMBER,
v_cliente_id_cliente in NUMBER
)
AS
begin
    insert into reserva (
    fecha,
    mesa_id_mesa,
    cliente_id_cliente
    ) values(v_fecha,v_mesa_id_mesa,v_cliente_id_cliente);
end;

--ACTUALIZAR

create or replace procedure actualizarReservas (
id_reserva in NUMBER,
fecha in DATE,
mesa_id_mesa in NUMBER,
cliente_id_cliente in NUMBER
)
is
v_id_reserva NUMBER;
v_fecha DATE;
v_mesa_id_mesa NUMBER;
v_cliente_id_cliente NUMBER;

BEGIN
v_id_reserva := id_reserva;
v_fecha  := fecha;
v_mesa_id_mesa := mesa_id_mesa;
v_cliente_id_cliente := cliente_id_cliente;


    update RESERVA set
    fecha = v_fecha,
    mesa_id_mesa = v_mesa_id_mesa,
    cliente_id_cliente = v_cliente_id_cliente
    where id_reserva = v_id_reserva;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

-- BORRAR

create or replace procedure borrarReservas (
id_reserva in NUMBER)
is
v_id_reserva NUMBER;

BEGIN
    v_id_reserva := id_reserva;
    delete from reserva where id_reserva = v_id_reserva;
end;

---------------------------------------------------------------
-- PEDIDO

-- LISTAR

create or replace procedure listarPedidos (registros out sys_refcursor)
as
begin
    open registros for select * from pedido;
end;

-- AGREGAR

create or replace procedure insertarPedidos (
v_fecha in DATE,
v_comentario in VARCHAR2,
v_mesero_id_mesero in NUMBER,
v_reserva_id_reserva in NUMBER,
v_preparacion_id_preparacion in NUMBER
)
AS
begin
    insert into pedido (
    fecha,
    comentario,
    mesero_id_mesero,
    reserva_id_reserva,
    preparacion_id_preparacion
    ) values(v_fecha,v_comentario,v_mesero_id_mesero,v_reserva_id_reserva,v_preparacion_id_preparacion);
end;

--ACTUALIZAR
/*
create or replace procedure actualizarPedido (
id_preparacion in NUMBER,
nombre in VARCHAR2,
precio in NUMBER,
estado in NUMBER
)
is
v_id_preparacion NUMBER;
v_nombre VARCHAR2;
v_precio NUMBER;
v_estado NUMBER;

BEGIN
v_id_preparacion := id_preparacion;
v_nombre  := nombre;
v_precio := precio;
v_estado := estado;


    update preparacion set
    nombre = v_nombre,
    precio = v_precio,
    estado = v_estado
    where id_preparacion = v_id_preparacion;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;
*/

-- BORRAR

create or replace procedure borrarPedidos (
id_pedido in NUMBER)
is
v_id_pedido NUMBER;

BEGIN
    v_id_pedido := id_pedido;
    delete from pedido where id_pedido = v_id_pedido;
end;

---------------------------------------------------------------
-- BOLETA

-- LISTAR

create or replace procedure listarBoletas (registros out sys_refcursor)
as
begin
    open registros for select * from boleta;
end;

-- AGREGAR

create or replace procedure insertarBoletas (
v_MontoTotal in NUMBER,
v_ID_MedioPago in NUMBER,
v_ID_Pedido in NUMBER
)
AS
begin
    insert into boleta (
    montototal,
    id_mediopago,
    id_pedido
    ) values(v_MontoTotal,v_ID_MedioPago,v_ID_Pedido);
end;

--ACTUALIZAR

create or replace procedure actualizarBoleta (
id_boleta in NUMBER,
v_MontoTotal in NUMBER,
v_ID_MedioPago in NUMBER,
v_ID_Pedido in NUMBER
)
is
v_id_boleta NUMBER;
v_MontoTotal in NUMBER;
v_ID_MedioPago in NUMBER;
v_ID_Pedido in NUMBER;

BEGIN
v_id_cliente := id_cliente;
v_MontoTotal := montototal;
v_ID_MedioPago := id_mediopago;
v_ID_Pedido := id_pedido;

    update boleta set
    montototal = v_MontoTotal,
    id_mediopago = v_ID_MedioPago,
    id_pedido = v_ID_Pedido
    where id_cliente = v_id_cliente;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarBoletas (
id_boleta in NUMBER)
is
v_id_boleta NUMBER;

BEGIN
    v_id_boleta := id_boleta;
    delete from boleta where id_boleta = v_id_boleta;
end;

/*
--ACTUALIZAR

create or replace procedure actualizarInsumo (
id_preparacion in NUMBER,
nombre in VARCHAR2,
precio in NUMBER,
estado in NUMBER
)
is
v_id_preparacion NUMBER;
v_nombre VARCHAR2;
v_precio NUMBER;
v_estado NUMBER;

BEGIN
v_id_preparacion := id_preparacion;
v_nombre  := nombre;
v_precio := precio;
v_estado := estado;


    update preparacion set
    nombre = v_nombre,
    precio = v_precio,
    estado = v_estado
    where id_preparacion = v_id_preparacion;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;
*/

-- BORRAR

