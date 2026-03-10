-- 1 Ver todos los usuarios
SELECT * FROM Usuario;

-- 2 Ver todos los servicios
SELECT * FROM Servicio;

-- 3 Ver todos los vehículos
SELECT * FROM Vehiculo;

-- 4 Ver sucursales en Bogotá
SELECT nombre, direccion
FROM Sucursal
WHERE ciudad = 'Bogota';

-- 5 Ver operarios activos
SELECT *
FROM Operario
WHERE estado = TRUE;

-- 6 Ver reservas pendientes
SELECT *
FROM Reserva
WHERE estado = 'PENDIENTE';

-- 7 Ver pagos realizados
SELECT *
FROM Pago
WHERE estado_pago = 'PAGADO';

-- 8 Contar cuantos usuarios hay
SELECT COUNT(*) AS total_usuarios
FROM Usuario;

-- 9 Promedio de calificación de operarios
SELECT AVG(calificacion) AS promedio_calificacion
FROM Operario;

-- 10 Total de ingresos
SELECT SUM(monto) AS ingresos_totales
FROM Pago
WHERE estado_pago = 'PAGADO';

-- 11 Cantidad de reservas por estado
SELECT estado, COUNT(*) AS total
FROM Reserva
GROUP BY estado;

-- 12 Servicios con precio mayor a 30000
SELECT nombre, precio
FROM Servicio
WHERE precio > 30000;

-- 13 Usuarios que tienen vehículos (subconsulta)
SELECT nombre
FROM Usuario
WHERE id_usuario IN (
    SELECT id_usuario
    FROM Vehiculo
);

-- 14 Reservas que tienen pago registrado
SELECT id_reserva
FROM Reserva
WHERE id_reserva IN (
    SELECT id_reserva
    FROM Pago
);

-- 15 Servicios más caros que el promedio
SELECT nombre, precio
FROM Servicio
WHERE precio > (
    SELECT AVG(precio)
    FROM Servicio
);

-- 16 Mostrar reservas con nombre del cliente (INNER JOIN)
SELECT 
u.nombre AS cliente,
r.id_reserva,
r.fecha
FROM Reserva r
INNER JOIN Usuario u
ON r.id_usuario = u.id_usuario;

-- 17 Mostrar reserva y vehículo
SELECT 
u.nombre,
v.placa,
r.fecha
FROM Reserva r
JOIN Usuario u ON r.id_usuario = u.id_usuario
JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo;

-- 18 Mostrar reservas con sucursal
SELECT 
u.nombre AS cliente,
su.nombre AS sucursal,
r.fecha
FROM Reserva r
JOIN Usuario u ON r.id_usuario = u.id_usuario
JOIN Sucursal su ON r.id_sucursal = su.id_sucursal;

-- 19 Mostrar servicios de cada reserva
SELECT 
r.id_reserva,
s.nombre AS servicio,
rs.precio_unitario
FROM Reserva_Servicio rs
JOIN Servicio s ON rs.id_servicio = s.id_servicio
JOIN Reserva r ON rs.id_reserva = r.id_reserva;

-- 20 Mostrar operarios y zonas
SELECT 
o.id_operario,
z.nombre AS zona,
oz.turno
FROM Operario_Zona oz
JOIN Operario o ON oz.id_operario = o.id_operario
JOIN Zona z ON oz.id_zona = z.id_zona;

-- 21 Usuarios con o sin reservas (LEFT JOIN)
SELECT 
u.nombre,
r.id_reserva
FROM Usuario u
LEFT JOIN Reserva r
ON u.id_usuario = r.id_usuario;

-- 22 Reservas con o sin pago (RIGHT JOIN)
SELECT 
r.id_reserva,
p.estado_pago
FROM Pago p
RIGHT JOIN Reserva r
ON p.id_reserva = r.id_reserva;

-- 23 Mostrar cliente, vehículo y servicio
SELECT 
u.nombre AS cliente,
v.placa,
s.nombre AS servicio
FROM Reserva r
JOIN Usuario u ON r.id_usuario = u.id_usuario
JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
JOIN Reserva_Servicio rs ON r.id_reserva = rs.id_reserva
JOIN Servicio s ON rs.id_servicio = s.id_servicio;

-- 24 Mostrar cliente, sucursal y total pagado
SELECT 
u.nombre AS cliente,
su.nombre AS sucursal,
p.monto
FROM Pago p
JOIN Reserva r ON p.id_reserva = r.id_reserva
JOIN Usuario u ON r.id_usuario = u.id_usuario
JOIN Sucursal su ON r.id_sucursal = su.id_sucursal;

-- 25 Operarios con calificación mayor al promedio
SELECT *
FROM Operario
WHERE calificacion > (
    SELECT AVG(calificacion)
    FROM Operario
);

-- 26 Clientes que han hecho más de una reserva
SELECT id_usuario, COUNT(*) AS total_reservas
FROM Reserva
GROUP BY id_usuario
HAVING COUNT(*) > 1;

-- 27 Total de dinero generado por sucursal
SELECT 
su.nombre AS sucursal,
SUM(p.monto) AS ingresos
FROM Pago p
JOIN Reserva r ON p.id_reserva = r.id_reserva
JOIN Sucursal su ON r.id_sucursal = su.id_sucursal
GROUP BY su.nombre;

-- 28 Servicios más utilizados
SELECT 
s.nombre,
COUNT(rs.id_servicio) AS veces_usado
FROM Reserva_Servicio rs
JOIN Servicio s ON rs.id_servicio = s.id_servicio
GROUP BY s.nombre
ORDER BY veces_usado DESC;

-- 29 Mejor operario calificado
SELECT *
FROM Operario
ORDER BY calificacion DESC
LIMIT 1;

-- 30 Últimas reservas registradas
SELECT *
FROM Reserva
ORDER BY fecha DESC
LIMIT 5;