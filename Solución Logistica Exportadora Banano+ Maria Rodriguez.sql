CREATE SCHEMA exportacion_banano;

USE exportacion_banano;

-- tabla clientes
CREATE TABLE clientes (
		id_cliente INT NOT NULL auto_increment,
		nombre_cliente VARCHAR(20) NOT NULL,
		destino VARCHAR(20) NOT NULL,
		agencia_naviera VARCHAR(20) NOT NULL,
		id_producto INT NOT NULL,
		ref_insumos_requeridos DECIMAL(50) NOT NULL,
		id_contenedor INT(10) NOT NULL,
		cantidad_contenedores INT(100) NOT NULL,
		CONSTRAINT PK_clientes PRIMARY KEY (id_cliente)  
);


-- tabla insumos
CREATE TABLE insumos (
	id_materiales INT NOT NULL auto_increment,
	nombre_materiales VARCHAR(20) NOT NULL,
	id_cliente int NOT NULL,
	id_proveedor VARCHAR(20) NOT NULL,
	cantidades_stock DECIMAL(50) NOT NULL,
	fecha DATETIME(6)  NOT NULL,
	CONSTRAINT PK_insumos PRIMARY KEY (id_materiales),
    CONSTRAINT FK_insumos_clientes FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- tabla productos
CREATE TABLE productos (
		id_producto INT NOT NULL auto_increment,
		id_productora VARCHAR(20) NOT NULL,
		nombre_finca_productora VARCHAR(20) NOT NULL,
		certificados_exportaciones VARCHAR(20) NOT NULL,
		id_orden INT NOT NULL,
		cantidad_cajas INT NOT NULL,
		fecha_corte DATETIME(6)  NOT NULL,
		fecha_empaque DATETIME(6)  NOT NULL,
		nombre_producto VARCHAR(20) NOT NULL,
		id_contenedor INT,
        id_materiales INT,
		CONSTRAINT PK_productos PRIMARY KEY (id_producto),
        CONSTRAINT FK_productos_insumos FOREIGN KEY  (id_materiales) REFERENCES insumos (id_materiales) 
);



-- tabla agencias navieras
CREATE TABLE agencias_navieras (
		id_naviera INT NOT NULL auto_increment,
		nombre_naviera VARCHAR(20) NOT NULL,
		id_cliente int NOT NULL,
		destino VARCHAR(20) NOT NULL,
		tiempo_transito DECIMAL(10) NOT NULL,
		id_contenedor INT(10),
		CONSTRAINT PK_agencias_navieras PRIMARY KEY (id_naviera),
        CONSTRAINT FK_agencias_navieras_clientes FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) ON DELETE CASCADE
);


-- tabla orden de pedidos
CREATE TABLE orden_pedido (
id_orden INT NOT NULL auto_increment,
referencias_insumos DECIMAL (50) NOT NULL,
tiempo_transito  DECIMAL(10) NOT NULL,
fecha DATETIME(6)  NOT NULL,
destino VARCHAR(20) NOT NULL,
id_cliente int NOT NULL,
id_naviera  int NOT NULL,
id_producto int NOT NULL,
CONSTRAINT PK_orden_pedido PRIMARY KEY (id_orden),
CONSTRAINT FK_orden_clientes FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
CONSTRAINT FK_orden_navieras FOREIGN KEY (id_naviera) REFERENCES agencias_navieras (id_naviera),
CONSTRAINT FK_orden_productos FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
);

USE exportacion_banano;

-- Se realiza la respectiva insercción de datos ---


 
 -- Insercción datos clientes-- 
 
 DELIMITER $$
START TRANSACTION;
INSERT INTO clientes VALUES
		(NULL,1254,'fyffes','usa','hapag lloyd',1,3778805,4280095,300),
		(NULL,1255,'hhk','vlissingen','seatrade',2,25002,3335085,2),
		(NULL,1256,'banabest','pivdenyi','maersk',3,87502,3314307,7),
		(NULL,1257,'optifruit','rusia','hapag lloyd',4,100002,4243300,8),
		(NULL,1258,'tropical','polonia','seatrade',5,25002,2152496,2),
		(NULL,1259,'simba','francia','cma cgm',6,187502,2103866,15),
		(NULL,1260,'fratelli','italia','maersk',7,125002,3341703,10),
		(NULL,1261,'citronex','rumania','maersk',8,62502,7210415,5),
		(NULL,1262,'battaglio','italia','hapag lloyd',9,25002,7230267,2),
		(NULL,1263,'uniban','london','hapag lloyd',10,125002,2104137,10);

		 
DELIMITER $$;

COMMIT;
 
  -- Insercción datos clientes-- 
  
  DELIMITER $$
