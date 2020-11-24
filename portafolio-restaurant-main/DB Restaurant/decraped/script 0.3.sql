CREATE TABLE boleta (
    id_boleta               NUMBER NOT NULL,
    fecha                   DATE NOT NULL,
    montototal              NUMBER NOT NULL,
    mediopago_id_mediopago  NUMBER NOT NULL,
    pedido_id_pedido        NUMBER NOT NULL
);

ALTER TABLE boleta ADD CONSTRAINT boleta_pk PRIMARY KEY ( id_boleta );

CREATE TABLE insumo (
    id_insumo  NUMBER NOT NULL,
    nombre     VARCHAR2(50) NOT NULL,
    tipo       VARCHAR2(50) NOT NULL,
    cantidad   NUMBER NOT NULL
);

ALTER TABLE insumo ADD CONSTRAINT insumo_pk PRIMARY KEY ( id_insumo );

CREATE TABLE mediopago (
    id_mediopago  NUMBER NOT NULL,
    nombre        VARCHAR2(50) NOT NULL,
    estado        NUMBER NOT NULL
);

ALTER TABLE mediopago ADD CONSTRAINT mediopago_pk PRIMARY KEY ( id_mediopago );

CREATE TABLE mesa (
    id_mesa    NUMBER NOT NULL,
    capacidad  NUMBER NOT NULL,
    sector     VARCHAR2(50),
    estado     NUMBER NOT NULL
);

ALTER TABLE mesa ADD CONSTRAINT mesa_pk PRIMARY KEY ( id_mesa );

CREATE TABLE mesero (
    id_mesero    NUMBER NOT NULL,
    nombre       VARCHAR2(50) NOT NULL,
    correo       VARCHAR2(100) NOT NULL,
    contrasenna  VARCHAR2(50) NOT NULL
);

ALTER TABLE mesero ADD CONSTRAINT mesero_pk PRIMARY KEY ( id_mesero );

CREATE TABLE pedido (
    id_pedido                   NUMBER NOT NULL,
    fecha                       DATE NOT NULL,
    comentario                  VARCHAR2(50),
    mesero_id_mesero            NUMBER NOT NULL,
    reserva_id_reserva          NUMBER NOT NULL,
    preparacion_id_preparacion  NUMBER NOT NULL
);

ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( id_pedido );

CREATE TABLE preparacion (
    id_preparacion  NUMBER NOT NULL,
    nombre          VARCHAR2(50) NOT NULL,
    precio          NUMBER NOT NULL,
    estado          NUMBER NOT NULL
);

ALTER TABLE preparacion ADD CONSTRAINT preparacion_pk PRIMARY KEY ( id_preparacion );

CREATE TABLE receta (
    id_receta                   NUMBER NOT NULL,
    insumo_id_insumo            NUMBER NOT NULL,
    preparacion_id_preparacion  NUMBER NOT NULL
);

ALTER TABLE receta ADD CONSTRAINT receta_pk PRIMARY KEY ( id_receta );

CREATE TABLE reserva (
    id_reserva          NUMBER NOT NULL,
    fecha               DATE NOT NULL,
    mesa_id_mesa        NUMBER NOT NULL,
    usuario_id_usuario  NUMBER NOT NULL
);

ALTER TABLE reserva ADD CONSTRAINT reserva_pk PRIMARY KEY ( id_reserva );

CREATE TABLE usuario (
    id_usuario   NUMBER NOT NULL,
    nombre       VARCHAR2(50) NOT NULL,
    correo       VARCHAR2(50) NOT NULL,
    contrasenna  VARCHAR2(50) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE boleta
    ADD CONSTRAINT boleta_mediopago_fk FOREIGN KEY ( mediopago_id_mediopago )
        REFERENCES mediopago ( id_mediopago );

ALTER TABLE boleta
    ADD CONSTRAINT boleta_pedido_fk FOREIGN KEY ( pedido_id_pedido )
        REFERENCES pedido ( id_pedido );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_mesero_fk FOREIGN KEY ( mesero_id_mesero )
        REFERENCES mesero ( id_mesero );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_preparacion_fk FOREIGN KEY ( preparacion_id_preparacion )
        REFERENCES preparacion ( id_preparacion );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_reserva_fk FOREIGN KEY ( reserva_id_reserva )
        REFERENCES reserva ( id_reserva );

ALTER TABLE receta
    ADD CONSTRAINT receta_insumo_fk FOREIGN KEY ( insumo_id_insumo )
        REFERENCES insumo ( id_insumo );

ALTER TABLE receta
    ADD CONSTRAINT receta_preparacion_fk FOREIGN KEY ( preparacion_id_preparacion )
        REFERENCES preparacion ( id_preparacion );

ALTER TABLE reserva
    ADD CONSTRAINT reserva_mesa_fk FOREIGN KEY ( mesa_id_mesa )
        REFERENCES mesa ( id_mesa );

ALTER TABLE reserva
    ADD CONSTRAINT reserva_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );

