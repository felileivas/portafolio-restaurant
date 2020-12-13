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
MontoTotal in NUMBER,
ID_MedioPago in NUMBER,
ID_Pedido in NUMBER
)
is
v_id_boleta NUMBER;
v_MontoTotal NUMBER;
v_ID_MedioPago NUMBER;
v_ID_Pedido NUMBER;

BEGIN
    v_id_boleta := id_boleta;
    v_MontoTotal := montototal;
    v_ID_MedioPago := id_mediopago;
    v_ID_Pedido := id_pedido;

    update boleta set
    montototal = v_MontoTotal,
    id_mediopago = v_ID_MedioPago,
    id_pedido = v_ID_Pedido
    where id_boleta = v_id_boleta;
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

---------------------------------------------------------------
-- Insumo

-- LISTAR

create or replace procedure listarInsumos (registros out sys_refcursor)
as
begin
    open registros for select * from insumo;
end;

-- AGREGAR

create or replace procedure insertarInsumos (
v_nombre in VARCHAR2,
v_tipo in VARCHAR2,
v_stock in NUMBER
)
AS
begin
    insert into insumo (
    nombre,
    tipo,
    stock
    ) values(v_nombre,v_tipo,v_stock);
end;

--ACTUALIZAR

create or replace procedure actualizarInsumo (
id_insumo in NUMBER,
nombre in VARCHAR2,
tipo in VARCHAR2,
stock in NUMBER
)
is
v_id_insumo NUMBER;
v_nombre VARCHAR2;
v_tipo VARCHAR2;
v_stock NUMBER;

BEGIN
    v_id_insumo := id_insumo;
    v_nombre := nombre;
    v_tipo := tipo;
    v_stock := stock;

    update insumo set
    nombre = v_nombre,
    tipo = v_tipo,
    stock = v_stock
    where id_insumo = v_id_insumo;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarInsumos (
id_insumo in NUMBER)
is
v_id_insumo NUMBER;

BEGIN
    v_id_insumo := id_insumo;
    delete from insumo where id_insumo = v_id_insumo;
end;

---------------------------------------------------------------
-- MedioPago

-- LISTAR

create or replace procedure listarMedioPagos (registros out sys_refcursor)
as
begin
    open registros for select * from MedioPago;
end;

-- AGREGAR

create or replace procedure insertarMedioPagos (
v_nombre in VARCHAR2,
v_estado in NUMBER
)
AS
begin
    insert into MedioPago (
    nombre,
    estado
    ) values(v_nombre,v_estado);
end;

--ACTUALIZAR

create or replace procedure actualizarMedioPago (
id_MedioPago in NUMBER,
nombre in VARCHAR2,
estado in NUMBER
)
is
v_id_MedioPago NUMBER;
v_nombre VARCHAR2;
v_estado NUMBER;

BEGIN
    v_id_MedioPago := id_MedioPago;
    v_nombre := nombre;
    v_estado := estado;

    update MedioPago set
    nombre = v_nombre,
    estado = v_estado
    where id_MedioPago = v_id_MedioPago;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarMedioPagos (
id_MedioPago in NUMBER)
is
v_id_MedioPago NUMBER;

BEGIN
    v_id_MedioPago := id_MedioPago;
    delete from MedioPago where id_MedioPago = v_id_MedioPago;
end;

---------------------------------------------------------------
-- MenuCategoria

-- LISTAR

create or replace procedure listarMenuCategorias (registros out sys_refcursor)
as
begin
    open registros for select * from MenuCategoria;
end;

-- AGREGAR

create or replace procedure insertarMenuCategorias (
v_nombre in VARCHAR2
)
AS
begin
    insert into MenuCategoria (
    nombre
    ) values(v_nombre);
end;

--ACTUALIZAR

create or replace procedure actualizarMenuCategoria (
id_MenuCategoria in NUMBER,
nombre in VARCHAR2
)
is
v_id_MenuCategoria NUMBER;
v_nombre VARCHAR2;

BEGIN
    v_id_MenuCategoria := id_MenuCategoria;
    v_nombre := nombre;

    update MenuCategoria set
    nombre = v_nombre
    where id_MenuCategoria = v_id_MenuCategoria;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarMenuCategorias (
id_MenuCategoria in NUMBER)
is
v_id_MenuCategoria NUMBER;

BEGIN
    v_id_MenuCategoria := id_MenuCategoria;
    delete from MenuCategoria where id_MenuCategoria = v_id_MenuCategoria;