START TRANSACTION;
INSERT INTO insumos VALUES

		(NULL,140111,'sellos',1254,'T9581',4000000,'2022-12-23 00:00:00.000000'),
		(NULL,140112,'cajas carton',1254,'T9581',330000,'2022-12-23 00:00:00.000000'),
		(NULL,140113,'cintas',1254,'T9581',4000000,'2022-12-23 00:00:00.000000'),
		(NULL,140114,'daipas',1254,'T9581',800000,'2022-12-23 00:00:00.000000'),
		(NULL,140115,'hojas papel',1254,'T9581',800000,'2022-12-23 00:00:00.000000'),
		(NULL,140116,'pegante',1254,'T9581',20,'2022-12-23 00:00:00.000000'),
		(NULL,140117,'sunchos',1254,'T9581',1400000,'2022-12-23 00:00:00.000000'),
		(NULL,140118,'esquineros',1254,'D6366',700000,'2022-12-23 00:00:00.000000'),
		(NULL,140119,'estibas',1254,'D6366',300000,'2022-12-23 00:00:00.000000'),
		(NULL,140120,'estibas migros',1254,'D6366',30000,'2022-12-23 00:00:00.000000'),
		(NULL,140121,'sellos',1255,'T9581',6000,'2022-12-23 00:00:00.000000'),
		(NULL,140122,'cintas',1255,'T9581',6000,'2022-12-23 00:00:00.000000'),
		(NULL,140123,'daipas',1255,'T9581',5800,'2022-12-23 00:00:00.000000'),
		(NULL,140124,'hojas papel',1255,'T9581',5800,'2022-12-23 00:00:00.000000'),
		(NULL,140125,'pegante',1255,'T9581',5,'2022-12-23 00:00:00.000000'),
		(NULL,140126,'sunchos',1255,'T9581',9600,'2022-12-23 00:00:00.000000'),
		(NULL,140127,'esquineros',1255,'D6366',5000,'2022-12-23 00:00:00.000000'),
		(NULL,140128,'estibas',1255,'D6366',2200,'2022-12-23 00:00:00.000000'),
		(NULL,140129,'estibas migros',1255,'D6366',0,'2022-12-23 00:00:00.000000'),
		(NULL,140141,'sellos',1257,'T9581',21000,'2022-12-23 00:00:00.000000'),
		(NULL,140142,'cajas carton',1257,'T9581',8000,'2022-12-23 00:00:00.000000'),
		(NULL,140143,'cintas',1257,'T9581',21000,'2022-12-23 00:00:00.000000'),
		(NULL,140144,'daipas',1257,'T9581',7000,'2022-12-23 00:00:00.000000'),
		(NULL,140145,'hojas papel',1257,'T9581',28000,'2022-12-23 00:00:00.000000'),
		(NULL,140146,'pegante',1257,'T9581',10,'2022-12-23 00:00:00.000000'),
		(NULL,140147,'sunchos',1257,'T9581',40000,'2022-12-23 00:00:00.000000'),
		(NULL,140148,'esquineros',1257,'D6366',25000,'2022-12-23 00:00:00.000000'),
		(NULL,140149,'estibas',1257,'D6366',4000,'2022-12-23 00:00:00.000000'),
		(NULL,140150,'estibas migros',1257,'D6366',0,'2022-12-23 00:00:00.000000'),
		(NULL,140151,'sellos',1258,'T9581',6000,'2022-12-23 00:00:00.000000'),
		(NULL,140152,'cajas carton',1258,'T9581',3000,'2022-12-23 00:00:00.000000'),
		(NULL,140153,'cintas',1258,'T9581',6000,'2022-12-23 00:00:00.000000'),
		(NULL,140154,'daipas',1258,'T9581',5800,'2022-12-23 00:00:00.000000'),
		(NULL,140155,'hojas papel',1258,'T9581',5800,'2022-12-23 00:00:00.000000'),
		(NULL,140156,'pegante',1258,'T9581',5,'2022-12-23 00:00:00.000000'),
		(NULL,140157,'sunchos',1258,'T9581',9600,'2022-12-23 00:00:00.000000'),
		(NULL,140158,'esquineros',1258,'D6366',5000,'2022-12-23 00:00:00.000000'),
		(NULL,140159,'estibas',1258,'D6366',2200,'2022-12-23 00:00:00.000000'),
		(NULL,140160,'estibas migros',1258,'D6366',0,'2022-12-23 00:00:00.000000'),
		(NULL,140161,'sellos',1259,'T9581',400000,'2022-12-23 00:00:00.000000'),
		(NULL,140162,'cajas carton',1259,'T9581',30000,'2022-12-23 00:00:00.000000'),
		(NULL,140163,'cintas',1259,'T9581',400000,'2022-12-23 00:00:00.000000'),
		(NULL,140164,'daipas',1259,'T9581',30000,'2022-12-23 00:00:00.000000'),
		(NULL,140165,'hojas papel',1259,'T9581',5000,'2022-12-23 00:00:00.000000'),
		(NULL,140166,'pegante',1259,'T9581',5,'2022-12-23 00:00:00.000000'),
		(NULL,140167,'sunchos',1259,'T9581',48000,'2022-12-23 00:00:00.000000'),
		(NULL,140168,'esquineros',1259,'D6366',40000,'2022-12-23 00:00:00.000000'),
		(NULL,140169,'estibas',1259,'D6366',10000,'2022-12-23 00:00:00.000000'),
		(NULL,140170,'estibas migros',1259,'D6366',0,'2022-12-23 00:00:00.000000'),
		(NULL,140171,'sellos',1260,'T9581',21000,'2022-12-23 00:00:00.000000'),
		(NULL,140172,'cajas carton',1260,'T9581',5000,'2022-12-23 00:00:00.000000'),
		(NULL,140173,'cintas',1260,'T9581',21000,'2022-12-23 00:00:00.000000'),
		(NULL,140174,'daipas',1260,'T9581',7000,'2022-12-23 00:00:00.000000'),
		(NULL,140175,'hojas papel',1260,'T9581',28000,'2022-12-23 00:00:00.000000'),
		(NULL,140176,'pegante',1260,'T9581',10,'2022-12-23 00:00:00.000000'),
		(NULL,140177,'sunchos',1260,'T9581',40000,'2022-12-23 00:00:00.000000'),
		(NULL,140178,'esquineros',1260,'D6366',25000,'2022-12-23 00:00:00.000000'),
		(NULL,140179,'estibas',1260,'D6366',4000,'2022-12-23 00:00:00.000000'),
		(NULL,140180,'estibas migros',1260,'D6366',0,'2022-12-23 00:00:00.000000'),
		(NULL,140181,'sellos',1261,'T9581',21000,'2022-12-23 00:00:00.000000'),
		(NULL,140182,'cajas carton',1261,'T9581',5000,'2022-12-23 00:00:00.000000'),
		(NULL,140183,'cintas',1261,'T9581',21000,'2022-12-23 00:00:00.000000'),
		(NULL,140184,'daipas',1261,'T9581',7000,'2022-12-23 00:00:00.000000'),
		(NULL,140185,'hojas papel',1261,'T9581',28000,'2022-12-23 00:00:00.000000'),
		(NULL,140186,'pegante',1261,'T9581',10,'2022-12-23 00:00:00.000000'),
		(NULL,140187,'sunchos',1261,'T9581',40000,'2022-12-23 00:00:00.000000'),
		(NULL,140188,'esquineros',1261,'D6366',25000,'2022-12-23 00:00:00.000000'),
		(NULL,140189,'estibas',1261,'D6366',4000,'2022-12-23 00:00:00.000000'),
		(NULL,140190,'estibas migros',1261,'D6366',0,'2022-12-23 00:00:00.000000'),
		(NULL,140191,'sellos',1262,'T9581',6000,'2022-12-23 00:00:00.000000'),
		(NULL,140192,'cajas carton',1262,'T9581',3000,'2022-12-23 00:00:00.000000'),
		(NULL,140193,'cintas',1262,'T9581',6000,'2022-12-23 00:00:00.000000'),
		(NULL,140194,'daipas',1262,'T9581',5800,'2022-12-23 00:00:00.000000'),
		(NULL,140195,'hojas papel',1262,'T9581',5800,'2022-12-23 00:00:00.000000'),
		(NULL,140196,'pegante',1262,'T9581',5,'2022-12-23 00:00:00.000000'),
		(NULL,140197,'sunchos',1262,'T9581',9600,'2022-12-23 00:00:00.000000'),
		(NULL,140198,'esquineros',1262,'D6366',5000,'2022-12-23 00:00:00.000000'),
		(NULL,140199,'estibas',1262,'D6366',2200,'2022-12-23 00:00:00.000000'),
		(NULL,140200,'estibas migros',1262,'D6366',0,'2022-12-23 00:00:00.000000'),
		(NULL,140201,'sellos',1263,'T9581',21000,'2022-12-23 00:00:00.000000'),
		(NULL,140202,'cajas carton',1263,'T9581',5000,'2022-12-23 00:00:00.000000'),
		(NULL,140203,'cintas',1263,'T9581',21000,'2022-12-23 00:00:00.000000'),
		(NULL,140204,'daipas',1263,'T9581',7000,'2022-12-23 00:00:00.000000'),
		(NULL,140205,'hojas papel',1263,'T9581',28000,'2022-12-23 00:00:00.000000'),
		(NULL,140206,'pegante',1263,'T9581',10,'2022-12-23 00:00:00.000000'),
		(NULL,140207,'sunchos',1263,'T9581',40000,'2022-12-23 00:00:00.000000'),
		(NULL,140208,'esquineros',1263,'D6366',25000,'2022-12-23 00:00:00.000000'),
		(NULL,140209,'estibas',1263,'D6366',4000,'2022-12-23 00:00:00.000000'),
		(NULL,140210,'estibas migros',1263,'D6366',0,'2022-12-23 00:00:00.000000'),
		(NULL,1401301,'sellos',1256,'T9581',21000,'2022-12-23 00:00:00.000000'),
		(NULL,1401302,'cajas carton',1256,'T9581',7000,'2022-12-23 00:00:00.000000'),
		(NULL,1401303,'cintas',1256,'T9581',21000,'2022-12-23 00:00:00.000000'),
		(NULL,1401304,'daipas',1256,'T9581',7000,'2022-12-23 00:00:00.000000'),
		(NULL,1401305,'hojas papel',1256,'T9581',28000,'2022-12-23 00:00:00.000000'),
		(NULL,1401306,'pegante',1256,'T9581',10,'2022-12-23 00:00:00.000000'),
		(NULL,1401307,'sunchos',1256,'T9581',40000,'2022-12-23 00:00:00.000000'),
		(NULL,1401308,'esquineros',1256,'D6366',25000,'2022-12-23 00:00:00.000000'),
		(NULL,1401309,'estibas',1256,'D6366',4000,'2022-12-23 00:00:00.000000'),
		(NULL,1401310,'estibas migros',1256,'D6366',0,'2022-12-23 00:00:00.000000');

