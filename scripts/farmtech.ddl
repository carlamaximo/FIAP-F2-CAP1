-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-04-19 15:12:57 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE Aplicacao 
    ( 
     ID_APLICACAO INTEGER  NOT NULL , 
     DATA_HORA    DATE , 
     TIPO         VARCHAR2 (50 CHAR) , 
     QUANTIDADE   NUMBER , 
     ID_CULTURA   INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Aplicacao 
    ADD CONSTRAINT Aplicacao_PK PRIMARY KEY ( ID_APLICACAO ) ;

CREATE TABLE Cultura 
    ( 
     ID_CULTURA              INTEGER  NOT NULL , 
     NOME                    VARCHAR2 (100 CHAR) , 
     TIPO                    VARCHAR2 (50 CHAR) , 
     DATA_INICIO             DATE , 
     DATA_FIM                DATE , 
     "Produtor_ID_ PRODUTOR" INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Cultura 
    ADD CONSTRAINT Cultura_PK PRIMARY KEY ( ID_CULTURA ) ;

CREATE TABLE Leitura_Sensor 
    ( 
     ID_LEITURA         INTEGER  NOT NULL , 
     DATA_HORA          DATE , 
     VALOR_UMIDADE      NUMBER , 
     VALOR_PH           NUMBER , 
     VALOR_NPK_FOSFORO  NUMBER , 
     VALOR_NPK_POTASSIO NUMBER , 
     ID_SENSOR          INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Leitura_Sensor 
    ADD CONSTRAINT Leitura_Sensor_PK PRIMARY KEY ( ID_LEITURA ) ;

CREATE TABLE Produtor 
    ( 
     NOME           VARCHAR2 (200 CHAR)  NOT NULL , 
     EMAIL          VARCHAR2 (200 CHAR) , 
     "ID_ PRODUTOR" INTEGER  NOT NULL , 
     TELEFONE       CHAR (30) 
    ) 
;

ALTER TABLE Produtor 
    ADD CONSTRAINT Produtor_PK PRIMARY KEY ( "ID_ PRODUTOR" ) ;

CREATE TABLE Sensor 
    ( 
     ID_SENSOR  INTEGER  NOT NULL , 
     TIPO       VARCHAR2 (50 CHAR) , 
     MODELO     VARCHAR2 (50 CHAR) , 
     ID_CULTURA INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Sensor 
    ADD CONSTRAINT Sensor_PK PRIMARY KEY ( ID_SENSOR ) ;

ALTER TABLE Aplicacao 
    ADD CONSTRAINT Aplicacao_Cultura_FK FOREIGN KEY 
    ( 
     ID_CULTURA
    ) 
    REFERENCES Cultura 
    ( 
     ID_CULTURA
    ) 
;

ALTER TABLE Cultura 
    ADD CONSTRAINT Cultura_Produtor_FK FOREIGN KEY 
    ( 
     "Produtor_ID_ PRODUTOR"
    ) 
    REFERENCES Produtor 
    ( 
     "ID_ PRODUTOR"
    ) 
;

ALTER TABLE Leitura_Sensor 
    ADD CONSTRAINT Leitura_Sensor_FK FOREIGN KEY 
    ( 
     ID_SENSOR
    ) 
    REFERENCES Sensor 
    ( 
     ID_SENSOR
    ) 
;

ALTER TABLE Sensor 
    ADD CONSTRAINT Sensor_Cultura_FK FOREIGN KEY 
    ( 
     ID_CULTURA
    ) 
    REFERENCES Cultura 
    ( 
     ID_CULTURA
    ) 
;



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