end;

---------------------------------------------------------------
-- MenuItem

-- LISTAR

create or replace procedure listarMenuItems (registros out sys_refcursor)
as
begin
    open registros for select * from MenuItem;
end;

-- AGREGAR

create or replace procedure insertarMenuItems (
v_nombre in VARCHAR2,
v_Precio in NUMBER,
v_Estado in NUMBER,
v_ID_MenuCategoria in NUMBER
)
AS
begin
    insert into MenuItem (
    nombre,
    precio,
    estado,
    id_menucategoria
    ) values(v_nombre,v_Precio,v_Estado,v_ID_MenuCategoria);
end;

--ACTUALIZAR

create or replace procedure actualizarMenuItem (
id_MenuItem in NUMBER,
nombre in VARCHAR2,
Precio in NUMBER,
Estado in NUMBER,
ID_MenuCategoria in NUMBER
)
is
v_id_MenuItem NUMBER;
v_nombre VARCHAR2;
v_Precio NUMBER;
v_Estado NUMBER;
v_ID_MenuCategoria NUMBER;

BEGIN
    v_id_MenuItem := id_MenuItem;
    v_nombre := nombre;
    v_Precio := Precio;
    v_Estado := Estado;
    v_ID_MenuCategoria := ID_MenuCategoria;

    update MenuItem set
    nombre = v_nombre,
    Precio = v_Precio,
    Estado = v_Estado,
    ID_MenuCategoria = v_ID_MenuCategoria
    where id_MenuItem = v_id_MenuItem;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarMenuItems (
id_MenuItem in NUMBER)
is
v_id_MenuItem NUMBER;

BEGIN
    v_id_MenuItem := id_MenuItem;
    delete from MenuItem where id_MenuItem = v_id_MenuItem;
end;

---------------------------------------------------------------
-- Mesa

-- LISTAR

create or replace procedure listarMesas (registros out sys_refcursor)
as
begin
    open registros for select * from Mesa;
end;

-- AGREGAR

create or replace procedure insertarMesas (
v_capacidad in NUMBER,
v_sector in VARCHAR2,
v_estado in NUMBER
)
AS
begin
    insert into Mesa (
    capacidad,
    sector,
    estado
    ) values(v_capacidad,v_sector,v_estado);
end;

--ACTUALIZAR

create or replace procedure actualizarMesa (
NumeroMesa in NUMBER,
capacidad in NUMBER,
sector in VARCHAR2,
estado in NUMBER
)
is
v_NumeroMesa NUMBER;
v_capacidad NUMBER;
v_sector VARCHAR2;
v_estado NUMBER;

BEGIN
    v_NumeroMesa := NumeroMesa;
    v_capacidad := capacidad;
    v_sector := sector;
    v_estado := estado;

    update Mesa set
    capacidad = v_capacidad,
    sector = v_sector,
    v_estado = v_estado
    where NumeroMesa = v_NumeroMesa;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarMesas (
NumeroMesa in NUMBER)
is
v_NumeroMesa NUMBER;

BEGIN
    v_NumeroMesa := NumeroMesa;
    delete from Mesa where NumeroMesa = v_NumeroMesa;
end;

---------------------------------------------------------------
-- Pedido

-- LISTAR

create or replace procedure listarPedidos (registros out sys_refcursor)
as
begin
    open registros for select * from Pedido;
end;

-- AGREGAR

create or replace procedure insertarPedidos (
v_fechapedido in DATE,
v_numeromesa in NUMBER,
v_id_trabajador in NUMBER,
v_id_cliente in NUMBER
)
AS
begin
    insert into Pedido (
    fechapedido,
    numeromesa,
    id_trabajador,
    id_cliente
    ) values(v_fechapedido,v_numeromesa,v_id_trabajador,v_id_cliente);
end;

--ACTUALIZAR

create or replace procedure actualizarPedido (
id_Pedido in NUMBER,
fechapedido in DATE,
numeromesa in NUMBER,
id_trabajador in NUMBER,
id_cliente in NUMBER
)
is
v_id_Pedido NUMBER;
v_fechapedido DATE;
v_numeromesa NUMBER;
v_id_trabajador NUMBER;
v_id_cliente NUMBER;

