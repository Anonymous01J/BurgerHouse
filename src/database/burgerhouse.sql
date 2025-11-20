-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 20-11-2025 a las 03:17:54
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `burgerhouse`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Caja` (IN `idCaja` INT)   BEGIN
    SELECT 
        mp.id AS id_metodo_pago,
        mp.nombre AS metodo_pago,
        CONCAT(c.nombre, ' ', c.apellido) AS cliente,
        pc.monto,
        pc.tasa,
        pc.fecha,
        pc.nro_orden,
        pc.tipo_pago
    FROM metodo_pago mp
    LEFT JOIN (
        -- Pagos de ventas
        SELECT 
            p.id_metodo_pago,
            p.monto,
            p.tasa,
            p.fecha,
            o.id_cliente,
            o.nro_orden,
            'venta' AS tipo_pago
        FROM pagos p
        INNER JOIN pago_venta pv ON pv.id_pago = p.id
        INNER JOIN ventas v ON v.id = pv.id_venta
        INNER JOIN orden o ON o.id = v.id_orden
        WHERE v.id_caja = idCaja

        UNION ALL

        -- Pagos de reservaciones
        SELECT 
            p.id_metodo_pago,
            p.monto,
            p.tasa,
            p.fecha,
            o.id_cliente,
            o.nro_orden,
            'reserva' AS tipo_pago
        FROM pagos p
        INNER JOIN pago_reserva pr ON pr.id_pago = p.id
        INNER JOIN reservaciones r ON r.id = pr.id_reserva
        LEFT JOIN orden o ON o.id = r.id_orden
        WHERE r.id_caja = idCaja
    ) AS pc ON pc.id_metodo_pago = mp.id
    LEFT JOIN clientes c ON pc.id_cliente = c.id
    WHERE mp.active = 1
    ORDER BY mp.id, cliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CerrarCaja` (IN `cajaId` INT)   BEGIN
    DECLARE inicial_bs FLOAT DEFAULT 0;
    DECLARE inicial_dolar FLOAT DEFAULT 0;
    DECLARE total_bs FLOAT DEFAULT 0;
    DECLARE total_dolar FLOAT DEFAULT 0;
    DECLARE tasa_promedio_dolar FLOAT DEFAULT 0;

    -- Montos iniciales
    SELECT monto_inicial_bs, monto_inicial_dolar
    INTO inicial_bs, inicial_dolar
    FROM caja
    WHERE id = cajaId;

    -- Total pagos en Bs (de ventas y reservaciones)
    SELECT IFNULL(SUM(p.monto), 0)
    INTO total_bs
    FROM pagos p
    JOIN metodo_pago m ON m.id = p.id_metodo_pago
    WHERE m.nombre NOT IN ('Zelle', 'Binance', 'Divisa')
      AND p.id IN (
        -- pagos asociados a ventas
        SELECT pv.id_pago
        FROM pago_venta pv
        JOIN ventas v ON v.id = pv.id_venta
        WHERE v.id_caja = cajaId

        UNION ALL

        -- pagos asociados a reservaciones
        SELECT pr.id_pago
        FROM pago_reserva pr
        JOIN reservaciones r ON r.id = pr.id_reserva
        WHERE r.id_caja = cajaId
    );

    -- Total pagos en dólares (ventas y reservaciones)
    SELECT IFNULL(SUM(p.monto), 0)
    INTO total_dolar
    FROM pagos p
    JOIN metodo_pago m ON m.id = p.id_metodo_pago
    WHERE m.nombre IN ('Zelle', 'Binance', 'Divisa')
      AND p.id IN (
        SELECT pv.id_pago
        FROM pago_venta pv
        JOIN ventas v ON v.id = pv.id_venta
        WHERE v.id_caja = cajaId

        UNION ALL

        SELECT pr.id_pago
        FROM pago_reserva pr
        JOIN reservaciones r ON r.id = pr.id_reserva
        WHERE r.id_caja = cajaId
    );

    -- Tasa promedio dólar para pagos en Bs
    SELECT IFNULL(AVG(p.tasa), 0)
    INTO tasa_promedio_dolar
    FROM pagos p
    JOIN metodo_pago m ON m.id = p.id_metodo_pago
    WHERE m.nombre NOT IN ('Zelle', 'Binance', 'Divisa')
      AND p.id IN (
        SELECT pv.id_pago
        FROM pago_venta pv
        JOIN ventas v ON v.id = pv.id_venta
        WHERE v.id_caja = cajaId

        UNION ALL

        SELECT pr.id_pago
        FROM pago_reserva pr
        JOIN reservaciones r ON r.id = pr.id_reserva
        WHERE r.id_caja = cajaId
    );

    -- Actualizar caja con totales
    UPDATE caja
    SET 
        monto_final_bs = inicial_bs + total_bs,
        monto_final_dolar = inicial_dolar + total_dolar,
        fecha_cierre = NOW(),
        estado = 0
    WHERE id = cajaId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `gastoClienteAnual` (IN `p_anio` INT)   BEGIN
    
    WITH meses AS (
        SELECT 1 AS mes_numero, 'Enero' AS nombre UNION
        SELECT 2, 'Febrero' UNION
        SELECT 3, 'Marzo' UNION
        SELECT 4, 'Abril' UNION
        SELECT 5, 'Mayo' UNION
        SELECT 6, 'Junio' UNION
        SELECT 7, 'Julio' UNION
        SELECT 8, 'Agosto' UNION
        SELECT 9, 'Septiembre' UNION
        SELECT 10, 'Octubre' UNION
        SELECT 11, 'Noviembre' UNION
        SELECT 12, 'Diciembre'
    ),

    
    ventas_por_mes AS (
        SELECT 
            MONTH(fecha) AS mes_numero,
            SUM(monto_final) AS total_mes,
            COUNT(DISTINCT DATE(fecha)) AS dias_con_ventas,
            SUM(monto_final) / COUNT(DISTINCT DATE(fecha)) AS promedio_diario
        FROM ventas
        WHERE YEAR(fecha) = p_anio
        GROUP BY MONTH(fecha)
    )

    SELECT
        m.nombre AS mes,
        m.mes_numero,
        ROUND(COALESCE(v.total_mes, 0), 2) AS total_mes,
        ROUND(COALESCE(v.promedio_diario, 0), 2) AS promedio_diario
    FROM meses m
    LEFT JOIN ventas_por_mes v ON m.mes_numero = v.mes_numero
    ORDER BY m.mes_numero;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `gastoClienteMes` (IN `p_anio` INT, IN `p_mes` INT)   BEGIN
 DECLARE fecha_inicio DATE;
    DECLARE fecha_fin DATE;

    
    SET lc_time_names = 'es_ES';

    
    SET fecha_inicio = DATE(CONCAT(p_anio, '-', LPAD(p_mes, 2, '0'), '-01'));
    SET fecha_fin = LAST_DAY(fecha_inicio);

    
    DROP TEMPORARY TABLE IF EXISTS fechas_mes;
    CREATE TEMPORARY TABLE fechas_mes (
        fecha DATE,
        semana_iso INT
    );

    
    WHILE fecha_inicio <= fecha_fin DO
        INSERT INTO fechas_mes (fecha, semana_iso)
        VALUES (fecha_inicio, WEEK(fecha_inicio, 3));
        SET fecha_inicio = DATE_ADD(fecha_inicio, INTERVAL 1 DAY);
    END WHILE;

    
    SELECT 
        semana_iso AS semana,
        MIN(f.fecha) AS inicio_semana,
        MAX(f.fecha) AS fin_semana,
        ROUND(SUM(IFNULL(v.monto_final, 0)), 2) AS total_semana
    FROM fechas_mes f
    LEFT JOIN ventas v ON DATE(v.fecha) = f.fecha
    GROUP BY semana_iso
    ORDER BY semana_iso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GastoClienteSemana` (IN `p_anio` INT, IN `p_semana` INT)   BEGIN
    DECLARE target_yearweek INT;

    
    SET target_yearweek = p_anio * 100 + p_semana;

    WITH 
    RECURSIVE calendario AS (
        SELECT DATE(CONCAT(p_anio,'-01-01')) AS fecha
        UNION ALL
        SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
        FROM calendario
        WHERE fecha < DATE(CONCAT(p_anio,'-12-31'))
    ),
    semana_iso AS (
        SELECT fecha
        FROM calendario
        WHERE YEARWEEK(fecha,1) = target_yearweek
    ),
    dias_nombres AS (
        SELECT 1 AS dia_orden, 'Lunes'    AS dia_nombre UNION ALL
        SELECT 2, 'Martes'    UNION ALL
        SELECT 3, 'Miércoles' UNION ALL
        SELECT 4, 'Jueves'    UNION ALL
        SELECT 5, 'Viernes'   UNION ALL
        SELECT 6, 'Sábado'    UNION ALL
        SELECT 7, 'Domingo'
    ),
    dias_semana AS (
        SELECT
          si.fecha,
          WEEKDAY(si.fecha) + 1      AS dia_orden,
          dn.dia_nombre
        FROM semana_iso si
        JOIN dias_nombres dn ON dn.dia_orden = WEEKDAY(si.fecha) + 1
    )

    SELECT
        ds.dia_nombre               AS dia,
        DATE_FORMAT(ds.fecha, '%Y-%m-%d') AS fecha,
        ROUND(SUM(IFNULL(v.monto_final, 0)), 2)   AS total_dia
    FROM dias_semana ds
    LEFT JOIN ventas v
      ON DATE(v.fecha) = ds.fecha
    GROUP BY
        ds.dia_orden,
        ds.dia_nombre,
        ds.fecha
    ORDER BY
        ds.dia_orden;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `porcentaje_reservaciones_anio` (IN `p_anio` INT)   BEGIN
    DECLARE total_reservaciones INT;

    -- Calcular el total de reservaciones para el año especificado
    SELECT COUNT(*) INTO total_reservaciones
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio;

    -- Calcular reservaciones por cada hora
    SELECT 
        '5 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 17

    UNION ALL

    SELECT 
        '6 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 18

    UNION ALL

    SELECT 
        '7 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 19

    UNION ALL

    SELECT 
        '8 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 20

    UNION ALL

    SELECT 
        '9 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 21

    UNION ALL

    SELECT 
        '10 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 22

    UNION ALL

    SELECT 
        '11 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 23;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `porcentaje_reservaciones_mes` (IN `p_mes` INT, IN `p_anio` INT)   BEGIN
    DECLARE total_reservaciones INT;

    -- Calcular el total de reservaciones para el mes y año especificados
    SELECT COUNT(*) INTO total_reservaciones
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio;

    -- Calcular reservaciones por cada hora
    SELECT 
        '5 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 17

    UNION ALL

    SELECT 
        '6 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 18

    UNION ALL

    SELECT 
        '7 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 19

    UNION ALL

    SELECT 
        '8 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 20

    UNION ALL

    SELECT 
        '9 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 21

    UNION ALL

    SELECT 
        '10 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 22

    UNION ALL

    SELECT 
        '11 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 23;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `porcentaje_reservaciones_semana` (IN `p_semana` INT, IN `p_anio` INT)   BEGIN
    DECLARE total_reservaciones INT;

    -- Calcular el total de reservaciones para la semana y año especificados
    SELECT COUNT(*) INTO total_reservaciones
    FROM (
        WITH 
        RECURSIVE calendario AS (
            SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
            UNION ALL
            SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
            FROM calendario
            WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
        )
        SELECT fecha
        FROM calendario
        WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
    ) AS semana_iso
    JOIN reservaciones r ON DATE(r.fecha_inicio) = semana_iso.fecha;

    -- Calcular reservaciones por cada hora
    SELECT 
        '5 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 17

    UNION ALL

    SELECT 
        '6 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 18

    UNION ALL

    SELECT 
        '7 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 19

    UNION ALL

    SELECT 
        '8 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 20

    UNION ALL

    SELECT 
        '9 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 21

    UNION ALL

    SELECT 
        '10 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 22

    UNION ALL

    SELECT 
        '11 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 23;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMasVendidoAnio` (IN `p_anio` INT)   BEGIN

    WITH meses AS (
        SELECT 1 AS mes_num, 'Enero' AS mes_nombre UNION ALL
        SELECT 2, 'Febrero' UNION ALL
        SELECT 3, 'Marzo' UNION ALL
        SELECT 4, 'Abril' UNION ALL
        SELECT 5, 'Mayo' UNION ALL
        SELECT 6, 'Junio' UNION ALL
        SELECT 7, 'Julio' UNION ALL
        SELECT 8, 'Agosto' UNION ALL
        SELECT 9, 'Septiembre' UNION ALL
        SELECT 10, 'Octubre' UNION ALL
        SELECT 11, 'Noviembre' UNION ALL
        SELECT 12, 'Diciembre'
    ),

    
    ventas_mensuales AS (
        SELECT
            MONTH(o.fecha)                     AS mes,
            p.id                               AS producto_id,
            p.nombre                           AS producto_nombre,
            SUM(od.cantidad)                   AS total_cantidad,
            SUM(od.cantidad * p.precio)        AS total_monto
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p ON p.id = od.id_producto
        JOIN `orden` o              ON o.id = od.id_orden
        WHERE YEAR(o.fecha) = p_anio
          AND p.tipo = 'producto'
        GROUP BY mes, p.id, p.nombre
    ),

    
    ranking AS (
        SELECT
            vm.*,
            ROW_NUMBER() OVER (
                PARTITION BY vm.mes
                ORDER BY vm.total_cantidad DESC
            ) AS rn
        FROM ventas_mensuales vm
    ),

    top_ventas AS (
        SELECT
            mes,
            producto_nombre,
            total_cantidad,
            ROUND(total_monto, 2) AS total_monto
        FROM ranking
        WHERE rn <= 3
    )

    
    SELECT
        m.mes_num                        AS numero_mes,
        m.mes_nombre                    AS nombre_mes,
        COALESCE(tv.producto_nombre, 'Sin ventas') AS producto,
        COALESCE(tv.total_cantidad, 0) AS unidades_vendidas,
        COALESCE(tv.total_monto, 0.00) AS monto_generado
    FROM meses m
    LEFT JOIN top_ventas tv ON tv.mes = m.mes_num
    ORDER BY m.mes_num, unidades_vendidas DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMasVendidoMes` (IN `p_anio` INT, IN `p_mes` INT)   BEGIN
SET lc_time_names = 'es_ES';

    
    WITH RECURSIVE fechas AS (
        SELECT DATE(CONCAT(p_anio, '-', p_mes, '-01')) AS fecha
        UNION ALL
        SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
        FROM fechas
        WHERE MONTH(fecha) = p_mes AND YEAR(fecha) = p_anio
    ),
    semanas_mes AS (
        SELECT DISTINCT WEEK(fecha, 1) AS semana
        FROM fechas
    ),

    
    ventas_semanales AS (
        SELECT
            WEEK(o.fecha, 1)                  AS semana,
            p.id                              AS producto_id,
            p.nombre                          AS producto_nombre,
            SUM(od.cantidad)                  AS total_cantidad,
            SUM(od.cantidad * p.precio)       AS total_monto
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p ON p.id = od.id_producto
        JOIN `orden` o              ON o.id = od.id_orden
        WHERE YEAR(o.fecha) = p_anio
          AND MONTH(o.fecha) = p_mes
          AND p.tipo = 'producto'
        GROUP BY semana, p.id, p.nombre
    ),

    
    ranking AS (
        SELECT
            vs.*,
            ROW_NUMBER() OVER (
                PARTITION BY vs.semana
                ORDER BY vs.total_cantidad DESC
            ) AS rn
        FROM ventas_semanales vs
    ),

    
    top_ventas AS (
        SELECT
            semana,
            producto_nombre,
            total_cantidad,
            ROUND(total_monto, 2) AS total_monto
        FROM ranking
        WHERE rn <= 3
    )

    
    SELECT
        sm.semana                      AS semana_del_anio,
        COALESCE(tv.producto_nombre, 'Sin ventas')  AS producto,
        COALESCE(tv.total_cantidad, 0)              AS unidades_vendidas,
        COALESCE(tv.total_monto, 0.00)              AS monto_generado
    FROM semanas_mes sm
    LEFT JOIN top_ventas tv ON tv.semana = sm.semana
    ORDER BY sm.semana, unidades_vendidas DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMasVendidoSemana` (IN `p_anio` INT, IN `p_semana` INT)   BEGIN
    
    SET lc_time_names = 'es_ES';

    
    WITH dias_semana AS (
        SELECT 0 AS dia_orden, 'Lunes' AS dia UNION ALL
        SELECT 1, 'Martes' UNION ALL
        SELECT 2, 'Miércoles' UNION ALL
        SELECT 3, 'Jueves' UNION ALL
        SELECT 4, 'Viernes' UNION ALL
        SELECT 5, 'Sábado' UNION ALL
        SELECT 6, 'Domingo'
    ),

    
    ventas_semanales AS (
        SELECT
            p.id                            AS producto_id,
            p.nombre                        AS producto_nombre,
            WEEKDAY(o.fecha)               AS dia_orden,
            DAYNAME(o.fecha)               AS dia_nombre,
            SUM(od.cantidad)               AS total_cantidad,
            SUM(od.cantidad * p.precio)    AS total_monto
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p ON p.id = od.id_producto
        JOIN `orden` o              ON o.id = od.id_orden
        WHERE YEAR(o.fecha) = p_anio
          AND WEEK(o.fecha, 1) = p_semana
          AND p.tipo = 'producto'
        GROUP BY p.id, p.nombre, WEEKDAY(o.fecha), DAYNAME(o.fecha)
    ),

    
    ranking AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY dia_orden
                ORDER BY total_cantidad DESC
            ) AS rn
        FROM ventas_semanales
    ),

    
    dias_con_ventas AS (
        SELECT
            d.dia_orden,
            d.dia,
            COALESCE(r.producto_nombre, 'SIN VENTA') AS producto,
            IFNULL(r.total_cantidad, 0) AS unidades_vendidas,
            ROUND(IFNULL(r.total_monto, 0), 2) AS monto_generado
        FROM dias_semana d
        LEFT JOIN ranking r ON d.dia_orden = r.dia_orden AND r.rn <= 3
    )

    SELECT *
    FROM dias_con_ventas
    ORDER BY dia_orden, unidades_vendidas DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMenosVendidoAnio` (IN `p_anio` INT)   BEGIN

    WITH meses AS (
        SELECT 1 AS mes_num, 'Enero' AS mes_nombre UNION ALL
        SELECT 2, 'Febrero' UNION ALL
        SELECT 3, 'Marzo' UNION ALL
        SELECT 4, 'Abril' UNION ALL
        SELECT 5, 'Mayo' UNION ALL
        SELECT 6, 'Junio' UNION ALL
        SELECT 7, 'Julio' UNION ALL
        SELECT 8, 'Agosto' UNION ALL
        SELECT 9, 'Septiembre' UNION ALL
        SELECT 10, 'Octubre' UNION ALL
        SELECT 11, 'Noviembre' UNION ALL
        SELECT 12, 'Diciembre'
    ),

    
    ventas_mensuales AS (
        SELECT
            MONTH(o.fecha)                     AS mes,
            p.id                               AS producto_id,
            p.nombre                           AS producto_nombre,
            SUM(od.cantidad)                   AS total_cantidad,
            SUM(od.cantidad * p.precio)        AS total_monto
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p ON p.id = od.id_producto
        JOIN `orden` o              ON o.id = od.id_orden
        WHERE YEAR(o.fecha) = p_anio
          AND p.tipo = 'producto'
        GROUP BY mes, p.id, p.nombre
    ),

    
    ranking AS (
        SELECT
            vm.*,
            ROW_NUMBER() OVER (
                PARTITION BY vm.mes
                ORDER BY vm.total_cantidad ASC
            ) AS rn
        FROM ventas_mensuales vm
    ),

    top_ventas AS (
        SELECT
            mes,
            producto_nombre,
            total_cantidad,
            ROUND(total_monto, 2) AS total_monto
        FROM ranking
        WHERE rn <= 3
    )

    
    SELECT
        m.mes_num                        AS numero_mes,
        m.mes_nombre                    AS nombre_mes,
        COALESCE(tv.producto_nombre, 'Sin ventas') AS producto,
        COALESCE(tv.total_cantidad, 0) AS unidades_vendidas,
        COALESCE(tv.total_monto, 0.00) AS monto_generado
    FROM meses m
    LEFT JOIN top_ventas tv ON tv.mes = m.mes_num
    ORDER BY m.mes_num, unidades_vendidas ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMenosVendidoMes` (IN `p_anio` INT, IN `p_mes` INT)   BEGIN