DELIMITER $$;

COMMIT;
 
 
 -- Insercción datos tabla productos -- 
 
   DELIMITER $$
START TRANSACTION;
INSERT INTO productos VALUES

		(NULL,1,'A42','mrs','cfe1254',20221013,288000,'2022-12-21 00:00:00.000000','2022-12-22 00:00:00.000000','fyffes premium',4280095,140111),
		(NULL,2,'A207','neerlandia','cfe1255',20221014,1920,'2022-12-21 00:00:00.000000','2022-12-22 00:00:00.000000','terra 18k',3335085,140112),
		(NULL,3,'A210','san antonio','cfe1256',20221015,6720,'2022-12-24 00:00:00.000000','2022-12-25 00:00:00.000000','bailla',3314307,140113),
		(NULL,4,'A315','sal alfredo','cfe1257',20221016,7680,'2022-12-24 00:00:00.000000','2022-12-25 00:00:00.000000','yummyban',4243300,140114),
		(NULL,5,'A402','eva','cfe1258',20221017,1920,'2022-12-21 00:00:00.000000','2022-12-22 00:00:00.000000','tropy bananas',2152496,140115),
		(NULL,6,'A403','enano','cfe1259',20221018,14400,'2022-12-24 00:00:00.000000','2022-12-25 00:00:00.000000','osero premium',2103866,140116),
		(NULL,7,'A406','eufemia','cfe1260',20221019,9600,'2022-12-24 00:00:00.000000','2022-12-25 00:00:00.000000','fratelli premium',3341703,140117),
		(NULL,8,'A411','saleth','cfe1261',20221020,4800,'2022-12-24 00:00:00.000000','2022-12-25 00:00:00.000000','bio billa',7210415,140118),
		(NULL,9,'T119','yunque','cfe1262',20221021,1920,'2022-12-24 00:00:00.000000','2022-12-25 00:00:00.000000','org battaglio',7230267,140119);

