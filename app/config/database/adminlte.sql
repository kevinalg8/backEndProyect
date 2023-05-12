-- Procedimiento almacenados
BEGIN

SELECT categoria.COD_CATE, categoria.descripcion, producto.nombre, producto.COD_PROD
FROM categoria 
INNER JOIN producto
ON categoria.COD_CATE AND producto.COD_PROD;

END
-- Crear Productos
BEGIN
    INSERT INTO categoria (estado, descripcion)
    VALUES (_ESTADO,_DESCRIPCION);

    INSERT INTO producto (nombre, precio ,cantidad, foto)
    VALUES ( _NOMBRE, _CANTIDAD, _PRECIO, _FOTO);
END
-- Otra cosa por si las rutinas no se exportan
DROP PROCEDURE `spVerProductos`; CREATE DEFINER=`root`@`localhost` PROCEDURE `spVerProductos`() NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER BEGIN SELECT categoria.COD_CATE, categoria.descripcion, producto.nombre, producto.COD_PROD FROM categoria INNER JOIN producto ON categoria.COD_CATE AND producto.COD_PROD; END 
--Crear Productos
DROP PROCEDURE `spCrearProducto`; CREATE DEFINER=`root`@`localhost` PROCEDURE `spCrearProducto`(IN `_ESTADO` TINYINT(1), IN `_NOMBRE` VARCHAR(200), IN `_CANTIDAD` INT(10), IN `_PRECIO` DECIMAL(10,2), IN `_FOTO` BLOB, IN `_DESCRIPCION` VARCHAR(100)) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER BEGIN INSERT INTO categoria (estado, descripcion) VALUES (_ESTADO,_DESCRIPCION); INSERT INTO producto (nombre, precio ,cantidad, foto) VALUES ( _NOMBRE, _CANTIDAD, _PRECIO, _FOTO); END 


CALL `spVerProductos`(); 

