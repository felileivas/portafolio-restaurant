CREATE TABLE Boleta
  (
    ID_Boleta              NUMBER NOT NULL ,
    MontoTotal             NUMBER NOT NULL ,
    ID_MedioPago           NUMBER NOT NULL ,
    ID_Pedido              NUMBER NOT NULL
  ) ;
ALTER TABLE Boleta ADD CONSTRAINT Boleta_PK PRIMARY KEY ( ID_Boleta ) ;

CREATE TABLE Cliente
  (
    ID_Cliente  NUMBER NOT NULL ,
    Nombre      VARCHAR2 (50) NOT NULL ,
    Apellido    VARCHAR2 (50) NOT NULL ,
    Correo      VARCHAR2 (50) NOT NULL ,
    Contrasenna VARCHAR2 (256) NOT NULL
  ) ;
ALTER TABLE Cliente ADD CONSTRAINT Cliente_PK PRIMARY KEY ( ID_Cliente ) ;

CREATE TABLE Insumo
  (
    ID_Insumo NUMBER NOT NULL ,
    Nombre    VARCHAR2 (50) NOT NULL ,
    Tipo      VARCHAR2 (50) NOT NULL ,
    Stock     NUMBER NOT NULL
  ) ;
ALTER TABLE Insumo ADD CONSTRAINT Insumo_PK PRIMARY KEY ( ID_Insumo ) ;

CREATE TABLE MedioPago
  (
    ID_MedioPago NUMBER NOT NULL ,
    Nombre       VARCHAR2 (25) NOT NULL ,
    Estado       NUMBER NOT NULL
  ) ;
ALTER TABLE MedioPago ADD CONSTRAINT MedioPago_PK PRIMARY KEY ( ID_MedioPago ) ;

CREATE TABLE MenuCategoria
  (
    ID_MenuCategoria NUMBER NOT NULL ,
    Nombre           VARCHAR2 (25) NOT NULL
  ) ;
ALTER TABLE MenuCategoria ADD CONSTRAINT MenuCategoria_PK PRIMARY KEY ( ID_MenuCategoria ) ;

CREATE TABLE MenuItem
  (
    ID_MenuItem                    NUMBER NOT NULL ,
    Nombre                         VARCHAR2 (50) NOT NULL ,
    Precio                         NUMBER NOT NULL ,
    Estado                         NUMBER NOT NULL ,
    ID_MenuCategoria               NUMBER NOT NULL
  ) ;
ALTER TABLE MenuItem ADD CONSTRAINT MenuItem_PK PRIMARY KEY ( ID_MenuItem ) ;

CREATE TABLE MenuItemInsumo
  (
    ID_MenuItem          NUMBER NOT NULL ,
    ID_Insumo            NUMBER NOT NULL ,
    Cantidad             NUMBER NOT NULL ,
    Comentario           VARCHAR2 (50)
  ) ;
ALTER TABLE MenuItemInsumo ADD CONSTRAINT MenuItemInsumo__IDX PRIMARY KEY ( ID_MenuItem, ID_Insumo ) ;

CREATE TABLE Mesa
  (
    NumeroMesa NUMBER NOT NULL ,
    Capacidad  NUMBER NOT NULL ,
    Sector     VARCHAR2 (25) ,
    Estado     NUMBER NOT NULL
  ) ;
ALTER TABLE Mesa ADD CONSTRAINT Mesa_PK PRIMARY KEY ( NumeroMesa ) ;

CREATE TABLE Pedido
  (
    ID_Pedido                NUMBER NOT NULL ,
    FechaPedido              DATE NOT NULL ,
    NumeroMesa               NUMBER NOT NULL ,
    ID_Trabajador            NUMBER NOT NULL ,
    ID_Cliente               NUMBER
  ) ;
ALTER TABLE Pedido ADD CONSTRAINT Pedido_PK PRIMARY KEY ( ID_Pedido ) ;

CREATE TABLE PedidoMenuItem
  (
    ID_Pedido            NUMBER NOT NULL ,
    ID_MenuItem          NUMBER NOT NULL ,
    Cantidad             NUMBER NOT NULL ,
    Comentario           VARCHAR2 (50)
  ) ;
ALTER TABLE PedidoMenuItem ADD CONSTRAINT PedidoMenuItem__IDX PRIMARY KEY ( ID_Pedido, ID_MenuItem ) ;