BEGIN
    v_id_Pedido := id_Pedido;
    v_fechapedido := fechapedido;
    v_numeromesa := numeromesa;
    v_id_trabajador := id_trabajador;
    v_id_cliente := id_cliente;

    update Pedido set
    fechapedido = v_fechapedido,
    numeromesa = v_numeromesa,
    id_trabajador = v_id_trabajador,
    id_cliente = v_id_cliente

    where id_Pedido = v_id_Pedido;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarPedidos (
id_Pedido in NUMBER)
is
v_id_Pedido NUMBER;

BEGIN
    v_id_Pedido := id_Pedido;
    delete from Pedido where id_Pedido = v_id_Pedido;
end;

---------------------------------------------------------------
-- Reserva

-- LISTAR

create or replace procedure listarReservas (registros out sys_refcursor)
as
begin
    open registros for select * from Reserva;
end;

-- AGREGAR

create or replace procedure insertarReservas (
v_fechareserva in DATE,
v_horareserva in VARCHAR2,
v_numeromesa in NUMBER,
v_estadoreserva in NUMBER,
v_id_cliente in NUMBER
)
AS
begin
    insert into Reserva (
    fechareserva,
    horareserva,
    numeromesa,
    estadoreserva,
    id_cliente
    ) values(v_fechareserva,v_horareserva,v_numeromesa,v_estadoreserva,v_id_cliente);
end;

--ACTUALIZAR

create or replace procedure actualizarReserva (
id_Reserva in NUMBER,
fechareserva in DATE,
horareserva in VARCHAR2,
numeromesa in NUMBER,
estadoreserva in NUMBER,
id_cliente in NUMBER
)
is
v_id_Reserva NUMBER;
v_fechareserva DATE;
v_horareserva VARCHAR2;
v_numeromesa NUMBER;
v_estadoreserva NUMBER;
v_id_cliente NUMBER;

BEGIN
    v_id_Reserva := id_Reserva;
    v_fechareserva := fechareserva;
    v_horareserva := horareserva;
    v_numeromesa := numeromesa;
    v_estadoreserva := estadoreserva;
    v_id_cliente := id_cliente;

    update Reserva set
    fechareserva = v_fechareserva,
    horareserva = v_horareserva,
    numeromesa = v_numeromesa,
    estadoreserva = v_estadoreserva,
    id_cliente = v_id_cliente

    where id_Reserva = v_id_Reserva;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarReservas (
id_Reserva in NUMBER)
is
v_id_Reserva NUMBER;

BEGIN
    v_id_Reserva := id_Reserva;
    delete from Reserva where id_Reserva = v_id_Reserva;
end;

---------------------------------------------------------------
-- RolTrabajador

-- LISTAR

create or replace procedure listarRolTrabajador (registros out sys_refcursor)
as
begin
    open registros for select * from RolTrabajador;
end;

-- AGREGAR

create or replace procedure insertarRolTrabajador (
v_descripcionrol in VARCHAR2
)
AS
begin
    insert into RolTrabajador (
    descripcionrol
    ) values(v_descripcionrol);
end;

--ACTUALIZAR

create or replace procedure actualizarRolTrabajador (
ID_Rol in NUMBER,
descripcionrol in VARCHAR2
)
is
v_ID_Rol NUMBER;
v_descripcionrol VARCHAR2;

BEGIN
v_ID_Rol := ID_Rol;
v_descripcionrol := descripcionrol;

    update RolTrabajador set
    descripcionrol = v_descripcionrol

    where ID_Rol = v_ID_Rol;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarRolTrabajador (
ID_Rol in NUMBER)
is
v_ID_Rol NUMBER;

BEGIN
    v_ID_Rol := ID_Rol;
    delete from RolTrabajador where ID_Rol = v_ID_Rol;
end;

---------------------------------------------------------------
-- Trabajador

-- LISTAR

create or replace procedure listarTrabajador (registros out sys_refcursor)
as
begin
    open registros for select * from Trabajador;
end;

-- AGREGAR

create or replace procedure insertarTrabajador (
v_nombre in VARCHAR2,
v_apellido in VARCHAR2,
v_correo in VARCHAR2,
v_contrasenna in VARCHAR2,
v_id_rol in NUMBER
)
AS
begin
    insert into RolTrabajador (
    nombre,
    apellido,
    correo,
    contrasenna,
    id_rol
    ) values(v_nombre, v_apellido, v_correo, v_contrasenna, v_id_rol);
end;

--ACTUALIZAR

