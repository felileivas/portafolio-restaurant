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

INSERT INTO "RESTAURANTXXI"."RESERVA" (FECHA, MESA_ID_MESA, USUARIO_ID_USUARIO) VALUES (TO_DATE('2020-10-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '1');\

INSERT INTO "RESTAURANTXXI"."PEDIDO" (FECHA, COMENTARIO, MESERO_ID_MESERO, RESERVA_ID_RESERVA, PREPARACION_ID_PREPARACION) VALUES (TO_DATE('2020-10-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Sin mayonesa', '1', '1', '1');

INSERT INTO "RESTAURANTXXI"."BOLETA" (FECHA, MONTOTOTAL, MEDIOPAGO_ID_MEDIOPAGO, PEDIDO_ID_PEDIDO) VALUES (TO_DATE('2020-10-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1500', '2', '1');