--AUTO INCREMENTABLES

CREATE SEQUENCE boleta_id_boleta_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER boleta_id_boleta_trg BEFORE
    INSERT ON boleta
    FOR EACH ROW
    WHEN ( new.id_boleta IS NULL )
BEGIN
    :new.id_boleta := boleta_id_boleta_seq.nextval;
END;
/

CREATE SEQUENCE insumo_id_insumo_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER insumo_id_insumo_trg BEFORE
    INSERT ON insumo
    FOR EACH ROW
    WHEN ( new.id_insumo IS NULL )
BEGIN
    :new.id_insumo := insumo_id_insumo_seq.nextval;
END;
/

CREATE SEQUENCE mediopago_id_mediopago_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER mediopago_id_mediopago_trg BEFORE
    INSERT ON mediopago
    FOR EACH ROW
    WHEN ( new.id_mediopago IS NULL )
BEGIN
    :new.id_mediopago := mediopago_id_mediopago_seq.nextval;
END;
/

CREATE SEQUENCE mesa_id_mesa_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER mesa_id_mesa_trg BEFORE
    INSERT ON mesa
    FOR EACH ROW
    WHEN ( new.id_mesa IS NULL )
BEGIN
    :new.id_mesa := mesa_id_mesa_seq.nextval;
END;
/

CREATE SEQUENCE mesero_id_mesero_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER mesero_id_mesero_trg BEFORE
    INSERT ON mesero
    FOR EACH ROW
    WHEN ( new.id_mesero IS NULL )
BEGIN
    :new.id_mesero := mesero_id_mesero_seq.nextval;
END;
/

CREATE SEQUENCE pedido_id_pedido_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pedido_id_pedido_trg BEFORE
    INSERT ON pedido
    FOR EACH ROW
    WHEN ( new.id_pedido IS NULL )
BEGIN
    :new.id_pedido := pedido_id_pedido_seq.nextval;
END;
/

CREATE SEQUENCE receta_id_receta_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER receta_id_receta_trg BEFORE
    INSERT ON receta
    FOR EACH ROW
    WHEN ( new.id_receta IS NULL )
BEGIN
    :new.id_receta := receta_id_receta_seq.nextval;
END;
/

CREATE SEQUENCE reserva_id_reserva_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER reserva_id_reserva_trg BEFORE
    INSERT ON reserva
    FOR EACH ROW
    WHEN ( new.id_reserva IS NULL )
BEGIN
    :new.id_reserva := reserva_id_reserva_seq.nextval;
END;
/

CREATE SEQUENCE usuario_id_usuario_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER usuario_id_usuario_trg BEFORE
    INSERT ON usuario
    FOR EACH ROW
    WHEN ( new.id_usuario IS NULL )
BEGIN
    :new.id_usuario := usuario_id_usuario_seq.nextval;
END;
/

CREATE SEQUENCE preparacion_id_preparacion_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER preparacion_id_preparacion_trg BEFORE
    INSERT ON preparacion
    FOR EACH ROW
    WHEN ( new.id_preparacion IS NULL )
BEGIN
    :new.id_preparacion := preparacion_id_preparacion_seq.nextval;
END;
/


INSERT INTO "RESTAURANTXXI"."USUARIO" (NOMBRE, CORREO, CONTRASENNA) VALUES ('Felipe', 'felipe@usuario.cl', 'root');
INSERT INTO "RESTAURANTXXI"."USUARIO" (NOMBRE, CORREO, CONTRASENNA) VALUES ('Juan Prueba', 'juan@prueba.cl', 'toor');

