-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema burger_house
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema burger_house
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `burger_house` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `burger_house` ;

-- -----------------------------------------------------
-- Table `burger_house`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `descripcion` VARCHAR(500) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `active` TINYINT NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_rol` INT NOT NULL,
  `nombre` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `hash` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `apellido` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `documento` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  `session_id` VARCHAR(500) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL DEFAULT '1',
  `email` VARCHAR(500) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `documento_UNIQUE` (`documento` ASC) VISIBLE,
  INDEX `idRol` (`id_rol` ASC) VISIBLE,
  CONSTRAINT `usuario_ibfk_1`
    FOREIGN KEY (`id_rol`)
    REFERENCES `burger_house`.`roles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`bitacora` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `tabla` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `accion` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `fecha` DATETIME NOT NULL,
  `descripcion` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `Usuario` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `bitacora_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `burger_house`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`caja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`caja` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `monto_inicial` FLOAT NOT NULL,
  `monto_final` FLOAT NOT NULL,
  `fecha_apertura` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `usuario` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `id_usuario(caja)`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `burger_house`.`usuario` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`capital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`capital` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `monto` FLOAT NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`categoria_materia_prima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`categoria_materia_prima` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`categorias_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`categorias_productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `apellido` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `documento` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `telefono` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `direccion` VARCHAR(500) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`configuraciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`configuraciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `llave` VARCHAR(500) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `valor` VARCHAR(500) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`ventas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_caja` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `IVA` FLOAT NOT NULL,
  `monto_final` FLOAT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `direccion` VARCHAR(500) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `active` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `idCaja` (`id_caja` ASC) VISIBLE,
  INDEX `idCliente` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `ventas_ibfk_1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `burger_house`.`clientes` (`id`),
  CONSTRAINT `ventas_ibfk_2`
    FOREIGN KEY (`id_caja`)
    REFERENCES `burger_house`.`caja` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`credito` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_venta` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `monto_credito` FLOAT NOT NULL,
  `monto_final` FLOAT NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `idRegistroVentas` (`id_venta` ASC) VISIBLE,
  CONSTRAINT `credito_ibfk_1`
    FOREIGN KEY (`id_venta`)
    REFERENCES `burger_house`.`ventas` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`deliverys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`deliverys` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_usuario_delivery` INT NOT NULL,
  `id_venta` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_venta_delivery_idx` (`id_venta` ASC) VISIBLE,
  INDEX `id_usuario_delivery_idx` (`id_usuario_delivery` ASC) VISIBLE,
  CONSTRAINT `id_usuario_delivery`
    FOREIGN KEY (`id_usuario_delivery`)
    REFERENCES `burger_house`.`usuario` (`id`),
  CONSTRAINT `id_venta_delivery`
    FOREIGN KEY (`id_venta`)
    REFERENCES `burger_house`.`ventas` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`orden` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nro_Orden` INT NOT NULL,
  `Id_cliente` INT NOT NULL,
  `fecha` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Referencia` INT NOT NULL,
  `Comprobante` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `Status` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  INDEX `Id_cliente` (`Id_cliente` ASC) VISIBLE,
  INDEX `idx_cliente` (`Id_cliente` ASC) VISIBLE,
  INDEX `idx_fecha` (`fecha` ASC) VISIBLE,
  CONSTRAINT `clientes_ibfk_1`
    FOREIGN KEY (`Id_cliente`)
    REFERENCES `burger_house`.`clientes` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_categoria` INT NOT NULL,
  `nombre` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `imagen` VARCHAR(500) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `precio` FLOAT NOT NULL,
  `detalles` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  `id_receta` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idCategoria` (`id_categoria` ASC) VISIBLE,
  INDEX `id_receta` (`id_receta` ASC) VISIBLE,
  CONSTRAINT `productos_ibfk_1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `burger_house`.`categorias_productos` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`detalles_orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`detalles_orden` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_Orden` INT NOT NULL,
  `Id_producto` INT NOT NULL,
  `detalles_producto` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `Id_Orden` (`Id_Orden` ASC) VISIBLE,
  INDEX `Id_producto` (`Id_producto` ASC) VISIBLE,
  CONSTRAINT `Id_orden_ibfk_1`
    FOREIGN KEY (`Id_Orden`)
    REFERENCES `burger_house`.`orden` (`Id`),
  CONSTRAINT `productos_ibfk_2`
    FOREIGN KEY (`Id_producto`)
    REFERENCES `burger_house`.`productos` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`unidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(10) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `alias` VARCHAR(4) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `active` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`materia_prima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`materia_prima` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_categoria` INT NOT NULL,
  `id_unidad` INT NOT NULL,
  `nombre` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `stock_min` INT NOT NULL,
  `stock_max` INT NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  INDEX `id_unidad_idx` (`id_unidad` ASC) VISIBLE,
  INDEX `id_categoria` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `id_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `burger_house`.`categoria_materia_prima` (`id`),
  CONSTRAINT `id_unidad`
    FOREIGN KEY (`id_unidad`)
    REFERENCES `burger_house`.`unidades` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`recetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`recetas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `id_producto` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_p_idx` (`id_producto` ASC) VISIBLE,
  CONSTRAINT `id_p`
    FOREIGN KEY (`id_producto`)
    REFERENCES `burger_house`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`detalles_receta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`detalles_receta` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_receta` INT NOT NULL,
  `Id_materia_prima` INT NOT NULL,
  `cantidad` FLOAT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `Id_receta` (`Id_receta` ASC, `Id_materia_prima` ASC) VISIBLE,
  INDEX `Id_materia_prima_ibfk_1` (`Id_materia_prima` ASC) VISIBLE,
  CONSTRAINT `Id_materia_prima_ibfk_1`
    FOREIGN KEY (`Id_materia_prima`)
    REFERENCES `burger_house`.`materia_prima` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Id_receta_prima_ibfk_2`
    FOREIGN KEY (`Id_receta`)
    REFERENCES `burger_house`.`recetas` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 52
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`detalles_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`detalles_roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_rol` INT NOT NULL,
  `modulo` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `permisos` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_rol` (`id_rol` ASC) VISIBLE,
  CONSTRAINT `detalles_roles_ibfk_1`
    FOREIGN KEY (`id_rol`)
    REFERENCES `burger_house`.`roles` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 39
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`proveedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `razon_social` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `documento` VARCHAR(15) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `n_telefono1` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `n_telefono2` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NULL DEFAULT NULL,
  `direccion` VARCHAR(500) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`entradas_materia_prima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`entradas_materia_prima` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_provedor` INT NOT NULL,
  `id_materia_prima` INT NOT NULL,
  `fecha_compra` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `precio_compra` FLOAT NOT NULL,
  `referencia` VARCHAR(500) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NULL DEFAULT NULL,
  `existencia` FLOAT NOT NULL,
  `cantidad` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_provedor` (`id_provedor` ASC) VISIBLE,
  INDEX `id_materia_prima_idx` (`id_materia_prima` ASC) VISIBLE,
  CONSTRAINT `id_materia_prima`
    FOREIGN KEY (`id_materia_prima`)
    REFERENCES `burger_house`.`materia_prima` (`id`),
  CONSTRAINT `id_proveedor`
    FOREIGN KEY (`id_provedor`)
    REFERENCES `burger_house`.`proveedores` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`facturas` (
  `Id_factura` INT NOT NULL AUTO_INCREMENT,
  `Id_orden` INT NOT NULL,
  `Id_caja` INT NOT NULL,
  `Monto_total` INT NOT NULL,
  `Monto_total_divisa` INT NOT NULL,
  PRIMARY KEY (`Id_factura`),
  INDEX `Id_orden` (`Id_orden` ASC) VISIBLE,
  INDEX `Id_caja` (`Id_caja` ASC) VISIBLE,
  CONSTRAINT `id_caja_ibfk_1`
    FOREIGN KEY (`Id_caja`)
    REFERENCES `burger_house`.`caja` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`mesas` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `sillas` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL DEFAULT 'LIBRE',
  `vip` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(500) NOT NULL,
  `active` VARCHAR(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`reservaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`reservaciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `cantidad_personas` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_usuario_reservacion_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `id_usuario_reservacion`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `burger_house`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`mesa_reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`mesa_reservacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mesa` INT NOT NULL,
  `id_reservacion` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_reservacion_idx` (`id_reservacion` ASC) VISIBLE,
  INDEX `id_mesa_idx` (`id_mesa` ASC) VISIBLE,
  CONSTRAINT `id_mesa`
    FOREIGN KEY (`id_mesa`)
    REFERENCES `burger_house`.`mesas` (`id`),
  CONSTRAINT `id_reservacion`
    FOREIGN KEY (`id_reservacion`)
    REFERENCES `burger_house`.`reservaciones` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`metodo_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`metodo_pago` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`movimientos_capital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`movimientos_capital` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `monto` FLOAT NOT NULL,
  `descripcion` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`notificaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`notificaciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `mensaje` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT '0',
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `usuario` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `notificaciones_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `burger_house`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `burger_house`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `burger_house`.`pagos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_venta` INT NOT NULL,
  `id_metodo_pago` INT NOT NULL,
  `monto` FLOAT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `tasa` FLOAT NOT NULL,
  `comprobante` VARCHAR(500) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idRegistroVentas` (`id_venta` ASC) VISIBLE,
  INDEX `idMetodoPago` (`id_metodo_pago` ASC) VISIBLE,
  CONSTRAINT `pagos_ibfk_1`
    FOREIGN KEY (`id_metodo_pago`)
    REFERENCES `burger_house`.`metodo_pago` (`id`),
  CONSTRAINT `pagos_ibfk_2`
    FOREIGN KEY (`id_venta`)
    REFERENCES `burger_house`.`ventas` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
