-- MySQL Script generated by MySQL Workbench
-- Tue Dec  4 16:29:49 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

#SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
#SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
#SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
#CREATE SCHEMA IF NOT EXISTS mydb DEFAULT CHARACTER SET utf8 ;
#USE mydb ;

-- -----------------------------------------------------
-- Table VIVEROS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS VIVEROS (
  coord VARCHAR(45) NOT NULL,
  localidad VARCHAR(45) NOT NULL,
  PRIMARY KEY (coord));


-- -----------------------------------------------------
-- Table ZONA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ZONA (
  coord VARCHAR(45) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  productividad FLOAT NULL,
  PRIMARY KEY (coord, nombre),
  CONSTRAINT fk_zona
    FOREIGN KEY (coord)
    REFERENCES VIVEROS (coord)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table EMPLEADO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS EMPLEADO (
  dni_empleado VARCHAR(45) NOT NULL,
  fecha DATE NOT NULL,
  coord VARCHAR(45) NULL,
  nombre VARCHAR(45) NULL,
  css INT NOT NULL,
  sueldo FLOAT NULL,
  antigüedad DATE NULL,
  productividad FLOAT NULL,
  fecha_final DATE NULL,
  venta FLOAT NULL,
  PRIMARY KEY (dni_empleado, fecha),
  CONSTRAINT variables
    FOREIGN KEY (coord , nombre)
    REFERENCES ZONA (coord , nombre)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE INDEX coordenada_idx ON EMPLEADO (coord, nombre);


-- -----------------------------------------------------
-- Table PRODUCTO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PRODUCTO (
  codigo_producto VARCHAR(45) NOT NULL,
  stock INT NULL,
  precio FLOAT NULL,
  PRIMARY KEY (codigo_producto));


-- -----------------------------------------------------
-- Table CLIENTE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CLIENTE (
  dni_cliente VARCHAR(45) NOT NULL,
  bonificación FLOAT NULL,
  total_mes INT NULL,
  PRIMARY KEY (dni_cliente));


-- -----------------------------------------------------
-- Table PRODUCTO_EMPLEADO_CLIENTE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PRODUCTO_EMPLEADO_CLIENTE (
  dni_empleado VARCHAR(45) NOT NULL,
  dni_cliente VARCHAR(45) NOT NULL,
  fecha DATE NOT NULL,
  codigo_producto VARCHAR(45) NOT NULL,
  cantidad INT NULL,
  PRIMARY KEY (dni_empleado, dni_cliente, fecha, codigo_producto),
  CONSTRAINT restriccion
    FOREIGN KEY (dni_empleado , fecha)
    REFERENCES EMPLEADO (dni_empleado , fecha)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT restriccion2
    FOREIGN KEY (codigo_producto)
    REFERENCES PRODUCTO (codigo_producto)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT restriccion3
    FOREIGN KEY (dni_cliente)
    REFERENCES CLIENTE (dni_cliente)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE INDEX codigo_producto_idx ON PRODUCTO_EMPLEADO_CLIENTE (codigo_producto);

CREATE INDEX dni_cliente_idx ON PRODUCTO_EMPLEADO_CLIENTE (dni_cliente);

CREATE INDEX restriccion_idx ON PRODUCTO_EMPLEADO_CLIENTE (dni_empleado, fecha);


#SET SQL_MODE=@OLD_SQL_MODE;
#SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
#SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table VIVEROS
-- -----------------------------------------------------

INSERT INTO VIVEROS (coord, localidad) VALUES ('19, 155', 'Tacoronte');
INSERT INTO VIVEROS (coord, localidad) VALUES ('20, 155', 'Icod');
INSERT INTO VIVEROS (coord, localidad) VALUES ('255, 20', 'La Laguna');

COMMIT;


-- -----------------------------------------------------
-- Data for table ZONA
-- -----------------------------------------------------

INSERT INTO ZONA (coord, nombre, productividad) VALUES ('20, 155', 'Icod', 98.0);
INSERT INTO ZONA (coord, nombre, productividad) VALUES ('19, 155', 'Tacoronte', 48.0);
INSERT INTO ZONA (coord, nombre, productividad) VALUES ('255, 20', 'La Laguna', 20.0);

COMMIT;


-- -----------------------------------------------------
-- Data for table EMPLEADO
-- -----------------------------------------------------

INSERT INTO EMPLEADO (dni_empleado, fecha, coord, nombre, css, sueldo, antigüedad, productividad, fecha_final, venta) VALUES ('11111111', '29-11-2018', '20, 155', 'Icod', 1234, 3000, '01-07-2009', 95.0, NULL, 200);
INSERT INTO EMPLEADO (dni_empleado, fecha, coord, nombre, css, sueldo, antigüedad, productividad, fecha_final, venta) VALUES ('22222222', '23-11-2018', '19, 155', 'Tacoronte', 5678, 2500, '03-05-2003', 69.0, NULL, 19);
INSERT INTO EMPLEADO (dni_empleado, fecha, coord, nombre, css, sueldo, antigüedad, productividad, fecha_final, venta) VALUES ('33333333', '20-11-2018', '255, 20', 'La Laguna', 9101, 1010, '18-01-2017', 25.0, NULL, 59);

COMMIT;


-- -----------------------------------------------------
-- Data for table PRODUCTO
-- -----------------------------------------------------

INSERT INTO PRODUCTO (codigo_producto, stock, precio) VALUES ('1111', 30, 25.0);
INSERT INTO PRODUCTO (codigo_producto, stock, precio) VALUES ('2222', 25, 40.0);
INSERT INTO PRODUCTO (codigo_producto, stock, precio) VALUES ('3333', 35, 8.5);

COMMIT;


-- -----------------------------------------------------
-- Data for table CLIENTE
-- -----------------------------------------------------

INSERT INTO CLIENTE (dni_cliente, bonificación, total_mes) VALUES ('44444444', 10.0, 12);
INSERT INTO CLIENTE (dni_cliente, bonificación, total_mes) VALUES ('55555555', 7.0, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table PRODUCTO_EMPLEADO_CLIENTE
-- -----------------------------------------------------

INSERT INTO PRODUCTO_EMPLEADO_CLIENTE (dni_empleado, dni_cliente, fecha, codigo_producto, cantidad) VALUES ('11111111', '44444444', '29-11-2018', '1111', 2);
INSERT INTO PRODUCTO_EMPLEADO_CLIENTE (dni_empleado, dni_cliente, fecha, codigo_producto, cantidad) VALUES ('22222222', '55555555', '23-11-2018', '3333', 1);

COMMIT;