INSERT INTO "RESTAURANTXXI"."MESERO" (NOMBRE, CORREO, CONTRASENNA) VALUES ('Pedro', 'pedro@mesero.cl', 'abdc1234');

INSERT INTO "RESTAURANTXXI"."MESA" (CAPACIDAD, SECTOR, ESTADO) VALUES ('4', 'Centro', '1');
INSERT INTO "RESTAURANTXXI"."MESA" (CAPACIDAD, SECTOR, ESTADO) VALUES ('6', 'Centro', '1');
INSERT INTO "RESTAURANTXXI"."MESA" (CAPACIDAD, SECTOR, ESTADO) VALUES ('2', 'Terraza', '0');

INSERT INTO "RESTAURANTXXI"."MEDIOPAGO" (NOMBRE, ESTADO) VALUES ('Efectivo', '1');
INSERT INTO "RESTAURANTXXI"."MEDIOPAGO" (NOMBRE, ESTADO) VALUES ('Tarjeta debito', '1');
INSERT INTO "RESTAURANTXXI"."MEDIOPAGO" (NOMBRE, ESTADO) VALUES ('Tarjeta credito', '1');
INSERT INTO "RESTAURANTXXI"."MEDIOPAGO" (NOMBRE, ESTADO) VALUES ('Sodexo', '0');

INSERT INTO "RESTAURANTXXI"."INSUMO" (NOMBRE, TIPO, CANTIDAD) VALUES ('Vienesa', 'Carne', '100');
INSERT INTO "RESTAURANTXXI"."INSUMO" (NOMBRE, TIPO, CANTIDAD) VALUES ('Pan de completo', 'Pan', '100');
INSERT INTO "RESTAURANTXXI"."INSUMO" (NOMBRE, TIPO, CANTIDAD) VALUES ('Tomate', 'Verdura', '100');
INSERT INTO "RESTAURANTXXI"."INSUMO" (NOMBRE, TIPO, CANTIDAD) VALUES ('Palta', 'Verdura', '100');
INSERT INTO "RESTAURANTXXI"."INSUMO" (NOMBRE, TIPO, CANTIDAD) VALUES ('Chucrut', 'Salsa', '100');
INSERT INTO "RESTAURANTXXI"."INSUMO" (NOMBRE, TIPO, CANTIDAD) VALUES ('Americana', 'Salsa', '100');
INSERT INTO "RESTAURANTXXI"."INSUMO" (NOMBRE, TIPO, CANTIDAD) VALUES ('Mayonesa', 'Salsa', '100');

INSERT INTO "RESTAURANTXXI"."PREPARACION" (NOMBRE, PRECIO, ESTADO) VALUES ('Vienesa Italiana', '1500', '1');
INSERT INTO "RESTAURANTXXI"."PREPARACION" (NOMBRE, PRECIO, ESTADO) VALUES ('Vienesa Completo', '1500', '1');

INSERT INTO "RESTAURANTXXI"."RECETA" (INSUMO_ID_INSUMO, PREPARACION_ID_PREPARACION) VALUES ('1', '1');
INSERT INTO "RESTAURANTXXI"."RECETA" (INSUMO_ID_INSUMO, PREPARACION_ID_PREPARACION) VALUES ('2', '1');
INSERT INTO "RESTAURANTXXI"."RECETA" (INSUMO_ID_INSUMO, PREPARACION_ID_PREPARACION) VALUES ('3', '1');
INSERT INTO "RESTAURANTXXI"."RECETA" (INSUMO_ID_INSUMO, PREPARACION_ID_PREPARACION) VALUES ('7', '1');
INSERT INTO "RESTAURANTXXI"."RECETA" (INSUMO_ID_INSUMO, PREPARACION_ID_PREPARACION) VALUES ('1', '2');
INSERT INTO "RESTAURANTXXI"."RECETA" (INSUMO_ID_INSUMO, PREPARACION_ID_PREPARACION) VALUES ('2', '2');
INSERT INTO "RESTAURANTXXI"."RECETA" (INSUMO_ID_INSUMO, PREPARACION_ID_PREPARACION) VALUES ('3', '2');
INSERT INTO "RESTAURANTXXI"."RECETA" (INSUMO_ID_INSUMO, PREPARACION_ID_PREPARACION) VALUES ('5', '2');
INSERT INTO "RESTAURANTXXI"."RECETA" (INSUMO_ID_INSUMO, PREPARACION_ID_PREPARACION) VALUES ('6', '2');

