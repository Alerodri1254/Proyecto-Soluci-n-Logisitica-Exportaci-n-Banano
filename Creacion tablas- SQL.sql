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
        CONSTRAINT FK_agencias_navieras_clientes FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
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