create or replace procedure actualizarTrabajador (
ID_Trabajador in NUMBER,
Nombre in VARCHAR2,
Apellido in VARCHAR2,
Correo in VARCHAR2,
Contrasenna in VARCHAR2,
ID_Rol in NUMBER
)
is
v_ID_Trabajador NUMBER;
v_nombre VARCHAR2;
v_apellido VARCHAR2;
v_correo VARCHAR2;
v_contrasenna VARCHAR2;
v_id_rol NUMBER;

BEGIN
    v_ID_Trabajador := ID_Trabajador;
    v_nombre := Nombre;
    v_apellido := Apellido;
    v_correo := Correo;
    v_contrasenna := Contrasenna;
    v_id_rol := ID_Rol;

    update Trabajador set
    Nombre = v_nombre,
    Apellido = v_apellido,
    Correo = v_correo,
    Contrasenna = v_contrasenna,
    ID_Rol = v_id_rol

    where ID_Trabajador = v_ID_Trabajador;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarTrabajador (
ID_Trabajador in NUMBER)
is
v_ID_Trabajador NUMBER;

BEGIN
    v_ID_Trabajador := ID_Trabajador;
    delete from Trabajador where ID_Trabajador = v_ID_Trabajador;
end;

---------------------------------------------------------------
-- SolicitudInsumo

-- LISTAR

create or replace procedure listarSolicitudInsumo (registros out sys_refcursor)
as
begin
    open registros for select * from SolicitudInsumo;
end;

-- AGREGAR

create or replace procedure insertarSolicitudInsumo (
v_fechasolicitud in DATE,
v_estado in NUMBER,
v_comentario in VARCHAR2,
v_id_trabajador in NUMBER
)
AS
begin
    insert into SolicitudInsumo (
    fechasolicitud,
    estado,
    comentario,
    id_trabajador
    ) values(v_fechasolicitud, v_estado, v_comentario, v_id_trabajador);
end;

--ACTUALIZAR

create or replace procedure actualizarSolicitudInsumo (
ID_Solicitud in NUMBER,
fechasolicitud in DATE,
estado in NUMBER,
comentario in VARCHAR2,
id_trabajador in NUMBER
)
is
v_ID_Solicitud NUMBER;
v_fechasolicitud DATE;
v_estado NUMBER;
v_comentario VARCHAR2;
v_id_trabajador NUMBER;

BEGIN
    v_ID_Solicitud := ID_Solicitud;
    v_fechasolicitud := fechasolicitud;
    v_estado := estado;
    v_comentario := comentario;
    v_id_trabajador := id_trabajador;

    update SolicitudInsumo set
    fechasolicitud = v_fechasolicitud,
    estado = v_estado,
    comentario = v_comentario,
    id_trabajador = v_id_trabajador

    where ID_Solicitud = v_ID_Solicitud;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarSolicitudInsumo (
ID_Solicitud in NUMBER)
is
v_ID_Solicitud NUMBER;

BEGIN
    v_ID_Solicitud := ID_Solicitud;
    delete from SolicitudInsumo where ID_Solicitud = v_ID_Solicitud;
end;

---------------------------------------------------------------
-- Insumo_Solicitud

-- LISTAR

create or replace procedure listarInsumo_Solicitud (registros out sys_refcursor)
as
begin
    open registros for select * from Insumo_Solicitud;
end;

-- AGREGAR

create or replace procedure insertarInsumo_Solicitud (
v_id_solicitud in NUMBER,
v_id_insumo in NUMBER,
v_cantidadsolicitada in NUMBER
)
AS
begin
    insert into Insumo_Solicitud (
    id_solicitud,
    id_insumo,
    cantidadsolicitada
    ) values(v_id_solicitud, v_id_insumo, v_cantidadsolicitada);
end;

--ACTUALIZAR

create or replace procedure actualizarInsumo_Solicitud (
ID_Solicitud in NUMBER,
ID_Insumo in NUMBER,
CantidadSolicitada in NUMBER
)
is
v_ID_Solicitud NUMBER;
v_ID_Insumo NUMBER;
v_CantidadSolicitada NUMBER;

BEGIN
    v_ID_Solicitud := ID_Solicitud;
    v_ID_Insumo := ID_Insumo;
    v_CantidadSolicitada := CantidadSolicitada;

    update Insumo_Solicitud set
    CantidadSolicitada = v_CantidadSolicitada

    where ID_Solicitud = v_ID_Solicitud
    and ID_Insumo = v_ID_Insumo;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarInsumo_Solicitud (
ID_Solicitud in NUMBER,
ID_Insumo in NUMBER)
is
v_ID_Solicitud NUMBER;
v_ID_Insumo NUMBER;