INSERT INTO "RESTAURANTXXI"."RESERVA" (FECHA, MESA_ID_MESA, USUARIO_ID_USUARIO) VALUES (TO_DATE('2020-10-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '1');

INSERT INTO "RESTAURANTXXI"."PEDIDO" (FECHA, COMENTARIO, MESERO_ID_MESERO, RESERVA_ID_RESERVA, PREPARACION_ID_PREPARACION) VALUES (TO_DATE('2020-10-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Sin mayonesa', '1', '1', '1');

INSERT INTO "RESTAURANTXXI"."BOLETA" (FECHA, MONTOTOTAL, MEDIOPAGO_ID_MEDIOPAGO, PEDIDO_ID_PEDIDO) VALUES (TO_DATE('2020-10-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1500', '2', '1');

---------------------------------------------------------------
--- PROCEDURES

-- Usuario
-- LISTAR

create or replace procedure listarUsuarios (registros out sys_refcursor)
as
begin
    open registros for select * from usuario;
end;

-- AGREGAR

create or replace procedure insertarUsuario (
v_nombre in VARCHAR2,
v_correo in VARCHAR2,
v_contrasenna in VARCHAR2
)
AS
begin
    insert into usuario (
    nombre,
    correo,
    contrasenna,
    ) values(v_nombre,v_correo,v_contrasenna);
end;

--ACTUALIZAR

create or replace procedure actualizarUsuario (
id_usuario in NUMBER,
nombre in VARCHAR2,
correo in VARCHAR2,
contrasenna in VARCHAR2
)
is
v_id_usuario NUMBER;
v_nombre VARCHAR2;
v_correo VARCHAR2;
v_contrasenna VARCHAR2;

BEGIN
v_id_usuario := id_usuario;
v_nombre  := nombre;
v_correo := correo;
v_contrasenna := contrasenna;

    update USUARIO set
    nombre = v_nombre,
    correo = v_correo,
    contrasenna = v_contrasenna
    where id_usuario = v_id_usuario;
    exception
        when NO_DATA_FOUND then
        null;
        when OTHERS then
        raise;
end;

-- BORRAR

create or replace procedure borrarUsuario (
id_usuario in NUMBER)
is
v_id_usuario NUMBER;

BEGIN
    v_id_usuario := id_usuario;
    delete from usuario where id_usuario = v_id_usuario;
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
    delete from usuario where id_mesero = v_id_mesero;
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
v_usuario_id_usuario in NUMBER
)
AS
begin
    insert into reserva (
    fecha,
    mesa_id_mesa,
    usuario_id_usuario
    ) values(v_fecha,v_mesa_id_mesa,v_usuario_id_usuario);
end;

--ACTUALIZAR

create or replace procedure actualizarReservas (
id_reserva in NUMBER,
fecha in DATE,
mesa_id_mesa in NUMBER,
usuario_id_usuario in NUMBER
)
is
v_id_reserva NUMBER;
v_fecha DATE;
v_mesa_id_mesa NUMBER;
v_usuario_id_usuario NUMBER;

BEGIN
v_id_reserva := id_reserva;
v_fecha  := fecha;
v_mesa_id_mesa := mesa_id_mesa;
v_usuario_id_usuario := usuario_id_usuario;


    update RESERVA set
    fecha = v_fecha,
    mesa_id_mesa = v_mesa_id_mesa,
    usuario_id_usuario = v_usuario_id_usuario
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

create or replace procedure insertarPreparaciones (
v_fecha in DATE,
v_montototal in NUMBER,
v_mediopago_id_mediopago in NUMBER,
v_pedido_id_pedido in NUMBER
)
AS
begin
    insert into boleta (
    fecha,
    montototal,
    mediopago_id_mediopago,
    pedido_id_pedido
    ) values(v_fecha,v_montototal,v_mediopago_id_mediopago,v_pedido_id_pedido);
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

create or replace procedure borrarBoletas (
id_boleta in NUMBER)
is
v_id_boleta NUMBER;

BEGIN
    v_id_boleta := id_boleta;
    delete from boleta where id_boleta = v_id_boleta;
end;