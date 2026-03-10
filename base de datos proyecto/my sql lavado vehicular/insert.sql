-- ROLES
INSERT INTO Rol VALUES
(1,'ADMIN','Administrador del sistema'),
(2,'CLIENTE','Cliente del lavado'),
(3,'OPERARIO','Empleado que lava vehículos'),
(4,'SUPERVISOR','Supervisa operarios'),
(5,'CAJERO','Gestiona pagos');

-- PERMISOS
INSERT INTO Permiso VALUES
(1,'CREAR_USUARIO','Permite crear usuarios'),
(2,'ELIMINAR_USUARIO','Permite eliminar usuarios'),
(3,'VER_RESERVAS','Permite ver reservas'),
(4,'GESTIONAR_PAGOS','Permite registrar pagos'),
(5,'GESTIONAR_SERVICIOS','Permite crear servicios');

-- USUARIOS
INSERT INTO Usuario VALUES
(1001,'Carlos Lopez','carlos@gmail.com','1234','3001111111',TRUE,CURRENT_DATE),
(1002,'Maria Perez','maria@gmail.com','1234','3002222222',TRUE,CURRENT_DATE),
(1003,'Juan Gomez','juan@gmail.com','1234','3003333333',TRUE,CURRENT_DATE),
(1004,'Laura Diaz','laura@gmail.com','1234','3004444444',TRUE,CURRENT_DATE),
(1005,'Pedro Ruiz','pedro@gmail.com','1234','3005555555',TRUE,CURRENT_DATE);

-- USUARIO ROL
INSERT INTO Usuario_Rol VALUES
(1001,1,TRUE),
(1002,2,TRUE),
(1003,3,TRUE),
(1004,2,TRUE),
(1005,3,TRUE);

-- PERMISO ROL
INSERT INTO Permiso_Rol VALUES
(1,1),
(1,2),
(1,3),
(2,3),
(3,4);

-- ZONAS
INSERT INTO Zona VALUES
(1,'Zona Norte','Bogota',TRUE),
(2,'Zona Sur','Bogota',TRUE),
(3,'Zona Centro','Bogota',TRUE),
(4,'Zona Occidente','Bogota',TRUE),
(5,'Zona Oriente','Bogota',TRUE);

-- SUCURSALES
INSERT INTO Sucursal VALUES
(1,'Sucursal Norte','Calle 100','30055555','Bogota',1),
(2,'Sucursal Sur','Av Boyaca','30066666','Bogota',2),
(3,'Sucursal Centro','Carrera 7','30077777','Bogota',3),
(4,'Sucursal Occidente','Av Cali','30088888','Bogota',4),
(5,'Sucursal Oriente','Calle 80','30099999','Bogota',5);

-- SERVICIOS
INSERT INTO Servicio VALUES
(1,'Lavado Basico','Lavado exterior',20000),
(2,'Lavado Premium','Lavado completo',40000),
(3,'Polichado','Pulido de pintura',60000),
(4,'Lavado Motor','Limpieza de motor',50000),
(5,'Desinfeccion','Desinfeccion interior',30000);

-- VEHICULOS
INSERT INTO Vehiculo VALUES
(1,1002,'ABC123','Toyota','Corolla','Carro'),
(2,1002,'XYZ999','Mazda','3','Carro'),
(3,1004,'JKL456','Chevrolet','Spark','Carro'),
(4,1004,'MNO789','Renault','Logan','Carro'),
(5,1002,'QWE111','Kia','Rio','Carro');

-- OPERARIOS
INSERT INTO Operario VALUES
(1,1003,'Lavado general',TRUE,4.5),
(2,1005,'Lavado premium',TRUE,4.7),
(3,1003,'Polichado',TRUE,4.3),
(4,1005,'Motor',TRUE,4.2),
(5,1003,'Interior',TRUE,4.6);

-- OPERARIO ZONA
INSERT INTO Operario_Zona VALUES
(1,1,'Mañana',TRUE),
(2,2,'Tarde',TRUE),
(3,3,'Mañana',TRUE),
(4,4,'Noche',TRUE),
(5,5,'Mañana',TRUE);

-- RESERVAS
INSERT INTO Reserva VALUES
(1,1002,1,1,'2026-03-10 10:00:00','PENDIENTE','Lavado urgente',20000),
(2,1004,3,2,'2026-03-10 11:00:00','CONFIRMADO','Servicio completo',40000),
(3,1002,2,3,'2026-03-11 09:30:00','COMPLETADO','Lavado rápido',20000),
(4,1004,4,4,'2026-03-11 14:00:00','PENDIENTE','Polichado',60000),
(5,1002,5,5,'2026-03-12 16:00:00','CONFIRMADO','Interior',30000);

-- RESERVA SERVICIO
INSERT INTO Reserva_Servicio VALUES
(1,1,1,20000,30),
(2,2,1,40000,60),
(3,1,1,20000,30),
(4,3,1,60000,90),
(5,5,1,30000,40);

-- ASIGNACION
INSERT INTO Asignacion VALUES
(1,1,1,'ASIGNADO','2026-03-10 09:50:00'),
(2,2,2,'ASIGNADO','2026-03-10 10:40:00'),
(3,3,3,'COMPLETADO','2026-03-11 09:00:00'),
(4,4,4,'ASIGNADO','2026-03-11 13:50:00'),
(5,5,5,'ASIGNADO','2026-03-12 15:30:00');

-- CALIFICACION
INSERT INTO Calificacion VALUES
(1,1,1002,1,5,'Excelente servicio','2026-03-10 11:00:00'),
(2,2,1004,2,4,'Muy buen trabajo','2026-03-10 12:00:00'),
(3,3,1002,3,5,'Muy rápido','2026-03-11 10:30:00'),
(4,4,1004,4,4,'Buen servicio','2026-03-11 15:30:00'),
(5,5,1002,5,5,'Perfecto','2026-03-12 17:30:00');

-- PROMOCIONES
INSERT INTO Promocion VALUES
(1,'Promo Marzo',10,NULL,'2026-03-01','2026-03-31',TRUE),
(2,'Promo Semana',15,NULL,'2026-03-05','2026-03-12',TRUE),
(3,'Promo Premium',20,NULL,'2026-03-01','2026-03-20',TRUE),
(4,'Promo Motor',10,NULL,'2026-03-10','2026-03-25',TRUE),
(5,'Promo Interior',5,NULL,'2026-03-01','2026-03-30',TRUE);

-- APLICA PROMO
INSERT INTO Aplica_Promo VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5);

-- PAGOS
INSERT INTO Pago VALUES
(1,1,18000,'NEQUI','REF123','PAGADO','2026-03-10 11:10:00'),
(2,2,34000,'EFECTIVO','REF124','PAGADO','2026-03-10 12:10:00'),
(3,3,20000,'TARJETA','REF125','PAGADO','2026-03-11 10:40:00'),
(4,4,60000,'NEQUI','REF126','PENDIENTE','2026-03-11 16:00:00'),
(5,5,28500,'EFECTIVO','REF127','PAGADO','2026-03-12 17:40:00');