DELIMITER $$;

COMMIT;
 
 -- Inserción datos tabla  Agencias Navieras --
 
    DELIMITER $$
START TRANSACTION;
INSERT INTO productos VALUES

		(NULL,2215,'hapag lloyd',1254,'usa',9,4280095),
		(NULL,2216,'Seatrade_sealand',1255,'vlissingen',15,3335085),
		(NULL,2217,'maersk',1256,'pivdenyi',21,3314307),
		(NULL,2218,'cma cgm',1257,'rusia',21,4243300),
		(NULL,2219,'Cosco_Group',1257,'usa',9,4108145);

 DELIMITER $$;

COMMIT;
 
 -- Insercción datos tabla Orden de pedido -- 
 
		 (NULL,20221013,3778805,9,'2022-12-24 00:00:00.000000','usa',1254,2215,1),
		 (NULL,20221014,25002,15,'2022-12-24 00:00:00.000000','vlissingen',1255,2216,2),
		 (NULL,20221015,87502,21,'2022-12-25 00:00:00.000000','pivdenyi',1256,2217,3),
		 (NULL,20221016,100002,21,'2022-12-25 00:00:00.000000','rusia',1257,2215,4),
		 (NULL,20221017,25002,18,'2022-12-25 00:00:00.000000','polonia',1258,2216,5),
		 (NULL,20221018,187502,16,'2022-12-25 00:00:00.000000','francia',1259,2218,6),
		 (NULL,20221019,125002,15,'2022-12-25 00:00:00.000000','italia',1260,2217,7),
		 (NULL,20221020,62502,21,'2022-12-25 00:00:00.000000','rumania',1261,2217,8),
		 (NULL,20221021,25002,15,'2022-12-25 00:00:00.000000','italia',1262,2215,9);
		 
  DELIMITER $$;