BEGIN
    v_ID_Solicitud := ID_Solicitud;
    v_ID_Insumo := ID_Insumo;
    delete from Insumo_Solicitud where ID_Solicitud = v_ID_Solicitud and ID_Insumo = v_ID_Insumo;
end;

---------------------------------------------------------------
-- PedidoMenuItem

-- LISTAR

create or replace procedure listarPedidoMenuItem (registros out sys_refcursor)
as
begin
    open registros for select * from PedidoMenuItem;
end;

-- AGREGAR

create or replace procedure insertarPedidoMenuItem (
v_id_pedido in NUMBER,
v_id_menuitem in NUMBER,
v_cantidad in NUMBER,
v_comentario in NUMBER
)
AS
begin
    insert into PedidoMenuItem (
    id_pedido,
    id_menuitem,
    cantidad,
    comentario
    ) values(v_id_pedido, v_id_menuitem, v_cantidad, v_comentario);
end;

--ACTUALIZAR

create or replace procedure actualizarPedidoMenuItem (
ID_Pedido in NUMBER,
ID_MenuItem in NUMBER,
Cantidad in NUMBER,
Comentario in NUMBER
)
is
v_ID_Pedido NUMBER;
v_ID_MenuItem NUMBER;
v_Cantidad NUMBER;
v_Comentario NUMBER;

BEGIN
    v_ID_Pedido := ID_Pedido;
    v_ID_MenuItem := ID_MenuItem;
    v_Cantidad := Cantidad;
    v_Comentario := Comentario;

    update PedidoMenuItem set
    Cantidad = v_Cantidad,
    Comentario = v_Comentario

    where ID_Pedido = v_ID_Pedido 
    and ID_MenuItem = v_ID_MenuItem;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarPedidoMenuItem (
ID_Pedido in NUMBER,
ID_MenuItem in NUMBER)
is
v_ID_Pedido NUMBER;
v_ID_MenuItem NUMBER;

BEGIN
    v_ID_Pedido := ID_Pedido;
    v_ID_MenuItem := ID_MenuItem;
    delete from PedidoMenuItem where ID_Pedido = v_ID_Pedido and ID_MenuItem = v_ID_MenuItem;
end;

---------------------------------------------------------------
-- MenuItemInsumo

-- LISTAR

create or replace procedure listarMenuItemInsumo (registros out sys_refcursor)
as
begin
    open registros for select * from MenuItemInsumo;
end;

-- AGREGAR

create or replace procedure insertarMenuItemInsumo (
v_id_menuitem in NUMBER,
v_id_insumo in NUMBER,
v_cantidad in NUMBER,
v_comentario in NUMBER
)
AS
begin
    insert into MenuItemInsumo (
    id_menuitem,
    id_insumo,
    cantidad,
    comentario
    ) values(v_id_menuitem, v_id_insumo, v_cantidad, v_comentario);
end;

--ACTUALIZAR

create or replace procedure actualizarMenuItemInsumo (
ID_MenuItem in NUMBER,
ID_Insumo in NUMBER,
Cantidad in NUMBER,
Comentario in NUMBER
)
is
v_id_MenuItem NUMBER;
v_ID_Insumo NUMBER;
v_Cantidad NUMBER;
v_Comentario NUMBER;

BEGIN
    v_ID_MenuItem := ID_MenuItem;
    v_ID_Insumo := ID_Insumo;
    v_Cantidad := Cantidad;
    v_Comentario := Comentario;

    update MenuItemInsumo set
    Cantidad = v_Cantidad,
    Comentario = v_Comentario

    where ID_MenuItem = v_ID_MenuItem 
    and ID_Insumo = v_ID_Insumo;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

--BORRAR
create or replace procedure borrarMenuItemInsumo (
ID_MenuItem in NUMBER,
ID_Insumo in NUMBER
)
is
v_ID_MenuItem NUMBER;
v_ID_Insumo NUMBER;


BEGIN
    v_ID_MenuItem := ID_MenuItem;
    v_ID_Insumo := ID_Insumo;
    delete from PedidoMenuItem where ID_MenuItem = v_ID_MenuItem and ID_Insumo = v_ID_Insumo;
end;