CREATE TABLE Reserva
  (
    ID_Reserva         NUMBER NOT NULL ,
    FechaReserva       DATE NOT NULL ,
    HoraReserva        VARCHAR2 (25) NOT NULL ,
    NumeroMesa         NUMBER NOT NULL ,
    EstadoReserva      NUMBER NOT NULL ,
    ID_Cliente         NUMBER NOT NULL
  ) ;
ALTER TABLE Reserva ADD CONSTRAINT Reserva_PK PRIMARY KEY ( ID_Reserva, ID_Cliente ) ;

CREATE TABLE RolTrabajador
  (
    ID_Rol         NUMBER NOT NULL ,
    DescripcionRol VARCHAR2 (50) NOT NULL
  ) ;
ALTER TABLE RolTrabajador ADD CONSTRAINT RolTrabajador_PK PRIMARY KEY ( ID_Rol ) ;

CREATE TABLE Trabajador
  (
    ID_Trabajador        NUMBER NOT NULL ,
    Nombre               VARCHAR2 (50) NOT NULL ,
    Apellido             VARCHAR2 (50) NOT NULL ,
    Correo               VARCHAR2 (50) NOT NULL ,
    Contrasenna          VARCHAR2 (256) NOT NULL ,
    ID_Rol               NUMBER NOT NULL
  ) ;
ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_PK PRIMARY KEY ( ID_Trabajador ) ;

CREATE TABLE SolicitudInsumo
  (
    ID_Solicitud   NUMBER NOT NULL ,
    FechaSolicitud DATE NOT NULL ,
    Estado         NUMBER NOT NULL ,
    Comentario     VARCHAR2 (150) ,
    ID_Trabajador  NUMBER NOT NULL
  ) ;
ALTER TABLE SolicitudInsumo ADD CONSTRAINT SolicitudInsumo_PK PRIMARY KEY ( ID_Solicitud ) ;

CREATE TABLE Insumo_Solicitud
  (
    ID_Solicitud       NUMBER NOT NULL ,
    ID_Insumo          NUMBER NOT NULL ,
    CantidadSolicitada NUMBER NOT NULL
  ) ;
ALTER TABLE Insumo_Solicitud ADD CONSTRAINT Insumo_Solicitud__IDX PRIMARY KEY ( ID_Solicitud, ID_Insumo ) ;

ALTER TABLE Boleta ADD CONSTRAINT Boleta_MedioPago_FK FOREIGN KEY ( ID_MedioPago ) REFERENCES MedioPago ( ID_MedioPago ) ;

ALTER TABLE Boleta ADD CONSTRAINT Boleta_Pedido_FK FOREIGN KEY ( ID_Pedido ) REFERENCES Pedido ( ID_Pedido ) ;

ALTER TABLE PedidoMenuItem ADD CONSTRAINT FK_ASS_10 FOREIGN KEY ( ID_MenuItem ) REFERENCES MenuItem ( ID_MenuItem ) ;

ALTER TABLE MenuItemInsumo ADD CONSTRAINT FK_ASS_3 FOREIGN KEY ( ID_Insumo ) REFERENCES Insumo ( ID_Insumo ) ;

ALTER TABLE MenuItemInsumo ADD CONSTRAINT FK_ASS_4 FOREIGN KEY ( ID_MenuItem ) REFERENCES MenuItem ( ID_MenuItem ) ;

ALTER TABLE PedidoMenuItem ADD CONSTRAINT FK_ASS_9 FOREIGN KEY ( ID_Pedido ) REFERENCES Pedido ( ID_Pedido ) ;

ALTER TABLE MenuItem ADD CONSTRAINT MenuItem_MenuCategoria_FK FOREIGN KEY ( ID_MenuCategoria ) REFERENCES MenuCategoria ( ID_MenuCategoria ) ;

ALTER TABLE Pedido ADD CONSTRAINT Pedido_Cliente_FK FOREIGN KEY ( ID_Cliente ) REFERENCES Cliente ( ID_Cliente ) ;

ALTER TABLE Pedido ADD CONSTRAINT Pedido_Mesa_FK FOREIGN KEY ( NumeroMesa ) REFERENCES Mesa ( NumeroMesa ) ;

ALTER TABLE Pedido ADD CONSTRAINT Pedido_Trabajador_FK FOREIGN KEY ( ID_Trabajador ) REFERENCES Trabajador ( ID_Trabajador ) ;