COMMIT;
 

-- Vistas --

-- Se crea una vista  para la tabla agencias navieras, se mostrarán aquellos destinos con tiempo en transito > 10 dias
-- se ordena por el destino de menor tiempo en transito

CREATE OR  REPLACE  VIEW agencias_navieras_V AS
(SELECT tiempo_transito,destino
	from agencias_navieras
  where tiempo_transito > 10
  order by destino desc);
  
  select* from agencias_navieras_V;
  
  
  -- Se crea una vista  para la tabla orden de pedidos , se aquellos ID de cliente con exportación al destino de Italia
  
  
  CREATE OR  REPLACE  VIEW orden_pedidos as
  (SELECT cl.id_cliente, cl.destino
	from orden_pedido as c join  clientes as cl on ( c.id_cliente = cl.id_cliente)
    where c.destino = 'italia');
    
    select * from orden_pedidos;
    
    -- Se crea una vista, asociada con aquellos id cliente que exportan con  la naviera hapag lloyd y
    -- que exporten mas de 10 contenedores
    
    CREATE OR  REPLACE  VIEW orden_pedidos_c as
    (SELECT cl.id_cliente, cl.cantidad_contenedores, cl.agencia_naviera
	from orden_pedido as c join  clientes as cl on ( c.id_cliente = cl.id_cliente)
     where cl.agencia_naviera = 'hapag lloyd'
     and cl.cantidad_contenedores > 10);


select * from orden_pedidos_c;


-- Se crea Vista con tabla insumos , donde se muestran los clientes con exportaciones mayores a 5 contenedores y 
-- stock de diversos materiales mayores a 50000

CREATE OR  REPLACE  VIEW insumos_cli as
(SELECT i.cantidades_stock, i.nombre_materiales, cl.cantidad_contenedores, cl.nombre_cliente
from insumos as i join clientes as cl on ( i.id_cliente = cl.id_cliente)
where cl.cantidad_contenedores > 5
and i.cantidades_stock > 50000);

select * from insumos_cli;

-- Se crea vista que muestra os nombres de clientes que exportan con la Ag. Naviera Maersk, mas de 2 contenedores


CREATE OR REPLACE  VIEW clientes_agencias as
(select nombre_cliente, agencia_naviera , cantidad_contenedores
from clientes
where agencia_naviera like  '%maersk%'
and cantidad_contenedores >=2);

select * from clientes_agencias;

-- // Funciones // --

-- Creacion Funciones ---

-- la función  nos ayuda a determianr una vez ingresado el id_ cliente, el destino al cual es exportada la carga    
	DELIMITER $$
CREATE FUNCTION obtener_destino (
id_cliente_parm int
) returns VARCHAR (20)
DETERMINISTIC 
BEGIN 
	DECLARE name_destino VARCHAR (20);

SELECT
destino
INTO name_destino
FROM clientes
WHERE id_cliente = id_cliente_parm;

RETURN name_destino;
END
$$;

SELECT obtener_destino (1258) as Destino;

-- La funcion nos ayuda a  tener un aproximado de los cont a exportar/Semana/ cliente, , una vez ingresado el id_cliente.
	DELIMITER $$
CREATE FUNCTION contenedores_exportados_cliente (
id_cliente_cont int
) returns int
DETERMINISTIC 
BEGIN 
	DECLARE cont_expor int ;
   
SELECT
cantidad_contenedores
INTO cont_expor
FROM clientes
WHERE id_cliente = id_cliente_cont;

RETURN cont_expor;
END
$$;

select contenedores_exportados_cliente (1254)  As Cont_cliente_Sem;

-- La funcion nos ayuda a  tener un aproximado de los cont a exportar/ Año/ cliente.
DELIMITER $$
CREATE FUNCTION conte_export_clien (
id_cliente_cont int
) returns int
DETERMINISTIC 
BEGIN 

	DECLARE cont_expor INT; 
        
SELECT
cantidad_contenedores
INTO cont_expor
FROM clientes
WHERE id_cliente = id_cliente_cont;

RETURN cont_expor*52;
END
$$;

select conte_export_clien (1256) as Cont_est_Año_cliente;

-- Stored Procedures ---

-- Creación SP ---

-- Se crea como parametro el id_producto_order que sera el parametro bajo el cual, ordenaremos, partiendo de un condicional, en este caso es que si el Id_producto es Menor o igual a 3 entonces,
-- solo me lo ordenna la cantidad de cajas, pero si es mayor que 3, entonces me  va a ordenar la cantidad de cajas , de forma descendente.
DELIMITER $$
CREATE PROCEDURE sp_datos_productos_order ( IN id_producto_order int)
BEGIN