SET lc_time_names = 'es_ES';

    
    WITH RECURSIVE fechas AS (
        SELECT DATE(CONCAT(p_anio, '-', p_mes, '-01')) AS fecha
        UNION ALL
        SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
        FROM fechas
        WHERE MONTH(fecha) = p_mes AND YEAR(fecha) = p_anio
    ),
    semanas_mes AS (
        SELECT DISTINCT WEEK(fecha, 1) AS semana
        FROM fechas
    ),

    
    ventas_semanales AS (
        SELECT
            WEEK(o.fecha, 1)                  AS semana,
            p.id                              AS producto_id,
            p.nombre                          AS producto_nombre,
            SUM(od.cantidad)                  AS total_cantidad,
            SUM(od.cantidad * p.precio)       AS total_monto
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p ON p.id = od.id_producto
        JOIN `orden` o              ON o.id = od.id_orden
        WHERE YEAR(o.fecha) = p_anio
          AND MONTH(o.fecha) = p_mes
          AND p.tipo = 'producto'
        GROUP BY semana, p.id, p.nombre
    ),

    
    ranking AS (
        SELECT
            vs.*,
            ROW_NUMBER() OVER (
                PARTITION BY vs.semana
                ORDER BY vs.total_cantidad ASC
            ) AS rn
        FROM ventas_semanales vs
    ),

    
    top_ventas AS (
        SELECT
            semana,
            producto_nombre,
            total_cantidad,
            ROUND(total_monto, 2) AS total_monto
        FROM ranking
        WHERE rn <= 3
    )

    
    SELECT
        sm.semana                      AS semana_del_anio,
        COALESCE(tv.producto_nombre, 'Sin ventas')  AS producto,
        COALESCE(tv.total_cantidad, 0)              AS unidades_vendidas,
        COALESCE(tv.total_monto, 0.00)              AS monto_generado
    FROM semanas_mes sm
    LEFT JOIN top_ventas tv ON tv.semana = sm.semana
    ORDER BY sm.semana, unidades_vendidas ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMenosVendidoSemana` (IN `p_anio` INT, IN `p_semana` INT)   BEGIN
    
    SET lc_time_names = 'es_ES';

    
    WITH dias_semana AS (
        SELECT 0 AS dia_orden, 'Lunes' AS dia UNION ALL
        SELECT 1, 'Martes' UNION ALL
        SELECT 2, 'Miércoles' UNION ALL
        SELECT 3, 'Jueves' UNION ALL
        SELECT 4, 'Viernes' UNION ALL
        SELECT 5, 'Sábado' UNION ALL
        SELECT 6, 'Domingo'
    ),

    
    ventas_semanales AS (
        SELECT
            p.id                            AS producto_id,
            p.nombre                        AS producto_nombre,
            WEEKDAY(o.fecha)               AS dia_orden,
            DAYNAME(o.fecha)               AS dia_nombre,
            SUM(od.cantidad)               AS total_cantidad,
            SUM(od.cantidad * p.precio)    AS total_monto
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p ON p.id = od.id_producto
        JOIN `orden` o              ON o.id = od.id_orden
        WHERE YEAR(o.fecha) = p_anio
          AND WEEK(o.fecha, 1) = p_semana
          AND p.tipo = 'producto'
        GROUP BY p.id, p.nombre, WEEKDAY(o.fecha), DAYNAME(o.fecha)
    ),

    
    ranking AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY dia_orden
                ORDER BY total_cantidad DESC
            ) AS rn
        FROM ventas_semanales
    ),

    
    dias_con_ventas AS (
        SELECT
            d.dia_orden,
            d.dia,
            COALESCE(r.producto_nombre, 'SIN VENTA') AS producto,
            IFNULL(r.total_cantidad, 0) AS unidades_vendidas,
            ROUND(IFNULL(r.total_monto, 0), 2) AS monto_generado
        FROM dias_semana d
        LEFT JOIN ranking r ON d.dia_orden = r.dia_orden AND r.rn <= 3
    )

    SELECT *
    FROM dias_con_ventas
    ORDER BY dia_orden, unidades_vendidas ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReservasPorMetodoAnual` (IN `p_anio` INT)   BEGIN
    
    SELECT
        metodo_pedido,
        COALESCE(COUNT(*),0) AS cantidad_reservas
    FROM reservaciones
    WHERE YEAR(fecha_inicio) = p_anio
    GROUP BY metodo_pedido;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReservasPorMetodoMes` (IN `p_anio` INT, IN `p_mes` INT)   BEGIN
    
    SELECT
        metodo_pedido,
        COUNT(*) AS cantidad_reservas
    FROM reservaciones
    WHERE YEAR(fecha_inicio) = p_anio AND MONTH(fecha_inicio) =p_mes
    GROUP BY metodo_pedido;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReservasPorMetodoSemana` (IN `p_anio` INT, IN `p_semana` INT)   BEGIN
    -- Versión adaptada para trabajar por semana y año
    SELECT
        metodo_pedido,
        COUNT(*) AS cantidad_reservas
    FROM reservaciones
    WHERE YEARWEEK(fecha_inicio, 1) = (p_anio * 100 + p_semana)
    GROUP BY metodo_pedido;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TotalVentasAnio` (IN `p_anio` INT)   BEGIN
    SELECT
        o.tipo AS tipo_orden,
        COUNT(DISTINCT o.id) AS total_ordenes,
        ROUND(SUM(v.monto_final), 2) AS total_recaudado
    FROM `orden` o
    JOIN ventas v ON v.id_orden = o.id
    WHERE YEAR(o.fecha) = p_anio
    GROUP BY o.tipo
    ORDER BY total_recaudado DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TotalVentasMes` (IN `p_anio` INT, IN `p_mes` INT)   BEGIN
    SELECT
        o.tipo AS tipo_orden,
        COUNT(DISTINCT o.id) AS total_ordenes,
        ROUND(SUM(v.monto_final), 2) AS total_recaudado
    FROM `orden` o
    JOIN ventas v ON v.id_orden = o.id
    WHERE YEAR(o.fecha) = p_anio
      AND MONTH(o.fecha) = p_mes
    GROUP BY o.tipo
    ORDER BY total_recaudado DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TotalVentasSemana` (IN `p_anio` INT, IN `p_semana` INT)   BEGIN
    SELECT
        o.tipo AS tipo_orden,
        COUNT(DISTINCT o.id) AS total_ordenes,
        ROUND(SUM(v.monto_final), 2) AS total_recaudado
    FROM `orden` o
    JOIN ventas v ON v.id_orden = o.id
    WHERE YEAR(o.fecha) = p_anio
      AND WEEK(o.fecha, 1) = p_semana
    GROUP BY o.tipo
    ORDER BY total_recaudado DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UtilidadNetaAnual` (IN `p_anio` INT)   BEGIN
    
    WITH meses AS (
        SELECT 1 AS mes_numero, 'Enero' AS nombre UNION
        SELECT 2, 'Febrero' UNION
        SELECT 3, 'Marzo' UNION
        SELECT 4, 'Abril' UNION
        SELECT 5, 'Mayo' UNION
        SELECT 6, 'Junio' UNION
        SELECT 7, 'Julio' UNION
        SELECT 8, 'Agosto' UNION
        SELECT 9, 'Septiembre' UNION
        SELECT 10, 'Octubre' UNION
        SELECT 11, 'Noviembre' UNION
        SELECT 12, 'Diciembre'
    ),
    
    utilidad_por_mes AS (
        SELECT 
            MONTH(mc.fecha) AS mes_numero,
            ROUND(SUM(CASE WHEN mc.monto / mc.tasa > 0 THEN mc.monto / mc.tasa ELSE 0 END), 2) AS ingresos,
            ROUND(SUM(CASE WHEN mc.monto / mc.tasa > 0 AND mc.descripcion LIKE '%Ingreso por venta%' 
                           THEN mc.monto / mc.tasa ELSE 0 END), 2) AS ventas,
            ROUND(SUM(CASE WHEN mc.monto / mc.tasa < 0 THEN mc.monto / mc.tasa ELSE 0 END), 2) AS gastos,
            ROUND(
                SUM(CASE WHEN mc.monto / mc.tasa > 0 THEN mc.monto / mc.tasa ELSE 0 END) +
                SUM(CASE WHEN mc.monto / mc.tasa < 0 THEN mc.monto / mc.tasa ELSE 0 END), 2
            ) AS utilidad_neta
        FROM movimientos_capital mc
        WHERE YEAR(mc.fecha) = p_anio
        GROUP BY MONTH(mc.fecha)
    )

    SELECT
        m.nombre AS mes,
        m.mes_numero,
        COALESCE(u.ingresos, 0) AS ingresos,
        COALESCE(u.ventas, 0) AS ventas,
        COALESCE(u.gastos, 0) AS gastos,
        COALESCE(u.utilidad_neta, 0) AS utilidad_neta
    FROM meses m
    LEFT JOIN utilidad_por_mes u ON m.mes_numero = u.mes_numero
    ORDER BY m.mes_numero;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UtilidadNetaMes` (IN `p_anio` INT, IN `p_mes` INT)   BEGIN
    
    WITH RECURSIVE calendario AS (
        SELECT DATE(CONCAT(p_anio, '-', LPAD(p_mes, 2, '0'), '-01')) AS fecha
        UNION ALL
        SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
        FROM calendario
        WHERE MONTH(fecha) = p_mes
          AND fecha < LAST_DAY(CONCAT(p_anio, '-', LPAD(p_mes, 2, '0'), '-01'))
    ),

    semanas_del_mes AS (
        SELECT 
            YEARWEEK(fecha, 1) AS anio_semana,
            WEEK(fecha, 1)     AS semana,
            MIN(fecha) OVER (PARTITION BY WEEK(fecha, 1)) AS inicio_semana,
            MAX(fecha) OVER (PARTITION BY WEEK(fecha, 1)) AS fin_semana,
            fecha
        FROM calendario
    ),

    semanas_agrupadas AS (
        SELECT DISTINCT 
            semana,
            DATE_FORMAT(MIN(fecha), '%Y-%m-%d') AS fecha_inicio,
            DATE_FORMAT(MAX(fecha), '%Y-%m-%d') AS fecha_fin
        FROM semanas_del_mes
        GROUP BY semana
    )

    SELECT 
        sa.semana                               AS semana,
        sa.fecha_inicio                         AS fecha_inicio,
        sa.fecha_fin                            AS fecha_fin,
        
        ROUND(SUM(CASE 
            WHEN mc.monto / NULLIF(mc.tasa,0) > 0 THEN mc.monto / NULLIF(mc.tasa,0)
        END), 2) AS ingresos,
        
        ROUND(SUM(CASE 
            WHEN mc.monto / NULLIF(mc.tasa,0) > 0 
                 AND mc.descripcion LIKE '%Ingreso por venta%' 
            THEN mc.monto / NULLIF(mc.tasa,0)
        END), 2) AS ventas,
        
        ROUND(SUM(CASE 
            WHEN mc.monto / NULLIF(mc.tasa,0) < 0 THEN mc.monto / NULLIF(mc.tasa,0)
        END), 2) AS gastos,
        
        ROUND(
            SUM(CASE WHEN mc.monto / NULLIF(mc.tasa,0) > 0 THEN mc.monto / NULLIF(mc.tasa,0) ELSE 0 END) +
            SUM(CASE WHEN mc.monto / NULLIF(mc.tasa,0) < 0 THEN mc.monto / NULLIF(mc.tasa,0) ELSE 0 END)
        , 2) AS utilidad_neta

    FROM semanas_agrupadas sa
    LEFT JOIN movimientos_capital mc 
      ON WEEK(mc.fecha, 1) = sa.semana AND YEAR(mc.fecha) = p_anio
    GROUP BY sa.semana, sa.fecha_inicio, sa.fecha_fin
    ORDER BY sa.semana;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UtilidadNetaSemana` (IN `p_anio` INT, IN `p_semana` INT)   BEGIN
    DECLARE target_yearweek INT;

    -- Construir el formato de YEARWEEK
    SET target_yearweek = p_anio * 100 + p_semana;

    WITH 
    RECURSIVE calendario AS (
        SELECT DATE(CONCAT(p_anio,'-01-01')) AS fecha
        UNION ALL
        SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
        FROM calendario
        WHERE fecha < DATE(CONCAT(p_anio,'-12-31'))
    ),

    semana_iso AS (
        SELECT fecha
        FROM calendario
        WHERE YEARWEEK(fecha,1) = target_yearweek
    ),

    dias_nombres AS (
        SELECT 1 AS dia_orden, 'Lunes'    AS dia_nombre UNION ALL
        SELECT 2, 'Martes'    UNION ALL
        SELECT 3, 'Miércoles' UNION ALL
        SELECT 4, 'Jueves'    UNION ALL
        SELECT 5, 'Viernes'   UNION ALL
        SELECT 6, 'Sábado'    UNION ALL
        SELECT 7, 'Domingo'
    ),

    dias_semana AS (
        SELECT
            si.fecha,
            WEEKDAY(si.fecha) + 1  AS dia_orden,
            dn.dia_nombre
        FROM semana_iso si
        JOIN dias_nombres dn ON dn.dia_orden = WEEKDAY(si.fecha) + 1
    )

    SELECT
        ds.dia_nombre                                AS dia,
        DATE_FORMAT(ds.fecha, '%Y-%m-%d')            AS fecha,
        
        ROUND(SUM(CASE 
            WHEN mc.monto / NULLIF(mc.tasa,0) > 0 THEN mc.monto / NULLIF(mc.tasa,0)
        END), 2) AS ingresos,
        
        ROUND(SUM(CASE 
            WHEN mc.monto / NULLIF(mc.tasa,0) > 0 
                 AND mc.descripcion LIKE '%Ingreso por venta%' 
            THEN mc.monto / NULLIF(mc.tasa,0)
        END), 2) AS ventas,
        
        ROUND(SUM(CASE 
            WHEN mc.monto / NULLIF(mc.tasa,0) < 0 THEN mc.monto / NULLIF(mc.tasa,0)
        END), 2) AS gastos,
        
        ROUND(
            SUM(CASE WHEN mc.monto / NULLIF(mc.tasa,0) > 0 THEN mc.monto / NULLIF(mc.tasa,0) ELSE 0 END) +
            SUM(CASE WHEN mc.monto / NULLIF(mc.tasa,0) < 0 THEN mc.monto / NULLIF(mc.tasa,0) ELSE 0 END)
        , 2) AS utilidad_neta

    FROM dias_semana ds
    LEFT JOIN movimientos_capital mc 
           ON DATE(mc.fecha) = ds.fecha
    GROUP BY ds.dia_orden, ds.dia_nombre, ds.fecha
    ORDER BY ds.dia_orden;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `monto_inicial_dolar` float NOT NULL,
  `monto_inicial_bs` float NOT NULL,
  `monto_final_bs` float DEFAULT NULL,
  `monto_final_dolar` float DEFAULT NULL,
  `fecha_apertura` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_cierre` datetime DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `total_ventas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id`, `id_usuario`, `monto_inicial_dolar`, `monto_inicial_bs`, `monto_final_bs`, `monto_final_dolar`, `fecha_apertura`, `fecha_cierre`, `estado`, `total_ventas`) VALUES
(27, 11, 150, 3000, 3796.16, 158.88, '2025-07-07 14:07:09', '2025-07-09 12:57:17', 0, NULL),
(28, 11, 150, 25, 2237.26, 150, '2025-07-09 12:57:28', '2025-07-10 14:45:38', 0, NULL),
(29, 11, 300, 2500, 4988.16, 300, '2025-07-16 14:45:52', '2025-07-25 12:23:49', 0, NULL),
(30, 11, 58.55, 250, 11657.2, 58.55, '2025-08-06 12:24:01', '2025-08-09 12:13:04', 0, NULL),
(31, 11, 150, 25, NULL, NULL, '2025-08-28 08:13:13', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capital`
--

