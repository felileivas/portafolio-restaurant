
CREATE TABLE boleta (
    id_boleta               NUMBER NOT NULL,
    fecha                   DATE NOT NULL,
    montototal              NUMBER NOT NULL,
    mediopago_id_mediopago  NUMBER NOT NULL
);

ALTER TABLE boleta ADD CONSTRAINT boleta_pk PRIMARY KEY ( id_boleta );

CREATE TABLE boleta_log (
    id_boleta   NUMBER NOT NULL,
    fecha       DATE NOT NULL,
    montototal  NUMBER NOT NULL
);

ALTER TABLE boleta_log ADD CONSTRAINT boleta_log_pk PRIMARY KEY ( id_boleta );

CREATE TABLE insumo (
    id_insumo         NUMBER NOT NULL,
    tipo              VARCHAR2(50) NOT NULL,
    cantidad          NUMBER NOT NULL,
    receta_id_receta  NUMBER NOT NULL
);

ALTER TABLE insumo ADD CONSTRAINT insumo_pk PRIMARY KEY ( id_insumo );

CREATE TABLE mediopago (
    id_mediopago  NUMBER NOT NULL,
    nombre        VARCHAR2(50) NOT NULL,
    estado        NUMBER NOT NULL
);

ALTER TABLE mediopago ADD CONSTRAINT mediopago_pk PRIMARY KEY ( id_mediopago );

CREATE TABLE mesa (
    id_mesa             NUMBER NOT NULL,
    capacidad           NUMBER NOT NULL,
    sector              VARCHAR2(50),
    estado              NUMBER NOT NULL,
    reserva_id_reserva  NUMBER NOT NULL
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
    id_pedido           NUMBER NOT NULL,
    fecha               DATE NOT NULL,
    comentario          VARCHAR2(50),
    boleta_id_boleta    NUMBER NOT NULL,
    usuario_id_usuario  NUMBER NOT NULL,
    mesero_id_mesero    NUMBER NOT NULL,
    receta_id_receta    NUMBER NOT NULL
);

ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( id_pedido );

CREATE TABLE receta (
    id_receta  NUMBER NOT NULL,
    nombre     VARCHAR2(50) NOT NULL,
    costo      NUMBER NOT NULL,
    estado     NUMBER NOT NULL
);

ALTER TABLE receta ADD CONSTRAINT receta_pk PRIMARY KEY ( id_receta );

CREATE TABLE reserva (
    id_reserva  NUMBER NOT NULL,
    fecha       DATE NOT NULL
);

ALTER TABLE reserva ADD CONSTRAINT reserva_pk PRIMARY KEY ( id_reserva );

CREATE TABLE usuario (
    id_usuario          NUMBER NOT NULL,
    nombre              VARCHAR2(50) NOT NULL,
    correo              VARCHAR2(50) NOT NULL,
    contrasenna         VARCHAR2(50) NOT NULL,
    reserva_id_reserva  NUMBER NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE boleta
    ADD CONSTRAINT boleta_mediopago_fk FOREIGN KEY ( mediopago_id_mediopago )
        REFERENCES mediopago ( id_mediopago );

ALTER TABLE insumo
    ADD CONSTRAINT insumo_receta_fk FOREIGN KEY ( receta_id_receta )
        REFERENCES receta ( id_receta );

ALTER TABLE mesa
    ADD CONSTRAINT mesa_reserva_fk FOREIGN KEY ( reserva_id_reserva )
        REFERENCES reserva ( id_reserva );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_boleta_fk FOREIGN KEY ( boleta_id_boleta )
        REFERENCES boleta ( id_boleta );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_mesero_fk FOREIGN KEY ( mesero_id_mesero )
        REFERENCES mesero ( id_mesero );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_receta_fk FOREIGN KEY ( receta_id_receta )
        REFERENCES receta ( id_receta );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_reserva_fk FOREIGN KEY ( reserva_id_reserva )
        REFERENCES reserva ( id_reserva );