IF id_producto_order <=3 THEN 
	SELECT *  FROM productos
    ORDER BY cantidad_cajas;
ELSE
	SELECT *  FROM productos
    ORDER BY cantidad_cajas DESC;
END IF;

END
$$;	
-- invocamos el sp_datos_productos_order-- y observamos que si se cumple---
CALL sp_datos_productos_order(3);		
CALL sp_datos_productos_order(5);				


	
    -- Se procede a crear el SP #2
-- Se crea un procedimiento almacenado para insertar un nuevo cliente
-- sp_inserta_cliente (	id_cliente, nombre, destino, agencia naviera, id_producto, ref_insumos, id_cont, cant_cont )
    DELIMITER $$
    CREATE PROCEDURE sp_inserta_cliente (
		  IN id_cliente_parametro INT
        , IN nombre_cliente_parametro_entrada VARCHAR(20)
        , IN destino_parametro_entrada VARCHAR(20)
        , IN agencia_naviera_parametro_entrada VARCHAR(20)
        , IN id_producto_parametro_entrada INT
        , IN ref_insumos_requeridos_parametro_entrada decimal (50,0)
        , IN id_contenedor_parametro_entrada INT
        , IN cantidad_contenedores_parametro_entrada INT
    )
    BEGIN
        
        INSERT INTO clientes (
			id_cliente
            , nombre_cliente
            , destino
            , agencia_naviera
            , id_producto
            , ref_insumos_requeridos
            , id_contenedor
            , cantidad_contenedores
            
        )
        VALUES (
			  id_cliente_parametro
			, nombre_cliente_parametro_entrada
			, destino_parametro_entrada
			, agencia_naviera_parametro_entrada
			, id_producto_parametro_entrada
			, ref_insumos_requeridos_parametro_entrada
            , id_contenedor_parametro_entrada
			, cantidad_contenedores_parametro_entrada
        );

        SELECT 'cliente ingresado correctamente...';
    END
    $$;						
-- - Invocar sp con los datos a insertar
        CALL sp_inserta_cliente (
			1264
            , 'frutire'
            , 'korea'
            , 'maersk'
            , 11
            , 55600
            , 4257890
            , 30
        );				
        
         -- Revisar datos
        SELECT * FROM clientes ORDER BY id_cliente DESC;

 --- Triggers--
 
-- Creación Triggers--

-- Procedemos a crear el Trigger para la tabla clientes
-- Se crea inicialmente una nueva tabla, denominada New_clientes

CREATE TABLE NEW_CLIENTES  (
	
    id_new_cliente INT AUTO_INCREMENT PRIMARY KEY
    , id_cliente INT
    , nombre_cliente VARCHAR (20)
    , agencia_naviera VARCHAR (20)
	, cantidad_contenedores INT 
    , created_date TIMESTAMP
    );
    
-- Procedo a crear el trigger de tipo Before---

DELIMITER $$ 
CREATE TRIGGER tr_update_clientes_berofe
BEFORE UPDATE ON clientes
FOR EACH ROW 
BEGIN 
INSERT INTO NEW_CLIENTES ( id_cliente, nombre_cliente, agencia_naviera , cantidad_contenedores, created_date)
VALUES (
		NEW.id_cliente, NEW.nombre_cliente, NEW.agencia_naviera, NEW.cantidad_contenedores, current_timestamp()
        );

END
$$;

-- Se procede a realizar la respectiva actualización del cliente 'Frutiere', a Frutiere_asia --
UPDATE clientes
	SET nombre_cliente = ' frutiere_asia '
    WHERE id_cliente = 1264;
    
    --  Verifico que se haya realizado la actualización , efectivamente se  ejecuto correctamente--
     select * from exportacion_banano.clientes;
     
     -- Verifico que el trigger este funcionando en la tabla New_Clientes---
	select * from NEW_CLIENTES;
    
    -- este trigger servira de auditoria cuando en nuestra Db se este cambiando constantemente los nombres de los clientes, la cantidad decont exp, entre otros.
    
-- 2. Procedo con el Trigger de tipo After-- 
-- para ello se elimina  la tabla y el trigger 

DROP TABLE NEW_CLIENTES;
DROP TRIGGER tr_update_clientes_berofe;

-- Se procede a crear  el nuevo procedmiento para el trigger--

-- Se crea la tabla---

CREATE TABLE NEW_CLIENTES  (
	
    id_cliente INT AUTO_INCREMENT PRIMARY KEY
    , nombre_cliente VARCHAR (20)
    , agencia_naviera VARCHAR (20)
	, cantidad_contenedores INT 
    , deleated_date TIMESTAMP
    , delete_user VARCHAR (100)
    );
	
    -- se crea el trigger ---
    
    DELIMITER $$ 