CREATE TABLE `capital` (
  `id` int(11) NOT NULL,
  `monto` float NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `capital`
--

INSERT INTO `capital` (`id`, `monto`, `fecha`) VALUES
(1, -57457.6, '2025-06-12 16:08:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_productos`
--

CREATE TABLE `categorias_productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categorias_productos`
--

INSERT INTO `categorias_productos` (`id`, `nombre`, `active`) VALUES
(1, 'Bebidas', 1),
(2, 'Pepitos', 1),
(3, 'Griegos', 1),
(4, 'Perros Calientes', 1),
(5, 'Papas', 1),
(6, 'Club House', 1),
(7, 'Burgers', 1),
(8, 'Kids', 1),
(9, 'Jira', 0),
(10, 'Adicionales', 0),
(11, 'Otra mas', 0),
(12, 'UN a', 0),
(13, 'Nueva categoria', 0),
(14, 'Hola', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_materia_prima`
--

CREATE TABLE `categoria_materia_prima` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categoria_materia_prima`
--

INSERT INTO `categoria_materia_prima` (`id`, `nombre`, `active`) VALUES
(1, 'Carnes', 1),
(2, 'Panadería', 1),
(3, 'Verduras y hortaliza', 1),
(4, 'Salsas y condimentos', 1),
(5, 'Aceites y grasas', 1),
(6, 'Postres y acompañamientos', 1),
(7, 'Lacteos', 1),
(8, 'Prueba', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `documento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellido`, `telefono`, `active`, `documento`) VALUES
(1, 'Jose', 'Escalona', '+584126742231', 1, 'V-30087582'),
(36, 'AMELIA', 'GARNICAR', '+584266092231', 1, 'V-5435543'),
(44, 'ALI', 'PERNALETE', '+584125695231', 1, 'V-30087583');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--

CREATE TABLE `configuraciones` (
  `id` int(11) NOT NULL,
  `llave` varchar(500) NOT NULL,
  `valor` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `id_usuario_delivery` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `active` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `delivery`
--

INSERT INTO `delivery` (`id`, `id_usuario_delivery`, `id_venta`, `active`) VALUES
(4, 11, 61, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_entradas_materia_prima`
--

CREATE TABLE `detalles_entradas_materia_prima` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `id_materia_prima` int(11) NOT NULL,
  `id_entrada` int(11) NOT NULL,
  `fecha_vencimiento` datetime NOT NULL,
  `existencia` float NOT NULL,
  `cantidad` float DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `broken` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `detalles_entradas_materia_prima`
--

INSERT INTO `detalles_entradas_materia_prima` (`id`, `codigo`, `id_materia_prima`, `id_entrada`, `fecha_vencimiento`, `existencia`, `cantidad`, `active`, `broken`) VALUES
(23, '545454', 8, 85, '2025-10-10 00:00:00', 55, 55, 1, 0);

--
-- Disparadores `detalles_entradas_materia_prima`
--
DELIMITER $$
CREATE TRIGGER `detalles_entradas_materia_prima_AFTER_INSERT` AFTER INSERT ON `detalles_entradas_materia_prima` FOR EACH ROW BEGIN
 -- Actualizar la existencia sumando la cantidad de la nueva entrada
    UPDATE materia_prima 
    SET existencia = CAST(existencia AS DECIMAL(10,2)) + NEW.cantidad
    WHERE id = NEW.id_materia_prima;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `detalles_entradas_materia_prima_AFTER_UPDATE` AFTER UPDATE ON `detalles_entradas_materia_prima` FOR EACH ROW BEGIN
 DECLARE done INT DEFAULT FALSE;
    DECLARE metodo_nombre VARCHAR(25);
    DECLARE tasa_movimiento FLOAT;
    DECLARE precio_compra_entrada FLOAT;
    
    -- Cursor para múltiples pagos
    DECLARE pago_cursor CURSOR FOR 
        SELECT mp.nombre, pemp.tasa, pemp.precio_compra
        FROM pagos_entrada_materia_prima pemp
        INNER JOIN metodo_pago mp ON mp.id = pemp.id_metodo_pago
        WHERE pemp.id_entrada = NEW.id;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Si se desactiva la entrada (active cambia de 1 a 0)
    IF OLD.active = 1 AND NEW.active = 0 THEN
        -- Restar la cantidad de la existencia total en materia_prima
        UPDATE materia_prima 
        SET existencia = existencia - OLD.cantidad 
        WHERE id = NEW.id_materia_prima;
        
        -- Procesar todos los pagos asociados
        OPEN pago_cursor;
        read_loop: LOOP
            FETCH pago_cursor INTO metodo_nombre, tasa_movimiento, precio_compra_entrada;
            IF done THEN
                LEAVE read_loop;
            END IF;
            
            -- Determinar la tasa según el método de pago
            IF metodo_nombre IN ('Pago Movil', 'Transferencia', 'Efectivo') THEN
                SET tasa_movimiento = tasa_movimiento; -- usar la tasa real
            ELSE
                SET tasa_movimiento = 1; -- otros métodos
            END IF;
            
            -- Insertar movimiento positivo para compensar el egreso anterior
            INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
            VALUES (
                precio_compra_entrada, 
                CONCAT('Ingreso por eliminacion de entrada de materia prima nro ', NEW.id),
                NOW(),
                tasa_movimiento
            );
        END LOOP;
        CLOSE pago_cursor;
        
        -- Reset del flag para el siguiente bloque
        SET done = FALSE;
    END IF;
    
    -- Si se reactiva la entrada (active cambia de 0 a 1)
    IF OLD.active = 0 AND NEW.active = 1 THEN
        -- Sumar la cantidad a la existencia total en materia_prima
        UPDATE materia_prima 
        SET existencia = existencia + NEW.cantidad 
        WHERE id = NEW.id_materia_prima;
        
        -- Procesar todos los pagos asociados para revertir compensación
        OPEN pago_cursor;
        read_loop2: LOOP
            FETCH pago_cursor INTO metodo_nombre, tasa_movimiento, precio_compra_entrada;
            IF done THEN
                LEAVE read_loop2;
            END IF;
            
            -- Determinar la tasa según el método de pago
            IF metodo_nombre IN ('Pago Movil', 'Transferencia', 'Efectivo') THEN
                SET tasa_movimiento = tasa_movimiento; -- usar la tasa real
            ELSE
                SET tasa_movimiento = 1; -- otros métodos
            END IF;
            
            -- Insertar movimiento negativo para revertir la compensación
            INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
            VALUES (
                -precio_compra_entrada, 
                CONCAT('Egreso por reactivacion de entrada de materia prima nro ', NEW.id),
                NOW(),
                tasa_movimiento
            );
        END LOOP;
        CLOSE pago_cursor;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `detalles_entradas_materia_prima_BEFORE_UPDATE` BEFORE UPDATE ON `detalles_entradas_materia_prima` FOR EACH ROW BEGIN
-- Declarar la variable al principio del bloque, como exige MySQL
    DECLARE diferencia FLOAT DEFAULT 0;

    -- Lógica Condicional:
    -- Caso 1: Si se modifica la CANTIDAD de la compra
    IF NEW.cantidad <> OLD.cantidad THEN
        SET diferencia = NEW.cantidad - OLD.cantidad;
        
        -- Forzar el cálculo de la existencia del lote
        SET NEW.existencia = OLD.existencia + diferencia;
        
    -- Caso 2: Si solo se modifica la EXISTENCIA (y no la cantidad)
    ELSEIF NEW.existencia <> OLD.existencia THEN
        SET diferencia = NEW.existencia - OLD.existencia;
        -- Aquí se respeta el valor de NEW.existencia que puso el usuario.
    END IF;

    -- Si hubo algún cambio (diferencia no es 0), se actualiza el inventario maestro
    IF diferencia <> 0 THEN
        UPDATE materia_prima
        SET existencia = existencia + diferencia
        WHERE id = NEW.id_materia_prima;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_receta`
--

CREATE TABLE `detalles_receta` (
  `id` int(11) NOT NULL,
  `id_receta` int(11) NOT NULL,
  `id_materia_prima` int(11) NOT NULL,
  `cantidad` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `detalles_receta`
--

INSERT INTO `detalles_receta` (`id`, `id_receta`, `id_materia_prima`, `cantidad`) VALUES
(60, 13, 8, 0.68),
(68, 16, 1, 0.15),
(69, 17, 9, 1),
(70, 17, 8, 0.15),
(71, 17, 6, 0.35),
(72, 18, 6, 0.6),
(73, 19, 5, 0.15),
(74, 13, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas_materia_prima`
--

CREATE TABLE `entradas_materia_prima` (
  `id` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `fecha_compra` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `entradas_materia_prima`
--

INSERT INTO `entradas_materia_prima` (`id`, `id_proveedor`, `fecha_compra`) VALUES
(85, 2, '2025-09-25 20:16:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas_producto_procesado`
--

CREATE TABLE `entradas_producto_procesado` (
  `id` int(11) NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `id_producto` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `fecha_compra` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_vencimiento` datetime DEFAULT NULL,
  `existencia` float NOT NULL,
  `cantidad` float NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `broken` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entradas_producto_procesado`
--

INSERT INTO `entradas_producto_procesado` (`id`, `codigo`, `id_producto`, `id_proveedor`, `id_unidad`, `fecha_compra`, `fecha_vencimiento`, `existencia`, `cantidad`, `active`, `broken`) VALUES
(26, '202020', 42, 1, 1, '2025-09-03 14:02:05', '2025-12-24 00:00:00', 40, 40, 1, 0),
(27, '202020', 41, 2, 1, '2025-09-04 10:37:22', '2025-12-24 00:00:00', 38, 40, 1, 0);

--
-- Disparadores `entradas_producto_procesado`
--
DELIMITER $$
CREATE TRIGGER `entradas_producto_procesado_AFTER_INSERT` AFTER INSERT ON `entradas_producto_procesado` FOR EACH ROW BEGIN
 -- Actualizar la existencia sumando la cantidad de la nueva entrada
    UPDATE productos_procesados
    SET existencia = CAST(existencia AS DECIMAL(10,2)) + NEW.cantidad
    WHERE id = NEW.id_producto;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `entradas_producto_procesado_AFTER_UPDATE` AFTER UPDATE ON `entradas_producto_procesado` FOR EACH ROW BEGIN
 DECLARE done INT DEFAULT FALSE;
    DECLARE metodo_nombre VARCHAR(25);
    DECLARE tasa_movimiento FLOAT;
    DECLARE precio_compra_entrada FLOAT;
    
    -- Cursor para múltiples pagos
    DECLARE pago_cursor CURSOR FOR 
        SELECT mp.nombre, pemp.tasa, pemp.precio_compra
        FROM pagos_entrada_materia_prima pemp
        INNER JOIN metodo_pago mp ON mp.id = pemp.id_metodo_pago
        WHERE pemp.id_entrada = NEW.id;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Si se desactiva la entrada (active cambia de 1 a 0)
    IF OLD.active = 1 AND NEW.active = 0 THEN
        -- Restar la cantidad de la existencia total en materia_prima
        UPDATE productos_procesados 
        SET existencia = existencia - OLD.cantidad 
        WHERE id = NEW.id_producto;
        
        -- Procesar todos los pagos asociados
        OPEN pago_cursor;
        read_loop: LOOP
            FETCH pago_cursor INTO metodo_nombre, tasa_movimiento, precio_compra_entrada;
            IF done THEN
                LEAVE read_loop;
            END IF;
            
            -- Determinar la tasa según el método de pago
            IF metodo_nombre IN ('Pago Movil', 'Transferencia', 'Efectivo') THEN
                SET tasa_movimiento = tasa_movimiento; -- usar la tasa real
            ELSE
                SET tasa_movimiento = 1; -- otros métodos
            END IF;
            
            -- Insertar movimiento positivo para compensar el egreso anterior
            INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
            VALUES (
                precio_compra_entrada, 
                CONCAT('Ingreso por eliminacion de entrada de materia prima nro ', NEW.id),
                NOW(),
                tasa_movimiento
            );
        END LOOP;
        CLOSE pago_cursor;
        
        -- Reset del flag para el siguiente bloque
        SET done = FALSE;
    END IF;
    
    -- Si se reactiva la entrada (active cambia de 0 a 1)
    IF OLD.active = 0 AND NEW.active = 1 THEN
        -- Sumar la cantidad a la existencia total en materia_prima
        UPDATE productos_procesados 
        SET existencia = existencia + NEW.cantidad 
        WHERE id = NEW.id_producto;
        
        -- Procesar todos los pagos asociados para revertir compensación
        OPEN pago_cursor;
        read_loop2: LOOP
            FETCH pago_cursor INTO metodo_nombre, tasa_movimiento, precio_compra_entrada;
            IF done THEN
                LEAVE read_loop2;
            END IF;
            
            -- Determinar la tasa según el método de pago
            IF metodo_nombre IN ('Pago Movil', 'Transferencia', 'Efectivo') THEN
                SET tasa_movimiento = tasa_movimiento; -- usar la tasa real
            ELSE
                SET tasa_movimiento = 1; -- otros métodos
            END IF;
            
            -- Insertar movimiento negativo para revertir la compensación
            INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
            VALUES (
                -precio_compra_entrada, 
                CONCAT('Egreso por reactivacion de entrada de materia prima nro ', NEW.id),
                NOW(),
                tasa_movimiento
            );
        END LOOP;
        CLOSE pago_cursor;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `entradas_producto_procesado_BEFORE_UPDATE` BEFORE UPDATE ON `entradas_producto_procesado` FOR EACH ROW BEGIN
    -- Declarar la variable al principio del bloque, como exige MySQL
    DECLARE diferencia FLOAT DEFAULT 0;

    -- Lógica Condicional:
    -- Caso 1: Si se modifica la CANTIDAD de la compra
    IF NEW.cantidad <> OLD.cantidad THEN
        SET diferencia = NEW.cantidad - OLD.cantidad;
        
        -- Forzar el cálculo de la existencia del lote
        SET NEW.existencia = OLD.existencia + diferencia;
        
    -- Caso 2: Si solo se modifica la EXISTENCIA (y no la cantidad)
    ELSEIF NEW.existencia <> OLD.existencia THEN
        SET diferencia = NEW.existencia - OLD.existencia;
        -- Aquí se respeta el valor de NEW.existencia que puso el usuario.
    END IF;

    -- Si hubo algún cambio (diferencia no es 0), se actualiza el inventario maestro
    IF diferencia <> 0 THEN
        UPDATE productos_procesados
        SET existencia = existencia + diferencia
        WHERE id = NEW.id_producto;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_prima`
--

CREATE TABLE `materia_prima` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `stock_min` int(11) NOT NULL,
  `stock_max` int(11) NOT NULL,
  `existencia` float NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `materia_prima`
--

INSERT INTO `materia_prima` (`id`, `id_categoria`, `id_unidad`, `nombre`, `stock_min`, `stock_max`, `existencia`, `active`) VALUES
(1, 1, 3, 'Pollo', 10, 20, 0, 1),
(2, 1, 3, 'Carne de res', 10, 50, 0, 1),
(3, 3, 3, 'Cebolla', 10, 20, 0, 1),
(4, 3, 3, 'Maíz', 10, 20, 0, 1),
(5, 7, 4, 'Queso cheddar', 10, 20, 0, 1),
(6, 4, 3, 'Salsa especial', 10, 20, 0, 1),
(7, 1, 3, 'Tocineta', 10, 20, 0, 1),
(8, 3, 3, 'Papas', 10, 20, 55, 1),
(9, 2, 4, 'Pan de la casa', 10, 20, 0, 1),
(10, 3, 3, 'Prueba', 1, 5, 0, 1),
(11, 7, 5, 'CONSOLA', 2, 10, 0, 0),
(12, 6, 4, 'CONN', 2, 3, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sillas` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'LIBRE',
  `vip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `nombre`, `sillas`, `estado`, `vip`, `imagen`, `active`) VALUES
(1, 'Mesa 2', '5', 'LIBRE', '0', '5ce0e0f8-46df-4654-b37b-7d7f40d9bc6a.jpeg', '1'),
(2, 'Mesa 45', '10', 'OCUPADA', '1', '7b37d828-2d86-40c5-b54a-9424c5dcc288.jpeg', '1'),
(3, 'Mesa 9', '4', 'LIBRE', '0', '5f395e0a-584d-4540-bc2b-3dba66a98c31.jpeg', '1'),
(4, 'Mesa 10', '7', 'LIBRE', '1', 'championship-leblanc-league-of-legends_3840x2161_xtrafondos.com.jpg', '1'),
(5, 'Mesa inf', '58', 'LIBRE', '0', '2551fe44-3bc1-476e-b084-e7ff84eb8600.jpeg', '0'),
(6, 'Mesa 99', '10', 'LIBRE', '1', '7112d1a7-cfb2-4f35-8848-0394ac5c335d.jpeg', '0'),
(7, 'Mesa 5', '8', 'LIBRE', '1', '5ce0e0f8-46df-4654-b37b-7d7f40d9bc6a.jpeg', '1'),
(8, 'Mesa 6', '5', 'LIBRE', '0', '2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg', '1'),
(9, 'Mesa 2000', '10', 'LIBRE', '0', '19085819.jpg', '0'),
(10, 'Mesa 85', '15', 'LIBRE', '1', '9503026.png', '1'),
(11, 'Otra mesa', '10', 'LIBRE', '0', 'camisa_neww.png', '0'),
(12, 'Mesa prueba', '12', 'LIBRE', '0', '53571.jpg', '0'),
(13, 'Mesa prueba', '12', 'LIBRE', '0', '53571.jpg', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id`, `nombre`, `active`, `imagen`, `descripcion`) VALUES
(1, 'Zelle', 0, NULL, NULL),
(2, 'Binance', 0, NULL, NULL),
(3, 'Pago Movil', 1, NULL, NULL),
(4, 'Efectivo', 1, NULL, NULL),
(9, 'Prueba infinity', 0, NULL, NULL),
(10, 'Prueba 2', 0, NULL, NULL),
(11, 'Transferencia', 1, NULL, NULL),
(12, 'Divisa', 1, NULL, NULL),
(13, 'Zinli', 0, NULL, NULL),
(14, 'Cashea', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_capital`
--

CREATE TABLE `movimientos_capital` (
  `id` int(11) NOT NULL,
  `monto` float NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tasa` float NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `movimientos_capital`
--

INSERT INTO `movimientos_capital` (`id`, `monto`, `descripcion`, `fecha`, `tasa`) VALUES
(1, 50.58, 'Ingreso por venta', '2025-06-12 15:38:52', 1),
(2, -2117.4, 'Egreso por nuevas entradas', '2025-06-12 15:44:58', 1),
(4, -2117.4, 'Ingreso por entrada de materia prima nro 8', '2025-06-12 16:00:05', 1),
(6, 609, 'Ingreso por eliminacion de entrada de producto procesado nro 20', '2025-06-12 16:29:51', 1),
(7, -609, 'Egreso por entrada de producto procesado nro 20', '2025-06-12 16:29:51', 1),
(8, -1015, 'Egreso por nueva entradas', '2025-06-12 16:03:46', 1),
(9, 10000, 'Ingreso por aporte de alidado', '2025-06-12 16:14:45', 1),
(12, 10, 'aporte de aliado', '2025-06-13 15:06:38', 1),
(13, -10, 'me gaste en un toston', '2025-06-13 15:07:46', 1),
(14, 4796.41, 'Ingreso por venta', '2025-06-16 14:51:05', 1),
(15, 66.36, 'Ingreso por venta', '2025-06-16 15:56:19', 1),
(16, 24.7, 'Ingreso por venta', '2025-06-18 09:42:46', 1),
(17, 760.34, 'Ingreso por venta', '2025-06-18 09:46:31', 1),
(18, 2385.19, 'Ingreso por venta', '2025-06-18 09:59:39', 1),
(19, 940.26, 'Ingreso por venta', '2025-06-18 10:02:22', 1),
(20, 4770.38, 'Ingreso por venta', '2025-06-18 10:03:42', 1),
(21, 888.85, 'Ingreso por venta', '2025-06-18 10:05:11', 1),
(22, 1584.34, 'Ingreso por venta', '2025-06-18 10:08:35', 1),
(23, 734.64, 'Ingreso por venta', '2025-06-18 10:10:25', 1),
(24, 2385.19, 'Ingreso por venta', '2025-06-18 10:11:50', 1),
(25, 2385.19, 'Ingreso por venta', '2025-06-18 10:12:55', 1),
(26, 1144.85, 'Ingreso por venta', '2025-06-18 14:10:10', 1),
(27, 2463.82, 'Ingreso por venta', '2025-06-19 10:53:54', 1),
(28, 2463.82, 'Ingreso por venta', '2025-06-19 10:53:54', 1),
(29, 741.28, 'Ingreso por venta', '2025-06-19 17:18:44', 1),
(30, 2463.82, 'Ingreso por venta', '2025-06-19 17:19:52', 1),
(31, 2463.82, 'Ingreso por venta', '2025-06-19 17:19:52', 1),
(32, 799.38, 'Ingreso por venta', '2025-06-19 17:21:58', 1),
(33, 274.87, 'Ingreso por venta', '2025-06-19 17:23:21', 1),
(34, 2432.7, 'Ingreso por venta', '2025-06-19 17:24:07', 1),
(35, 482.35, 'Ingreso por venta', '2025-06-19 17:27:33', 1),
(36, 2463.82, 'Ingreso por venta', '2025-06-19 17:28:35', 1),
(37, 896.89, 'Ingreso por venta', '2025-06-19 17:30:49', 1),
(38, 67.39, 'Ingreso por venta', '2025-06-19 17:31:38', 1),
(39, -2000, 'no se mucho', '2025-06-20 10:16:04', 1),
(40, 348.69, 'Ingreso por venta', '2025-07-02 10:58:52', 1),
(41, 755.23, 'Ingreso por venta', '2025-07-02 11:07:10', 1),
(42, 695.29, 'Ingreso por venta', '2025-07-02 11:10:10', 1),
(43, 695.29, 'Ingreso por venta', '2025-07-02 11:14:02', 1),
(44, 695.29, 'Ingreso por venta', '2025-07-02 13:01:28', 1),
(45, 778.73, 'Ingreso por venta', '2025-07-02 13:19:14', 1),
(46, 72.38, 'Ingreso por venta', '2025-07-05 15:27:16', 1),
(47, 796.16, 'Ingreso por venta', '2025-07-07 14:08:50', 1),
(48, 8.88, 'Ingreso por venta', '2025-07-07 14:11:23', 1),
(49, 719.86, 'Ingreso por venta', '2025-07-09 13:49:23', 1),
(50, 758.71, 'Ingreso por venta', '2025-07-09 19:21:51', 1),
(51, 535.76, 'Ingreso por venta', '2025-07-09 19:28:52', 1),
(52, 197.93, 'Ingreso por venta', '2025-07-09 20:49:13', 1),
(53, 147.88, 'Ingreso por venta', '2025-07-10 14:46:48', 1),
(54, 2340.28, 'Ingreso por venta', '2025-07-16 14:29:07', 1),
(55, 2340.28, 'Ingreso por venta', '2025-07-16 14:31:33', 1),
(56, 2340.28, 'Ingreso por venta', '2025-07-16 14:36:18', 1),
(57, 2340.28, 'Ingreso por venta', '2025-07-16 14:38:59', 1),
(58, 2340.28, 'Ingreso por venta', '2025-07-16 14:45:17', 1),
(59, 2340.28, 'Ingreso por venta', '2025-07-16 14:47:29', 1),
(60, 2340.28, 'Ingreso por venta', '2025-07-16 15:20:47', 1),
(61, 2340.28, 'Ingreso por venta', '2025-07-16 15:23:56', 1),
(62, 424.72, 'Ingreso por venta', '2025-07-25 13:17:13', 1),
(63, 424.72, 'Ingreso por venta', '2025-07-25 13:23:27', 1),
(64, 673.49, 'Ingreso por venta', '2025-07-25 14:07:52', 1),
(65, 424.72, 'Ingreso por venta', '2025-07-25 14:09:34', 1),
(66, 673.49, 'Ingreso por venta', '2025-07-25 14:12:14', 1),
(67, 673.49, 'Ingreso por venta', '2025-07-25 14:21:42', 1),
(68, 916.92, 'Ingreso por venta', '2025-08-06 12:51:57', 1),
(69, 818.17, 'Ingreso por venta', '2025-08-06 12:57:59', 1),
(70, 1636.34, 'Ingreso por venta', '2025-08-06 13:10:04', 1),
(71, 83.36, 'Ingreso por venta', '2025-08-06 13:24:44', 1),
(72, 166.71, 'Ingreso por venta', '2025-08-06 13:26:44', 1),
(73, 1295.22, 'Ingreso por venta', '2025-08-06 13:28:11', 1),
(74, 916.92, 'Ingreso por venta', '2025-08-06 13:35:00', 1),
(75, 734.79, 'Ingreso por venta', '2025-08-06 13:48:31', 1),
(76, 855.36, 'Ingreso por venta', '2025-08-06 14:04:46', 1),
(77, 743.79, 'Ingreso por venta', '2025-08-06 14:06:41', 1),
(78, 223.14, 'Ingreso por venta', '2025-08-06 14:19:23', 1),
(79, 954.11, 'Ingreso por venta', '2025-08-06 14:21:35', 1),
(80, 83.36, 'Ingreso por venta', '2025-08-06 14:35:31', 1),
(81, 165.43, 'Ingreso por venta', '2025-08-06 14:37:43', 1),
(82, 1140.05, 'Ingreso por venta', '2025-08-06 14:38:35', 1),
(83, 7.79788, 'Ingreso por Transferencia', '2025-08-06 15:51:08', 1),
(84, 9.4656, 'Ingreso por Pago Movil', '2025-08-09 12:16:53', 1),
(85, 7.14559, 'Ingreso por Pago Movil', '2025-08-09 12:27:27', 1),
(86, 6.38003, 'Ingreso por Pago Movil', '2025-08-09 13:16:22', 1),
(87, 1.2876, 'Ingreso por Pago Movil', '2025-08-09 13:20:45', 1),
(88, 5, 'Ingreso por Pago Movil', '2025-08-09 13:24:45', 1),
(89, 7.55858, 'Ingreso por Pago Movil', '2025-08-12 13:03:42', 1),
(90, 7.4452, 'Ingreso por Transferencia', '2025-08-12 13:03:43', 1),
(91, 10.4105, 'Ingreso por Pago Movil', '2025-08-14 13:52:14', 1),
(92, 10.4105, 'Ingreso por Pago Movil', '2025-08-14 13:55:25', 1),
(93, 0.594884, 'Ingreso por Pago Movil', '2025-08-14 14:11:31', 1),
(94, 0.148721, 'Ingreso por Pago Movil', '2025-08-14 14:20:36', 1),
(95, 0.743605, 'Ingreso por Pago Movil', '2025-08-14 14:25:12', 1),
(96, 0.148721, 'Ingreso por Pago Movil', '2025-08-14 14:28:29', 1),
(97, 0.148721, 'Ingreso por Pago Movil', '2025-08-14 14:32:27', 1),
(98, 0.148721, 'Ingreso por Pago Movil', '2025-08-14 14:34:04', 1),
(99, 5.79165, 'Ingreso por Pago Movil', '2025-08-20 12:36:23', 1),
(100, 7.23956, 'Ingreso por Pago Movil', '2025-08-20 12:50:58', 1),
(101, 7.23956, 'Ingreso por Pago Movil', '2025-08-20 12:58:14', 1),
(102, 7.23956, 'Ingreso por Pago Movil', '2025-08-20 13:03:17', 1),
(103, 5.79165, 'Ingreso por Pago Movil', '2025-08-20 13:04:12', 1),
(104, -1250, 'Egreso por nueva entradas', '2025-08-25 11:20:23', 1),
(105, -2500, 'Egreso por nueva entradas', '2025-08-25 11:21:23', 1),
(106, -600, 'Egreso por nueva entradas', '2025-08-25 11:22:04', 1),
(107, -1800, 'Egreso por nueva entradas', '2025-08-25 11:23:52', 1),
(108, -750, 'Egreso por nueva entradas', '2025-08-26 10:57:08', 1),
(109, -36750, 'Egreso por nueva entradas', '2025-08-26 13:49:47', 1),
(113, -2000, 'Egreso por entrada de materia prima nro 39', '2025-09-01 14:11:54', 148.44),
(114, -1500, 'Egreso por entrada de materia prima nro 39', '2025-09-01 14:11:54', 148.44),
(115, -1500, 'Egreso por entrada de materia prima nro 40', '2025-09-01 14:46:24', 148.44),
(116, -3500, 'Egreso por entrada de materia prima nro 27', '2025-09-04 10:37:23', 151.76),
(117, -42.34, 'Egreso por entrada de materia prima nro 71', '2025-09-25 14:08:19', 171.85),
(118, -49848.9, 'Egreso por entrada de materia prima nro 72', '2025-09-25 14:08:19', 171.85),
(119, -42.34, 'Egreso por entrada de materia prima nro 73', '2025-09-25 14:09:24', 171.85),
(120, -49848.9, 'Egreso por entrada de materia prima nro 74', '2025-09-25 14:09:24', 171.85),
(121, -350, 'Egreso por entrada de materia prima nro 75', '2025-09-25 14:16:40', 171.85),
(122, -489.48, 'Egreso por entrada de materia prima nro 76', '2025-09-25 14:19:37', 171.85),
(123, -150, 'Egreso por entrada de materia prima nro 78', '2025-09-25 15:06:06', 171.85),
(124, -150, 'Egreso por entrada de materia prima nro 79', '2025-09-25 15:06:34', 171.85),
(125, -48.48, 'Egreso por entrada de materia prima nro 80', '2025-09-25 15:09:32', 171.85),
(126, -848.48, 'Egreso por entrada de materia prima nro 81', '2025-09-25 15:12:37', 171.85),
(127, -94.94, 'Egreso por entrada de materia prima nro 82', '2025-09-25 15:15:07', 171.85),
(128, -484.84, 'Egreso por entrada de materia prima nro 83', '2025-09-25 15:16:13', 171.85),
(129, -155, 'Egreso por entrada de materia prima nro 84', '2025-09-25 15:23:05', 171.85),
(130, -1500, 'Egreso por entrada de materia prima nro 85', '2025-09-25 20:16:15', 171.85);

--
-- Disparadores `movimientos_capital`
--
DELIMITER $$
CREATE TRIGGER `movimientos_capital_AFTER_INSERT` AFTER INSERT ON `movimientos_capital` FOR EACH ROW BEGIN
UPDATE capital SET monto = monto + NEW.monto WHERE id = 1;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `nro_orden` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(500) NOT NULL DEFAULT '0',
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id`, `id_cliente`, `nro_orden`, `fecha`, `status`, `tipo`) VALUES
(80, NULL, 91485100, '2025-07-03 15:46:14', 'en cocina', 'local'),
(81, 1, 63411000, '2025-07-03 19:52:49', 'pagado', 'local'),
(83, 1, 57834000, '2025-07-07 18:08:46', 'anulada', 'llevar'),
(84, 1, 45966800, '2025-07-07 18:11:22', 'en cocina', 'llevar'),
(85, 1, 66983700, '2025-07-09 17:49:12', 'entregada', 'delivery'),
(86, 1, 48539300, '2025-07-09 23:21:49', 'anulada', 'delivery'),
(87, 1, 53998900, '2025-07-09 23:28:50', 'en camino', 'delivery'),
(88, 1, 46259600, '2025-07-10 00:49:12', 'para despachar', 'delivery'),
(89, 1, 87626000, '2025-07-10 18:46:47', 'en cocina', 'llevar'),
(90, NULL, 40394500, '2025-07-16 17:47:21', 'en cocina', 'local'),
(91, NULL, 61900800, '2025-07-16 17:50:57', 'en mesa', 'local'),
(101, 44, 10431500, '2025-07-25 18:21:42', 'pagado', 'reserva'),
(102, 1, 44910200, '2025-08-06 16:51:53', 'en cocina', 'delivery'),
(103, 36, 81645900, '2025-08-06 16:57:55', 'en cocina', 'delivery'),
(104, 1, 94405200, '2025-08-06 17:10:03', 'en cocina', 'llevar'),
(105, 1, 60740500, '2025-08-06 17:24:43', 'en cocina', 'delivery'),
(106, 1, 74482600, '2025-08-06 17:26:43', 'en cocina', 'delivery'),
(107, 36, 91673300, '2025-08-06 17:28:10', 'en cocina', 'llevar'),
(108, 1, 54932400, '2025-08-06 17:34:59', 'en cocina', 'delivery'),
(109, 1, 87668500, '2025-08-06 17:48:29', 'en cocina', 'llevar'),
(110, 36, 26105400, '2025-08-06 18:04:45', 'en cocina', 'delivery'),
(111, 1, 44316100, '2025-08-06 18:06:39', 'en cocina', 'llevar'),
(112, 1, 63058700, '2025-08-06 18:19:20', 'en cocina', 'delivery'),
(113, 1, 39248300, '2025-08-06 18:21:33', 'en cocina', 'llevar'),
(114, 36, 62197100, '2025-08-06 18:35:24', 'para despachar', 'delivery'),
(115, 1, 43673800, '2025-08-06 18:37:42', 'en cocina', 'llevar'),
(116, 1, 22618600, '2025-08-06 18:38:34', 'en preparacion', 'delivery'),
(117, 36, 72337000, '2025-08-09 16:13:49', 'pagado', 'local'),
(118, 36, 52566000, '2025-08-09 16:25:56', 'pagado', 'local'),
(119, NULL, 63436300, '2025-08-09 16:29:01', 'en mesa', 'local'),
(126, NULL, 93394400, '2025-08-09 16:57:23', 'en cocina', 'local'),
(127, NULL, 35454300, '2025-08-09 16:59:59', 'para despachar', 'local'),
(128, 36, 12591700, '2025-08-09 17:01:15', 'pagado', 'local'),
(129, 36, 44447700, '2025-08-09 17:01:37', 'pagado', 'local'),
(130, 36, 95047700, '2025-08-09 17:18:34', 'pagado', 'local'),
(131, 36, 29741700, '2025-08-09 17:24:44', 'en mesa', 'reserva'),
(132, 1, 31299400, '2025-08-12 17:03:42', 'pagado', 'reserva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_mesa`
--

CREATE TABLE `orden_mesa` (
  `id` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `orden_mesa`
--

INSERT INTO `orden_mesa` (`id`, `id_orden`, `id_mesa`) VALUES
(1, 80, 1),
(2, 81, 3),
(3, 90, 7),
(4, 91, 8),
(5, 117, 3),
(6, 118, 3),
(7, 119, 3),
(14, 126, 3),
(15, 127, 3),
(16, 128, 1),
(17, 129, 3),
(18, 130, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `id_metodo_pago` int(11) NOT NULL,
  `monto` float NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tasa` float NOT NULL,
  `comprobante` varchar(500) DEFAULT NULL,
  `referencia` varchar(500) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `id_metodo_pago`, `monto`, `fecha`, `tasa`, `comprobante`, `referencia`, `status`) VALUES
(50, 3, 796.16, '2025-07-07 14:08:50', 111.42, 'cap.jpg', '2569', 1),
(51, 12, 8.88, '2025-07-07 14:11:23', 111.42, 'cap.jpg', '1456', 1),
(52, 3, 836.55, '2025-08-09 15:53:03', 112.83, 'cap.jpg', '7841', 1),
(53, 3, 758.71, '2025-07-09 19:21:51', 113.75, 'cap.jpg', '1247', 1),
(54, 3, 535.76, '2025-07-09 19:28:52', 113.75, 'cap.jpg', '7896', 1),
(55, 3, 197.93, '2025-07-09 20:49:13', 113.75, 'cap.jpg', '2998', 1),
(56, 11, 147.88, '2025-07-10 14:46:48', 113.75, 'cap.jpg', '6484', 1),
(64, 3, 2340.28, '2025-07-16 15:23:56', 116.82, 'cap.jpg', '8484', 1),
(70, 3, 673.49, '2025-07-25 14:21:42', 121.35, 'cap.jpg', '59595', 1),
(71, 3, 916.92, '2025-08-06 12:51:57', 128.24, 'cap.jpg', '59595', 1),
(72, 3, 818.17, '2025-08-06 12:57:59', 128.24, 'cap.jpg', '1891', 1),
(73, 3, 1636.34, '2025-08-06 13:10:04', 128.24, 'cap.jpg', '5494', 1),
(74, 3, 83.36, '2025-08-06 13:24:44', 128.24, 'cap.jpg', '995', 1),
(75, 3, 166.71, '2025-08-06 13:26:44', 128.24, 'cap.jpg', '13123', 1),
(76, 3, 1295.22, '2025-08-06 13:28:11', 128.24, 'cap.jpg', '1323', 1),
(77, 11, 916.92, '2025-08-06 13:35:00', 128.24, 'cap.jpg', '49489', 1),
(78, 3, 734.79, '2025-08-06 13:48:31', 128.24, 'cap.jpg', '81981', 1),
(79, 3, 855.36, '2025-08-06 14:04:46', 128.24, 'cap.jpg', '2313', 1),
(80, 3, 743.79, '2025-08-06 14:06:41', 128.24, 'cap.jpg', '58948', 1),
(81, 3, 223.14, '2025-08-06 14:19:23', 128.24, 'cap.jpg', '9595', 1),
(82, 3, 954.11, '2025-08-06 14:21:35', 128.24, 'cap.jpg', '9595', 1),
(83, 3, 83.36, '2025-08-06 14:35:31', 128.24, 'cap.jpg', '8962', 1),
(84, 3, 165.43, '2025-08-06 14:37:43', 128.24, 'cap.jpg', '48648', 1),
(85, 11, 1140.05, '2025-08-06 14:38:35', 128.24, 'cap.jpg', '9780', 1),
(87, 3, 1241.13, '2025-08-09 12:16:53', 131.12, 'cap.jpg', '59595', 1),
(88, 3, 936.93, '2025-08-09 12:27:27', 131.12, 'cap.jpg', '8984', 1),
(89, 3, 836.55, '2025-08-09 13:16:22', 131.12, 'cap.jpg', '9595', 1),
(90, 3, 168.83, '2025-08-09 13:20:45', 131.12, 'cap.jpg', '9445', 1),
(91, 3, 655.6, '2025-08-09 13:24:45', 131.12, 'cap.jpg', '994', 1),
(92, 3, 1000, '2025-08-12 13:03:42', 132.3, 'cap.jpg', '6262', 1),
(93, 11, 985, '2025-08-12 13:03:43', 132.3, 'cap.jpg', '69292', 1),
(101, 3, 20, '2025-08-14 14:34:04', 134.48, 'cap.jpg', '9594', 1),
(105, 3, 1000, '2025-08-20 13:03:17', 138.13, 'cap.jpg', '6484', 1),
(106, 3, 800, '2025-08-20 13:04:12', 138.13, 'cap.jpg', '94884', 1);

--
-- Disparadores `pagos`
--
DELIMITER $$
CREATE TRIGGER `pagos_AFTER_INSERT` AFTER INSERT ON `pagos` FOR EACH ROW BEGIN
	 DECLARE metodo VARCHAR(25);
    DECLARE tasa_movimiento FLOAT;

    -- Obtener nombre del método de pago
    SELECT nombre 
    INTO metodo
    FROM metodo_pago
    WHERE id = NEW.id_metodo_pago;

    -- Determinar la tasa según el método de pago
    IF metodo IN ('Transferencia', 'Pago Movil', 'Efectivo') THEN
        SET tasa_movimiento = NEW.tasa;
    ELSE
        SET tasa_movimiento = 1;
    END IF;

    -- Insertar en movimientos_capital
    INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
    VALUES (
        NEW.monto, 
        CONCAT('Ingreso por ', metodo), 
        NOW(),
        tasa_movimiento
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_entrada_materia_prima`
--

CREATE TABLE `pagos_entrada_materia_prima` (
  `id` int(11) NOT NULL,
  `id_metodo_pago` int(11) NOT NULL,
  `id_entrada` int(11) NOT NULL,
  `tasa` float NOT NULL DEFAULT 1,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `precio_compra` float NOT NULL,
  `comprobante` varchar(500) NOT NULL,
  `referencia` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pagos_entrada_materia_prima`
--

INSERT INTO `pagos_entrada_materia_prima` (`id`, `id_metodo_pago`, `id_entrada`, `tasa`, `fecha`, `precio_compra`, `comprobante`, `referencia`) VALUES
(42, 3, 85, 171.85, '2025-09-25 20:16:15', 1500, 'cap.jpg', '48484');

--
-- Disparadores `pagos_entrada_materia_prima`
--
DELIMITER $$
CREATE TRIGGER `pagos_entrada_materia_prima_AFTER_INSERT` AFTER INSERT ON `pagos_entrada_materia_prima` FOR EACH ROW BEGIN
DECLARE metodo_nombre VARCHAR(25);
    DECLARE tasa_movimiento FLOAT;
    DECLARE monto_egreso FLOAT;
    
    -- Obtener el nombre del método de pago
    SELECT nombre INTO metodo_nombre 
    FROM metodo_pago 
    WHERE id = NEW.id_metodo_pago;
    
    -- Determinar la tasa según el método de pago
    IF metodo_nombre IN ('Pago Movil', 'Transferencia', 'Efectivo') THEN
        SET tasa_movimiento = NEW.tasa;
    ELSE
        SET tasa_movimiento = 1;
    END IF;
    
    -- Calcular el monto del egreso (negativo porque es un gasto)
    SET monto_egreso = -NEW.precio_compra;
    
    -- Insertar el movimiento de capital
    INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
    VALUES (
        monto_egreso, 
        CONCAT('Egreso por entrada de materia prima nro ', NEW.id_entrada),
        NEW.fecha,
        tasa_movimiento
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_entrada_producto_procesado`
--

CREATE TABLE `pagos_entrada_producto_procesado` (
  `id` int(11) NOT NULL,
  `id_entrada` int(11) NOT NULL,
  `id_metodo_pago` int(11) NOT NULL,
  `tasa` float NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `precio_compra` float NOT NULL,
  `comprobante` varchar(500) NOT NULL,
  `referencia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pagos_entrada_producto_procesado`
--

INSERT INTO `pagos_entrada_producto_procesado` (`id`, `id_entrada`, `id_metodo_pago`, `tasa`, `fecha`, `precio_compra`, `comprobante`, `referencia`) VALUES
(3, 26, 3, 150.8, '2025-09-03 14:02:05', 5500, 'cap.jpg', '62626'),
(4, 27, 3, 151.76, '2025-09-04 10:37:23', 3500, 'cap.jpg', '62626');

--
-- Disparadores `pagos_entrada_producto_procesado`
--
DELIMITER $$
CREATE TRIGGER `pagos_entrada_producto_procesado_AFTER_INSERT` AFTER INSERT ON `pagos_entrada_producto_procesado` FOR EACH ROW BEGIN
DECLARE metodo_nombre VARCHAR(25);
    DECLARE tasa_movimiento FLOAT;
    DECLARE monto_egreso FLOAT;
    
    -- Obtener el nombre del método de pago
    SELECT nombre INTO metodo_nombre 
    FROM metodo_pago 
    WHERE id = NEW.id_metodo_pago;
    
    -- Determinar la tasa según el método de pago
    IF metodo_nombre IN ('Pago Movil', 'Transferencia', 'Efectivo') THEN
        SET tasa_movimiento = NEW.tasa;
    ELSE
        SET tasa_movimiento = 1;
    END IF;
    
    -- Calcular el monto del egreso (negativo porque es un gasto)
    SET monto_egreso = -NEW.precio_compra;
    
    -- Insertar el movimiento de capital
    INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
    VALUES (
        monto_egreso, 
        CONCAT('Egreso por entrada de materia prima nro ', NEW.id_entrada),
        NEW.fecha,
        tasa_movimiento
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_reserva`
--

CREATE TABLE `pago_reserva` (
  `id` int(11) NOT NULL,
  `id_reserva` int(11) DEFAULT NULL,
  `id_pago` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pago_reserva`
--

INSERT INTO `pago_reserva` (`id`, `id_reserva`, `id_pago`) VALUES
(5, 8, 70),
(6, 9, 91),
(7, 10, 92),
(8, 10, 93),
(15, 9, 101),
(17, 10, 106);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_venta`
--

CREATE TABLE `pago_venta` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_pago` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pago_venta`
--

INSERT INTO `pago_venta` (`id`, `id_venta`, `id_pago`) VALUES
(5, 57, 50),
(6, 58, 51),
(7, 59, 52),
(8, 60, 53),
(9, 61, 54),
(10, 62, 55),
(11, 63, 56),
(19, 71, 64),
(20, 72, 71),
(21, 73, 72),
(22, 74, 73),
(23, 75, 74),
(24, 76, 75),
(25, 77, 76),
(26, 78, 77),
(27, 79, 78),
(28, 80, 79),
(29, 81, 80),
(30, 82, 81),
(31, 83, 82),
(32, 84, 83),
(33, 85, 84),
(34, 86, 85),
(35, 87, 87),
(36, 88, 88),
(37, 89, 89),
(38, 90, 90),
(39, 91, 105);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetes_mesas`
--

CREATE TABLE `paquetes_mesas` (
  `id` int(11) NOT NULL,
  `id_paquete` int(11) DEFAULT NULL,
  `id_mesa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `paquetes_mesas`
--

INSERT INTO `paquetes_mesas` (`id`, `id_paquete`, `id_mesa`) VALUES
(11, 4, 1),
(12, 4, 3),
(14, 6, 8),
(15, 7, 7),
(16, 8, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetes_reservacion`
--

CREATE TABLE `paquetes_reservacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `precio` float NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `paquetes_reservacion`
--

INSERT INTO `paquetes_reservacion` (`id`, `nombre`, `precio`, `active`) VALUES
(4, 'Paquete Basico', 5.55, 1),
(6, 'Paquete Normal', 3.5, 1),
(7, 'Paquete Maximus', 15, 1),
(8, 'Paquete prueba', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_preparados`
--

CREATE TABLE `productos_preparados` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL DEFAULT 10,
  `nombre` varchar(500) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `precio` float NOT NULL,
  `detalles` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `productos_preparados`
--

INSERT INTO `productos_preparados` (`id`, `id_categoria`, `nombre`, `imagen`, `precio`, `detalles`, `active`, `tipo`) VALUES
(41, 7, 'Hamburguesa sencilla', 'banner_captcha.png', 5.5, 'mucho detalle aqui', 1, 'producto'),
(42, 7, 'Pruba', '7893000979932.jpg', 0.56, 'dadkawpdkpoakdokada', 0, 'producto'),
(43, 7, 'Ninncwda', '7702535011805-20-281-29.webp', 74.87, 'dawdalwdmawldmwadaw', 0, 'producto'),
(44, 7, 'SWSADA', 'harina-pan.jpg', 0.56, 'DAWDADAWDADADADA', 0, 'producto'),
(45, 7, 'Super Smasher', 'banner_register.png', 0.56, 'mucha descripcion', 1, 'producto'),
(46, 10, 'Carne', '2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg', 0.56, NULL, 1, 'adicional'),
(47, 10, 'Papitas', 'DIABLITOS-UNDERWOOD.jpg', 0.25, NULL, 1, 'adicional'),
(48, 10, 'Nuggets', 'arroz.jpeg', 2, NULL, 1, 'adicional'),
(49, 10, 'Ensalada', '7594005430045.jpg', 1.5, NULL, 1, 'adicional'),
(50, 10, 'Salsa Inglesa', 'harina-pan.jpg', 0.55, NULL, 1, 'adicional'),
(51, 10, 'Jamon', '7502223708136_1.jpg', 2.5, NULL, 1, 'adicional'),
(52, 5, 'Smash Burger', '5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg', 6.16, 'dawdawdawdawdadawd', 1, 'producto'),
(53, 4, 'Perro Caliente Max', 'banner_register.png', 3.8, 'algun detalle q poner', 1, 'producto'),
(54, 8, 'Pizza Max', 'banner_login.png', 15, 'una pizza muy grande', 1, 'producto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_procesados`
--

CREATE TABLE `productos_procesados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `precio` float NOT NULL,
  `detalles` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL,
  `existencia` float NOT NULL DEFAULT 0,
  `stock_min` float NOT NULL DEFAULT 0,
  `stock_max` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_procesados`
--

INSERT INTO `productos_procesados` (`id`, `nombre`, `imagen`, `precio`, `detalles`, `active`, `id_categoria`, `existencia`, `stock_min`, `stock_max`) VALUES
(41, 'Gloup 1L', 'ImgThumb.jpg', 5, 'dawdwdwadascacacac', 1, 1, 38, 2, 20),
(42, 'Coca Cola', 'OIP.jpeg', 1.5, 'Coca cola de 1.5L', 1, 1, 40, 10, 50),
(43, 'Sun 1L', 'ImgThumb.jpg', 1, 'bebida alternativa a gloup', 1, 1, 0, 3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_preparado_detalle_orden`
--

CREATE TABLE `producto_preparado_detalle_orden` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `adicionales` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto_preparado_detalle_orden`
--

INSERT INTO `producto_preparado_detalle_orden` (`id`, `id_producto`, `id_orden`, `cantidad`, `descripcion`, `adicionales`, `active`) VALUES
(142, 41, 80, '1', '', '', 1),
(143, 52, 81, '1', '', 'Salsa Inglesa', 1),
(144, 50, 81, '1', NULL, NULL, 1),
(145, 45, 81, '1', '', '', 1),
(147, 52, 83, '1', '', '', 1),
(148, 41, 84, '1', '', 'Jamon', 1),
(149, 51, 84, '1', NULL, NULL, 1),
(150, 41, 85, '1', '', '', 1),
(151, 41, 86, '1', 'sin mostaza', 'Papitas', 1),
(152, 47, 86, '1', NULL, NULL, 1),
(153, 45, 87, '1', '', 'Nuggets', 1),
(154, 48, 87, '1', NULL, NULL, 1),
(155, 45, 89, '2', '', '', 1),
(156, 52, 90, '1', '', '', 1),
(157, 52, 102, '1', '', 'Salsa Inglesa', 1),
(158, 50, 102, '1', NULL, NULL, 1),
(159, 41, 103, '1', '', '', 1),
(160, 41, 104, '1', '', 'Jamon,Ensalada', 1),
(161, 49, 104, '1', NULL, NULL, 1),
(162, 51, 104, '1', NULL, NULL, 1),
(163, 45, 105, '1', '', '', 1),
(164, 45, 106, '1', '', '', 1),
(165, 45, 106, '1', '', '', 1),
(166, 52, 107, '1', '', 'Salsa Inglesa,Nuggets', 1),
(167, 48, 107, '1', NULL, NULL, 1),
(168, 50, 107, '1', NULL, NULL, 1),
(169, 52, 108, '1', '', '', 1),
(170, 41, 110, '1', '', 'Papitas', 1),
(171, 47, 110, '1', NULL, NULL, 1),
(172, 52, 113, '1', '', 'Papitas', 1),
(173, 47, 113, '1', NULL, NULL, 1),
(174, 45, 114, '1', '', '', 1),
(175, 45, 115, '1', '', 'Salsa Inglesa', 1),
(176, 50, 115, '1', NULL, NULL, 1),
(177, 52, 116, '1', '', 'Ensalada', 1),
(178, 49, 116, '1', NULL, NULL, 1),
(179, 52, 117, '1', '', 'Nuggets', 1),
(180, 48, 117, '1', NULL, NULL, 1),
(181, 52, 118, '1', '', '', 1),
(182, 41, 119, '1', '', '', 1),
(189, 41, 126, '1', '', '', 1),
(190, 52, 127, '1', '', '', 1),
(191, 52, 128, '1', '', '', 1),
(192, 41, 129, '1', '', '', 1),
(193, 45, 130, '1', '', 'Salsa Inglesa', 1),
(194, 50, 130, '1', NULL, NULL, 1),
(195, 45, 132, '1', '', 'Ensalada', 1),
(196, 49, 132, '1', NULL, NULL, 1),
(197, 52, 132, '1', '', '', 1),
(198, 52, 132, '1', '', '', 1),
(199, 41, 131, '1', '', '', 1),
(203, 41, 127, '1', '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_procesado_detalle_orden`
--

CREATE TABLE `producto_procesado_detalle_orden` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto_procesado_detalle_orden`
--

INSERT INTO `producto_procesado_detalle_orden` (`id`, `id_producto`, `id_orden`, `cantidad`) VALUES
(16, 42, 80, '1'),
(17, 41, 81, '1'),
(18, 42, 80, '1'),
(19, 41, 81, '1'),
(20, 42, 87, '1'),
(21, 42, 88, '1'),
(22, 42, 91, '1'),
(23, 42, 104, '1'),
(24, 41, 109, '1'),
(25, 41, 111, '1'),
(26, 42, 112, '1'),
(27, 42, 132, '1'),
(28, 42, 132, '1'),
(29, 42, 131, '1'),
(30, 42, 101, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `razon_social` varchar(50) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `n_telefono1` varchar(20) NOT NULL,
  `n_telefono2` varchar(45) DEFAULT NULL,
  `direccion` varchar(500) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `razon_social`, `documento`, `n_telefono1`, `n_telefono2`, `direccion`, `active`) VALUES
(1, 'Luis Perez', 'Montecarmelo', 'V-5435543', '+584126742231', '', 'una direccion para especificar', 1),
(2, 'Lucas Martinez', 'El tunal', 'V-10254789', '+584126879568', '', 'sede central de tunal, quibor', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `id_producto`, `active`) VALUES
(13, 41, 1),
(16, 48, 1),
(17, 45, 1),
(18, 50, 1),
(19, 54, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

CREATE TABLE `reservaciones` (
  `id` int(11) NOT NULL,
  `id_paquete` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `descripcion` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_bloqueo` datetime DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `metodo_pedido` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `reservaciones`
--

INSERT INTO `reservaciones` (`id`, `id_paquete`, `id_orden`, `id_caja`, `descripcion`, `fecha_bloqueo`, `fecha_inicio`, `fecha_final`, `metodo_pedido`, `status`) VALUES
(8, 6, 101, 30, NULL, '2025-08-19 18:30:00', '2025-08-19 19:30:00', NULL, 'Sistema', 'finalizada'),
(9, 8, 131, 31, NULL, '2025-08-21 18:30:00', '2025-08-21 19:30:00', NULL, 'Sistema', 'confirmada'),
(10, 7, 132, 31, NULL, '2025-08-30 18:30:00', '2025-08-30 19:30:00', '2025-08-20 13:04:11', 'Sistema', 'finalizada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `alias` varchar(4) NOT NULL,
  `active` varchar(45) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `nombre`, `alias`, `active`) VALUES
(1, 'Litro', 'Lt', '1'),
(2, 'Gramo', 'Gr', '1'),
(3, 'Kilogramo', 'Kg', '1'),
(4, 'Unidad', 'Ud', '1'),
(5, 'Mililitro', 'Ml', '1'),
(7, 'Prueba', 'P', '0'),
(8, 'Prueba1', '1', '0'),
(9, 'Prueba2', '2', '0'),
(10, 'Prueba3', '2', '0'),
(11, 'PRUEBS', 'pr', '0'),
(12, 'Otra', 'ass', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `IVA` float DEFAULT NULL,
  `monto_final` float NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `direccion` varchar(500) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_caja`, `id_orden`, `IVA`, `monto_final`, `fecha`, `direccion`, `active`) VALUES
(57, 27, 83, NULL, 7.15, '2025-07-07 14:08:46', 'circunvalacion', 1),
(58, 27, 84, NULL, 8.88, '2025-07-07 14:11:23', 'fraternidad', 1),
(59, 28, 85, NULL, 6.38, '2025-07-09 13:49:15', 'direccion de envio', 1),
(60, 28, 86, NULL, 6.67, '2025-07-09 19:21:51', 'en mi casa', 1),
(61, 28, 87, NULL, 4.71, '2025-07-09 19:28:51', 'en mi casa', 1),
(62, 28, 88, NULL, 1.74, '2025-07-09 20:49:13', 'NAAD', 1),
(63, 29, 89, NULL, 1.3, '2025-07-10 14:46:47', 'nada', 1),
(71, 29, 81, NULL, 20.03, '2025-07-16 15:23:56', 'BURGER HOUSE', 1),
(72, 30, 102, NULL, 7.15, '2025-08-06 12:51:54', 'en mi casa', 1),
(73, 30, 103, NULL, 6.38, '2025-08-06 12:57:55', 'nose', 1),
(74, 30, 104, NULL, 12.76, '2025-08-06 13:10:04', 'en mi casa', 1),
(75, 30, 105, NULL, 0.65, '2025-08-06 13:24:43', 'nada', 1),
(76, 30, 106, NULL, 1.3, '2025-08-06 13:26:43', 'dasda', 1),
(77, 30, 107, NULL, 10.1, '2025-08-06 13:28:11', 'quien sabe', 1),
(78, 30, 108, NULL, 7.15, '2025-08-06 13:34:59', 'uguig', 1),
(79, 30, 109, NULL, 5.8, '2025-08-06 13:48:30', 'dadwda', 1),
(80, 30, 110, NULL, 6.67, '2025-08-06 14:04:45', 'nose', 1),
(81, 30, 111, NULL, 5.8, '2025-08-06 14:06:40', 'ijij', 1),
(82, 30, 112, NULL, 1.74, '2025-08-06 14:19:21', 'en mi casa', 1),
(83, 30, 113, NULL, 7.44, '2025-08-06 14:21:34', 'nose', 1),
(84, 30, 114, NULL, 0.65, '2025-08-06 14:35:30', 'nada', 1),
(85, 30, 115, NULL, 1.29, '2025-08-06 14:37:43', 'add', 1),
(86, 30, 116, NULL, 8.89, '2025-08-06 14:38:35', 'dadwad', 1),
(87, 31, 117, NULL, 9.47, '2025-08-09 12:16:53', 'BURGER HOUSE', 1),
(88, 31, 118, NULL, 7.15, '2025-08-09 12:27:27', 'BURGER HOUSE', 1),
(89, 31, 129, NULL, 6.38, '2025-08-09 13:16:22', 'BURGER HOUSE', 1),
(90, 31, 130, NULL, 1.29, '2025-08-09 13:20:45', 'BURGER HOUSE', 1),
(91, 31, 128, NULL, 7.15, '2025-08-20 13:03:17', 'BURGER HOUSE', 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_inventario_materia_prima`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_inventario_materia_prima` (
`materia_prima` varchar(20)
,`entradas` double
,`salidas` double
,`valor_stock` double(19,2)
,`stock_actual` float
,`unidad` varchar(4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_inventario_productos_procesados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_inventario_productos_procesados` (
`producto` varchar(500)
,`entradas` double
,`salidas` double
,`valor_stock` double(19,2)
,`stock_actual` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_resumen_clientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_resumen_clientes` (
`cliente` text
,`apellido` varchar(45)
,`telefono` varchar(20)
,`ultima_orden` varchar(24)
,`total_gastado` double(19,2)
,`producto_1` varchar(500)
,`imagen_1` varchar(500)
,`producto_2` varchar(500)
,`imagen_2` varchar(500)
,`producto_3` varchar(500)
,`imagen_3` varchar(500)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_resumen_financiero`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_resumen_financiero` (
`ingresos` double(19,2)
,`ventas` double(19,2)
,`gastos` double(19,2)
,`utilidad_neta` double(19,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_inventario_materia_prima`
--
DROP TABLE IF EXISTS `vista_inventario_materia_prima`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_inventario_materia_prima`  AS WITH entradas_totales AS (SELECT `detalles_entradas_materia_prima`.`id_materia_prima` AS `id_materia_prima`, sum(`detalles_entradas_materia_prima`.`cantidad`) AS `total_comprado` FROM `detalles_entradas_materia_prima` GROUP BY `detalles_entradas_materia_prima`.`id_materia_prima`), valor_entradas_normalizado AS (SELECT `emp`.`id_materia_prima` AS `id_materia_prima`, sum(case when `pemp`.`id_metodo_pago` in (1,2,12,13) then `pemp`.`precio_compra` else `pemp`.`precio_compra` / `pemp`.`tasa` end) AS `costo_total_dolares`, sum(`emp`.`cantidad`) AS `cantidad_total` FROM (`pagos_entrada_materia_prima` `pemp` join `detalles_entradas_materia_prima` `emp` on(`pemp`.`id_entrada` = `emp`.`id_entrada`)) GROUP BY `emp`.`id_materia_prima`) SELECT `mp`.`nombre` AS `materia_prima`, coalesce(`et`.`total_comprado`,0) AS `entradas`, coalesce(`et`.`total_comprado`,0) - `mp`.`existencia` AS `salidas`, CASE WHEN `ven`.`cantidad_total` > 0 THEN round(`ven`.`costo_total_dolares` / `ven`.`cantidad_total` * `mp`.`existencia`,2) ELSE 0 END AS `valor_stock`, `mp`.`existencia` AS `stock_actual`, `u`.`alias` AS `unidad` FROM (((`materia_prima` `mp` left join `unidades` `u` on(`mp`.`id_unidad` = `u`.`id`)) left join `entradas_totales` `et` on(`mp`.`id` = `et`.`id_materia_prima`)) left join `valor_entradas_normalizado` `ven` on(`mp`.`id` = `ven`.`id_materia_prima`)) WHERE `mp`.`active` = 11  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_inventario_productos_procesados`
--
DROP TABLE IF EXISTS `vista_inventario_productos_procesados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_inventario_productos_procesados`  AS WITH entradas_totales AS (SELECT `entradas_producto_procesado`.`id_producto` AS `id_producto`, sum(`entradas_producto_procesado`.`cantidad`) AS `total_comprado` FROM `entradas_producto_procesado` GROUP BY `entradas_producto_procesado`.`id_producto`), valor_entradas_normalizado AS (SELECT `epp`.`id_producto` AS `id_producto`, sum(case when `pepp`.`id_metodo_pago` in (1,2,12,13) then `pepp`.`precio_compra` else `pepp`.`precio_compra` / `pepp`.`tasa` end) AS `costo_total_dolares`, sum(`epp`.`cantidad`) AS `cantidad_total` FROM (`pagos_entrada_producto_procesado` `pepp` join `entradas_producto_procesado` `epp` on(`pepp`.`id_entrada` = `epp`.`id`)) GROUP BY `epp`.`id_producto`) SELECT `pp`.`nombre` AS `producto`, coalesce(`et`.`total_comprado`,0) AS `entradas`, coalesce(`et`.`total_comprado`,0) - `pp`.`existencia` AS `salidas`, CASE WHEN `ven`.`cantidad_total` > 0 THEN round(`ven`.`costo_total_dolares` / `ven`.`cantidad_total` * `pp`.`existencia`,2) ELSE 0 END AS `valor_stock`, `pp`.`existencia` AS `stock_actual` FROM ((`productos_procesados` `pp` left join `entradas_totales` `et` on(`pp`.`id` = `et`.`id_producto`)) left join `valor_entradas_normalizado` `ven` on(`pp`.`id` = `ven`.`id_producto`)) WHERE `pp`.`active` = 11  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_resumen_clientes`
--
DROP TABLE IF EXISTS `vista_resumen_clientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_resumen_clientes`  AS WITH total_gasto AS (SELECT `o`.`id_cliente` AS `id_cliente`, sum(`v`.`monto_final`) AS `total_gastado` FROM (`ventas` `v` join `orden` `o` on(`o`.`id` = `v`.`id_orden`)) WHERE `o`.`id_cliente` is not null GROUP BY `o`.`id_cliente`), ultima_orden AS (SELECT `orden`.`id_cliente` AS `id_cliente`, max(`orden`.`fecha`) AS `ultima_fecha` FROM `orden` WHERE `orden`.`id_cliente` is not null GROUP BY `orden`.`id_cliente`), productos_cliente AS (SELECT `o`.`id_cliente` AS `id_cliente`, `p`.`nombre` AS `producto`, `p`.`imagen` AS `imagen`, sum(`od`.`cantidad`) AS `total_consumido`, row_number() over ( partition by `o`.`id_cliente` order by sum(`od`.`cantidad`) desc) AS `rn` FROM ((`orden` `o` join `producto_preparado_detalle_orden` `od` on(`od`.`id_orden` = `o`.`id`)) join `productos_preparados` `p` on(`p`.`id` = `od`.`id_producto`)) WHERE `p`.`tipo` = 'producto' AND `o`.`id_cliente` is not null GROUP BY `o`.`id_cliente`, `p`.`nombre`, `p`.`imagen`), clientes_con_productos AS (SELECT DISTINCT `productos_cliente`.`id_cliente` AS `id_cliente` FROM `productos_cliente`), top_1 AS (SELECT `productos_cliente`.`id_cliente` AS `id_cliente`, `productos_cliente`.`producto` AS `producto1`, `productos_cliente`.`imagen` AS `imagen1` FROM `productos_cliente` WHERE `productos_cliente`.`rn` = 1), top_2 AS (SELECT `productos_cliente`.`id_cliente` AS `id_cliente`, `productos_cliente`.`producto` AS `producto2`, `productos_cliente`.`imagen` AS `imagen2` FROM `productos_cliente` WHERE `productos_cliente`.`rn` = 2), top_3 AS (SELECT `productos_cliente`.`id_cliente` AS `id_cliente`, `productos_cliente`.`producto` AS `producto3`, `productos_cliente`.`imagen` AS `imagen3` FROM `productos_cliente` WHERE `productos_cliente`.`rn` = 3) SELECT `c`.`nombre` AS `cliente`, `c`.`apellido` AS `apellido`, `c`.`telefono` AS `telefono`, date_format(`uo`.`ultima_fecha`,'%Y-%m-%d %H:%i:%s') AS `ultima_orden`, round(coalesce(`tg`.`total_gastado`,0),2) AS `total_gastado`, coalesce(`t1`.`producto1`,'Sin producto') AS `producto_1`, `t1`.`imagen1` AS `imagen_1`, coalesce(`t2`.`producto2`,'Sin producto') AS `producto_2`, `t2`.`imagen2` AS `imagen_2`, coalesce(`t3`.`producto3`,'Sin producto') AS `producto_3`, `t3`.`imagen3` AS `imagen_3` FROM ((((((`clientes` `c` join `clientes_con_productos` `cp` on(`c`.`id` = `cp`.`id_cliente`)) left join `total_gasto` `tg` on(`c`.`id` = `tg`.`id_cliente`)) left join `ultima_orden` `uo` on(`c`.`id` = `uo`.`id_cliente`)) left join `top_1` `t1` on(`c`.`id` = `t1`.`id_cliente`)) left join `top_2` `t2` on(`c`.`id` = `t2`.`id_cliente`)) left join `top_3` `t3` on(`c`.`id` = `t3`.`id_cliente`)) WHERE `c`.`active` = 11  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_resumen_financiero`
--
DROP TABLE IF EXISTS `vista_resumen_financiero`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_resumen_financiero`  AS SELECT round(ifnull(sum(case when `movimientos_capital`.`monto` / `movimientos_capital`.`tasa` > 0 then `movimientos_capital`.`monto` * `movimientos_capital`.`tasa` end),0),2) AS `ingresos`, round(ifnull(sum(case when `movimientos_capital`.`monto` / `movimientos_capital`.`tasa` > 0 and `movimientos_capital`.`descripcion` like '%Ingreso por venta%' then `movimientos_capital`.`monto` / `movimientos_capital`.`tasa` end),0),2) AS `ventas`, round(ifnull(sum(case when `movimientos_capital`.`monto` / `movimientos_capital`.`tasa` < 0 then `movimientos_capital`.`monto` * `movimientos_capital`.`tasa` end),0),2) AS `gastos`, round(ifnull(sum(case when `movimientos_capital`.`monto` / `movimientos_capital`.`tasa` > 0 then `movimientos_capital`.`monto` * `movimientos_capital`.`tasa` end),0) + ifnull(sum(case when `movimientos_capital`.`monto` / `movimientos_capital`.`tasa` < 0 then `movimientos_capital`.`monto` * `movimientos_capital`.`tasa` end),0),2) AS `utilidad_neta` FROM `movimientos_capital` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`id_usuario`);

--
-- Indices de la tabla `capital`
--
ALTER TABLE `capital`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias_productos`
--
ALTER TABLE `categorias_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria_materia_prima`
--
ALTER TABLE `categoria_materia_prima`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asdfg_idx` (`id_usuario_delivery`),
  ADD KEY `asdfgh_idx` (`id_venta`);

--
-- Indices de la tabla `detalles_entradas_materia_prima`
--
ALTER TABLE `detalles_entradas_materia_prima`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_materia_prima_idx` (`id_materia_prima`),
  ADD KEY `id_entrada_materia_prima_1_idx` (`id_entrada`);

--
-- Indices de la tabla `detalles_receta`
--
ALTER TABLE `detalles_receta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Id_receta` (`id_receta`,`id_materia_prima`),
  ADD KEY `Id_materia_prima_ibfk_1` (`id_materia_prima`);

--
-- Indices de la tabla `entradas_materia_prima`
--
ALTER TABLE `entradas_materia_prima`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_provedor` (`id_proveedor`);

--
-- Indices de la tabla `entradas_producto_procesado`
--
ALTER TABLE `entradas_producto_procesado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rov_idx` (`id_proveedor`),
  ADD KEY `pro_idx` (`id_producto`),
  ADD KEY `nose_fg_idx` (`id_unidad`);

--
-- Indices de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_unidad_idx` (`id_unidad`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos_capital`
--
ALTER TABLE `movimientos_capital`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Id_cliente` (`id_cliente`),
  ADD KEY `idx_cliente` (`id_cliente`),
  ADD KEY `idx_fecha` (`fecha`);

--
-- Indices de la tabla `orden_mesa`
--
ALTER TABLE `orden_mesa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pokpoj_idx` (`id_mesa`),
  ADD KEY `qwrqwripo_idx` (`id_orden`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMetodoPago` (`id_metodo_pago`);

--
-- Indices de la tabla `pagos_entrada_materia_prima`
--
ALTER TABLE `pagos_entrada_materia_prima`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_entrada_materia_prima_pago_idx` (`id_entrada`),
  ADD KEY `id_pago_materia_prima_pago_idx` (`id_metodo_pago`);

--
-- Indices de la tabla `pagos_entrada_producto_procesado`
--
ALTER TABLE `pagos_entrada_producto_procesado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_entrada_producto_procesado_idx` (`id_entrada`),
  ADD KEY `id_pago_producto_procesado_idx` (`id_metodo_pago`);

--
-- Indices de la tabla `pago_reserva`
--
ALTER TABLE `pago_reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id8_idx` (`id_reserva`),
  ADD KEY `id59_idx` (`id_pago`);

--
-- Indices de la tabla `pago_venta`
--
ALTER TABLE `pago_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id59_idx` (`id_pago`),
  ADD KEY `id80333_idx` (`id_venta`);

--
-- Indices de la tabla `paquetes_mesas`
--
ALTER TABLE `paquetes_mesas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id121426_idx` (`id_paquete`),
  ADD KEY `id134135346_idx` (`id_mesa`);

--
-- Indices de la tabla `paquetes_reservacion`
--
ALTER TABLE `paquetes_reservacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos_preparados`
--
ALTER TABLE `productos_preparados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategoria` (`id_categoria`);

--
-- Indices de la tabla `productos_procesados`
--
ALTER TABLE `productos_procesados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id20_idx` (`id_categoria`);

--
-- Indices de la tabla `producto_preparado_detalle_orden`
--
ALTER TABLE `producto_preparado_detalle_orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id11_idx` (`id_producto`),
  ADD KEY `id12_idx` (`id_orden`);

--
-- Indices de la tabla `producto_procesado_detalle_orden`
--
ALTER TABLE `producto_procesado_detalle_orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id12_idx` (`id_orden`),
  ADD KEY `id110_idx` (`id_producto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_p_idx` (`id_producto`);

--
-- Indices de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id1231446_idx` (`id_paquete`),
  ADD KEY `ioeiofjpowjf_idx` (`id_orden`),
  ADD KEY `poppuo_idx` (`id_caja`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCaja` (`id_caja`),
  ADD KEY `id-orden_idx` (`id_orden`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `capital`
--
ALTER TABLE `capital`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias_productos`
--
ALTER TABLE `categorias_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `categoria_materia_prima`
--
ALTER TABLE `categoria_materia_prima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalles_entradas_materia_prima`
--
ALTER TABLE `detalles_entradas_materia_prima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `detalles_receta`
--
ALTER TABLE `detalles_receta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `entradas_materia_prima`
--
ALTER TABLE `entradas_materia_prima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `entradas_producto_procesado`
--
ALTER TABLE `entradas_producto_procesado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `movimientos_capital`
--
ALTER TABLE `movimientos_capital`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT de la tabla `orden_mesa`
--
ALTER TABLE `orden_mesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de la tabla `pagos_entrada_materia_prima`
--
ALTER TABLE `pagos_entrada_materia_prima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `pagos_entrada_producto_procesado`
--
ALTER TABLE `pagos_entrada_producto_procesado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pago_reserva`
--
ALTER TABLE `pago_reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `pago_venta`
--
ALTER TABLE `pago_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `paquetes_mesas`
--
ALTER TABLE `paquetes_mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `paquetes_reservacion`
--
ALTER TABLE `paquetes_reservacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos_preparados`
--
ALTER TABLE `productos_preparados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `productos_procesados`
--
ALTER TABLE `productos_procesados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `producto_preparado_detalle_orden`
--
ALTER TABLE `producto_preparado_detalle_orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT de la tabla `producto_procesado_detalle_orden`
--
ALTER TABLE `producto_procesado_detalle_orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `asdfgh` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalles_entradas_materia_prima`
--
ALTER TABLE `detalles_entradas_materia_prima`
  ADD CONSTRAINT `id_entrada_materia_prima_1` FOREIGN KEY (`id_entrada`) REFERENCES `entradas_materia_prima` (`id`),
  ADD CONSTRAINT `id_materia_prima` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id`);

--
-- Filtros para la tabla `detalles_receta`
--
ALTER TABLE `detalles_receta`
  ADD CONSTRAINT `Id_materia_prima_ibfk_1` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Id_receta_prima_ibfk_2` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entradas_materia_prima`
--
ALTER TABLE `entradas_materia_prima`
  ADD CONSTRAINT `id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `entradas_producto_procesado`
--
ALTER TABLE `entradas_producto_procesado`
  ADD CONSTRAINT `nose_fg` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`),
  ADD CONSTRAINT `pro` FOREIGN KEY (`id_producto`) REFERENCES `productos_procesados` (`id`),
  ADD CONSTRAINT `rov` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`);

--
-- Filtros para la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_materia_prima` (`id`),
  ADD CONSTRAINT `id_unidad` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `orden_mesa`
--
ALTER TABLE `orden_mesa`
  ADD CONSTRAINT `pokpoj` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id`),
  ADD CONSTRAINT `qwrqwripo` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`);

--
-- Filtros para la tabla `pagos_entrada_materia_prima`
--
ALTER TABLE `pagos_entrada_materia_prima`
  ADD CONSTRAINT `id_entrada_materia_prima_pago` FOREIGN KEY (`id_entrada`) REFERENCES `entradas_materia_prima` (`id`),
  ADD CONSTRAINT `id_pago_materia_prima_pago` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`);

--
-- Filtros para la tabla `pagos_entrada_producto_procesado`
--
ALTER TABLE `pagos_entrada_producto_procesado`
  ADD CONSTRAINT `id_entrada_producto_procesado` FOREIGN KEY (`id_entrada`) REFERENCES `entradas_producto_procesado` (`id`),
  ADD CONSTRAINT `id_pago_producto_procesado` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`);

--
-- Filtros para la tabla `pago_reserva`
--
ALTER TABLE `pago_reserva`
  ADD CONSTRAINT `id59` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id8` FOREIGN KEY (`id_reserva`) REFERENCES `reservaciones` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pago_venta`
--
ALTER TABLE `pago_venta`
  ADD CONSTRAINT `id59022` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id80333` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `paquetes_mesas`
--
ALTER TABLE `paquetes_mesas`
  ADD CONSTRAINT `id121426` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes_reservacion` (`id`),
  ADD CONSTRAINT `id134135346` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id`);

--
-- Filtros para la tabla `productos_preparados`
--
ALTER TABLE `productos_preparados`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_productos` (`id`);

--
-- Filtros para la tabla `productos_procesados`
--
ALTER TABLE `productos_procesados`
  ADD CONSTRAINT `id20` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_productos` (`id`);

--
-- Filtros para la tabla `producto_preparado_detalle_orden`
--
ALTER TABLE `producto_preparado_detalle_orden`
  ADD CONSTRAINT `id11` FOREIGN KEY (`id_producto`) REFERENCES `productos_preparados` (`id`),
  ADD CONSTRAINT `id12` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`);

--
-- Filtros para la tabla `producto_procesado_detalle_orden`
--
ALTER TABLE `producto_procesado_detalle_orden`
  ADD CONSTRAINT `id110` FOREIGN KEY (`id_producto`) REFERENCES `productos_procesados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id568` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`);

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `NON0ON` FOREIGN KEY (`id_producto`) REFERENCES `productos_preparados` (`id`);

--
-- Filtros para la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD CONSTRAINT `id1231446` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes_reservacion` (`id`),
  ADD CONSTRAINT `ioeiofjpowjf` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`),
  ADD CONSTRAINT `poppuo` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `srxtrxrxr` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
