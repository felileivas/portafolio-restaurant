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
    where id_boleta = v_id_cliente;
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