CREATE TRIGGER tr_delete_clientes_after
AFTER DELETE ON clientes
FOR EACH ROW 
BEGIN 
INSERT INTO NEW_CLIENTES ( id_cliente, nombre_cliente, agencia_naviera , cantidad_contenedores, deleated_date, delete_user)
VALUES (
		OLD.id_cliente, OLD.nombre_cliente, OLD.agencia_naviera, OLD.cantidad_contenedores, current_timestamp(), USER()
        );
END
$$;

-- Verifico un registro puntual de mi tabla---
SELECT * FROM clientes WHERE id_cliente = 1264;

-- Se elimina el registro ---
DELETE FROM clientes WHERE id_cliente = 1264;

-- Se verifica la funcionalidad del trigger -- efectivamente funciona---

SELECT * FROM NEW_CLIENTES;



-- 2.-- aplicamos lo mismo para tabla de agencias_navieras ---

-- Creamos nueva tabla ---- 

CREATE TABLE NEW_AGENCY	  (
	
    id_new_naviera INT AUTO_INCREMENT PRIMARY KEY
    , id_naviera INT
    , nombre_naviera VARCHAR (20)
    , id_cliente INT 
	, destino VARCHAR (20)
    , created_date TIMESTAMP
    );
    
    -- Procedo a crear el trigger de tipo Before---

DELIMITER $$ 
CREATE TRIGGER tr_update_agencias_navieras_berofe
BEFORE UPDATE ON agencias_navieras
FOR EACH ROW 
BEGIN 
INSERT INTO NEW_AGENCY ( id_naviera, nombre_naviera, id_cliente , destino, created_date)
VALUES (
		NEW.id_naviera, NEW.nombre_naviera, NEW.id_cliente, NEW.destino, current_timestamp()
        );

END
$$;		
     -- Se procede a realizar la respectiva actualización del cliente 'Seatrade', a Seatrade_sealand --
UPDATE agencias_navieras
	SET nombre_naviera = 'Seatrade_sealand'
    WHERE id_naviera = 2216;
    
    
    
 -- verifico actualización-- ejecutada exitosmente
 
   select * from exportacion_banano.agencias_navieras;
   
   
   -- verifico  funcionaliadad trigger --
   select * from NEW_AGENCY;
				
-- 2. Procedo con el Trigger de tipo After-- 
-- para ello se elimina  la tabla y el trigger 

DROP TABLE NEW_AGENCY;
DROP TRIGGER tr_update_agencias_navieras_berofe;							
							
-- Se procede a crear  el nuevo procedmiento para el trigger--
-- Se crea la tabla---	 	


-- Creamos nueva tabla ---- 

   CREATE TABLE NEW_AGENCY	(

    id_naviera INT AUTO_INCREMENT PRIMARY KEY
    , nombre_naviera VARCHAR (20)
    , id_cliente INT 
	, destino VARCHAR (20)
     , deleated_date TIMESTAMP
    , delete_user VARCHAR (100)
    );
    
    
    -- Creamos el nuevo trigger tippo after--
    
      DELIMITER $$ 
CREATE TRIGGER tr_delete_agencia_naviera_after
AFTER DELETE ON agencias_navieras
FOR EACH ROW 
BEGIN 
INSERT INTO NEW_AGENCY ( id_naviera, nombre_naviera, id_cliente , destino, deleated_date, delete_user)
VALUES (
		OLD.id_naviera, OLD.nombre_naviera, OLD.id_cliente, OLD.destino, current_timestamp(), USER()
        );
END
$$;	
-- Verifico un registro puntual de mi tabla---
SELECT * FROM agencias_navieras WHERE id_naviera = 2215;

-- Se elimina el registro ---
DELETE FROM agencias_navieras WHERE id_naviera = 2215;

-- Se verifica la funcionalidad del trigger -- efectivamente funciona---

SELECT * FROM NEW_AGENCY;

-- Se procede a usar la Database--
USE exportacion_banano;
-- 1. Se crea el usuario " Asistente Documental", el cual solo tendra acceso de lectura a las tablas de la DB--
-- Usuario "Asistente_Documenal"--

CREATE USER 'Asistente_Documenal' IDENTIFIED BY '1254';

-- se le crea el permiso de lectura para cada una de las tablas de la DB  exportacion_banano;

-- Solo Lectura  tabla Clientes--
GRANT SELECT ON exportacion_banano.clientes TO 'Asistente_Documenal';
-- Solo Lectura  tabla Agencias_navieras--
GRANT SELECT ON exportacion_banano.agencias_navieras TO 'Asistente_Documenal';
-- Solo Lectura  tabla insumos--
GRANT SELECT ON exportacion_banano.insumos TO 'Asistente_Documenal';
-- Solo Lectura  tabla orden_pedido--
GRANT SELECT ON exportacion_banano.orden_pedido TO 'Asistente_Documenal';
-- Solo Lectura  tabla orden_productos--
GRANT SELECT ON exportacion_banano.productos TO 'Asistente_Documenal';