ALTER TABLE Reserva ADD CONSTRAINT Reserva_Cliente_FK FOREIGN KEY ( ID_Cliente ) REFERENCES Cliente ( ID_Cliente ) ;

ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_RolTrabajador_FK FOREIGN KEY ( ID_Rol ) REFERENCES RolTrabajador ( ID_Rol ) ;

ALTER TABLE Insumo_Solicitud ADD CONSTRAINT FK_ASS_1 FOREIGN KEY ( ID_Solicitud ) REFERENCES SolicitudInsumo ( ID_Solicitud ) ;

ALTER TABLE Insumo_Solicitud ADD CONSTRAINT FK_ASS_2 FOREIGN KEY ( ID_Insumo ) REFERENCES Insumo ( ID_Insumo ) ;

ALTER TABLE SolicitudInsumo ADD CONSTRAINT SolicitudInsumo_Trabajador_FK FOREIGN KEY ( ID_Trabajador ) REFERENCES Trabajador ( ID_Trabajador ) ;

--AUTO INCREMENTABLES
CREATE SEQUENCE rol_trabajador_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER rol_trabajador_id_trg BEFORE
    INSERT ON roltrabajador
    FOR EACH ROW
    WHEN ( new.id_rol IS NULL )
BEGIN
    :new.id_rol := rol_trabajador_id_seq.nextval;
END;
/
------------
CREATE SEQUENCE trabajador_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trabajador_id_trg BEFORE
    INSERT ON trabajador
    FOR EACH ROW
    WHEN ( new.id_trabajador IS NULL )
BEGIN
    :new.id_trabajador := trabajador_id_seq.nextval;
END;
/

------------
CREATE SEQUENCE cliente_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER cliente_id_trg BEFORE
    INSERT ON cliente
    FOR EACH ROW
    WHEN ( new.id_cliente IS NULL )
BEGIN
    :new.id_cliente := cliente_id_seq.nextval;
END;
/

------------
CREATE SEQUENCE reserva_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER reserva_id_trg BEFORE
    INSERT ON reserva
    FOR EACH ROW
    WHEN ( new.id_reserva IS NULL )
BEGIN
    :new.id_reserva:= reserva_id_seq.nextval;
END;
/

------------
CREATE SEQUENCE mesa_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER mesa_id_trg BEFORE
    INSERT ON mesa
    FOR EACH ROW
    WHEN ( new.numeromesa IS NULL )
BEGIN
    :new.numeromesa:= mesa_id_seq.nextval;
END;
/

------------
CREATE SEQUENCE menucategoria_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER menucategoria_id_trg BEFORE
    INSERT ON menucategoria
    FOR EACH ROW
    WHEN ( new.id_menucategoria IS NULL )
BEGIN
    :new.id_menucategoria:= menucategoria_id_seq.nextval;
END;
/

------------
CREATE SEQUENCE menuitem_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER menuitem_id_trg BEFORE
    INSERT ON menuitem
    FOR EACH ROW
    WHEN ( new.id_menuitem IS NULL )
BEGIN
    :new.id_menuitem:= menuitem_id_seq.nextval;
END;
/

------------
CREATE SEQUENCE insumo_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER insumo_id_trg BEFORE
    INSERT ON insumo
    FOR EACH ROW
    WHEN ( new.id_insumo IS NULL )
BEGIN
    :new.id_insumo:= insumo_id_seq.nextval;
END;
/

------------
CREATE SEQUENCE mediopago_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER mediopago_id_trg BEFORE
    INSERT ON mediopago
    FOR EACH ROW
    WHEN ( new.id_mediopago IS NULL )
BEGIN
    :new.id_mediopago:= mediopago_id_seq.nextval;
END;
/

------------
CREATE SEQUENCE pedido_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pedido_id_trg BEFORE
    INSERT ON pedido
    FOR EACH ROW
    WHEN ( new.id_pedido IS NULL )
BEGIN
    :new.id_pedido:= pedido_id_seq.nextval;
END;
/

------------
CREATE SEQUENCE boleta_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER boleta_id_trg BEFORE
    INSERT ON boleta
    FOR EACH ROW
    WHEN ( new.id_boleta IS NULL )
BEGIN
    :new.id_boleta:= boleta_id_seq.nextval;
END;
/

------------
CREATE SEQUENCE solicitud_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER solicitud_id_trg BEFORE
    INSERT ON SOLICITUDINSUMO
    FOR EACH ROW
    WHEN ( new.id_solicitud IS NULL )
BEGIN
    :new.id_solicitud:= solicitud_id_seq.nextval;
END;
/