-- Se verifica los permisos que tienen en gral este usuario-- Efectivamente solo permite la lectura de las tablas--
SHOW GRANTS FOR 'Asistente_Documenal';


-- 2. Creación Usuario con permisos de lectura, insercción y modificación ---

-- 1. Se crea el usuario " Asistente Documental", el cual solo tendra acceso de lectura a las tablas de la DB--
-- Usuario "Gerencia_ Export"--

CREATE USER  'Gerencia_ Export' IDENTIFIED BY  'Exp2023';

-- El Usuario , quien es la gerente podra hacer modificaciones, actualizaciones e insercciones de nuevos id_ cliente y nombre de cliente, lo cual es muy comun en la exportacion
GRANT SELECT , UPDATE , INSERT (id_cliente,nombre_cliente) ON exportacion_banano.clientes TO  'Gerencia_ Export';

-- El Usuario , quien es la gerente podra hacer modificaciones, actualizaciones e insercciones de nuevos id_orden y id_producto,
-- teniendo en cuenta q las ordenes de pedido estan sujetas a cambios constantemente.
GRANT SELECT , UPDATE , INSERT (id_orden ,id_cliente, id_producto) ON exportacion_banano.orden_pedido TO  'Gerencia_ Export';

-- El Usuario , quien es la gerente podra hacer modificaciones, actualizaciones e insercciones de nuevos  id_producto, nombre de producto, cantidad de cajas
-- teniendo en cuenta q las las referencias de productos, o nombres de los mismos pueden variar cada cierto tiempo, o en su defecto desaparecer.
-- a su vez se podra modificar , insertar o modificar la cantidad de cajas asociada al tipo de producto --
GRANT SELECT , UPDATE , INSERT (id_producto,nombre_producto, id_productora, cantidad_cajas ) ON exportacion_banano.productos TO  'Gerencia_ Export';

-- Se verifica los permisos que tienen en gral este usuario-- Efectivamente tiene los permisos anteriormente comentados-
SHOW GRANTS FOR  'Gerencia_ Export';
-- Se procede hacer uso de la DB Exportación_banano--
USE exportacion_banano;
-- Se realiza la desactivación del autocommit--
		SELECT @@AUTOCOMMIT;
		SET  @@AUTOCOMMIT=0;

 -- 1. En la primera tabla eliminar algunos registros iniciando una transacción, sino tiene insertarlos --
 
 -- valido mi tabla a usar para este punto es  orden_pedido --
 
 	select * from exportacion_banano.orden_pedido;

-- Se procede a eliminar registros de la tabla ---

START TRANSACTION;
-- Se elimina  el registro de la tabla,  el producto con id_producto = 9 --
DELETE FROM 
orden_pedido
WHERE 
id_producto = 9;

-- Se elimina  el registro de la tabla,  los destinon que van hacia usa --
DELETE FROM 
orden_pedido
WHERE 
destino = 'usa';

-- ROLLBACK--
-- COMMIT--

-- 2. Tabla # 2- tabla de clientes -- se procede a la insercción de los 8 registros --

  select * from exportacion_banano.clientes;

-- se inicia la transacción --
START TRANSACTION;
-- se insertan  los 8 registros, se agrega un savepoint a porteriori del Reg # 4 y un savepoint a porteriori del Reg # 8 

INSERT INTO clientes  VALUES ( 1264,'frutiere', 'francia', 'cosco_gropp', 11, 502530, 3331880, 3 );
INSERT INTO clientes  VALUES ( 1265,'delmonte', 'egypto', 'pil', 12, 342025, 4205208, 15 );
INSERT INTO clientes  VALUES ( 1266,'chiquita', 'francia', 'o_n_e', 13, 125870, 2107805, 8 );
INSERT INTO clientes  VALUES ( 1267,'dolefruit', 'korea', 'yang_ming_pacific', 14, 290456, 3358749, 20 );
SAVEPOINT cliente_1;
INSERT INTO clientes  VALUES ( 1268,'fresfruit', 'belgica', 'maersk', 15, 396999, 3331520, 20 );
INSERT INTO clientes  VALUES ( 1269,'fruitsilver', 'portsmouth', 'hapag lloyd', 16, 1130999, 9583657, 50 );
INSERT INTO clientes  VALUES ( 1270,'ci_bananitas', 'london', 'cma cgm ', 17, 25369, 4237891, 35 );
INSERT INTO clientes  VALUES ( 1271,'tisco', 'francia', 'seatrade', 18, 785015, 9065872, 3 );
SAVEPOINT cliente_2;

-- se deja comentado la eliminación del primer savepoint-- (4 primeros registros)
-- rollback  to cliente_1;
-- COMMIT--


-- Gracias--