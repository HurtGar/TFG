
-- USUARIOS
INSERT INTO gestion.usuarios
(nombre, primerapellido, segundoapellido, telefono, email, "password", fecharegistro, estado)
VALUES('Adrián', 'Hurtado', 'García', '606721980', 'adrian91hg@gmail.com', 'adrian', '2020-09-09 17:49:14', 1);

INSERT INTO gestion.usuarios
(nombre, primerapellido, segundoapellido, telefono, email, "password", fecharegistro, estado)
VALUES('Anabel', 'Ramos', 'Jiménez', '665696554', 'anabel91rj@gmail.com', 'anabel', '2020-09-09 17:50:14', 1);

-- PROYECTOS
INSERT INTO gestion.proyectos
(nombreproyecto, descproyecto, inicioproyecto, finproyecto, fechacreacion)
VALUES('Proyecto 1', 'Proyecto 1 de prueba', '2020-10-09', '2021-12-31', '2020-09-09');

INSERT INTO gestion.proyectos
(nombreproyecto, descproyecto, inicioproyecto, finproyecto, fechacreacion)
VALUES('Proyecto 2', 'Proyecto 2 de prueba', '2020-10-09', '2020-12-31', '2020-09-09');

-- BLOQUES 
INSERT INTO gestion.bloques
(nombrebloque, descbloque, iniciobloque, finbloque, fechacreacion, proyecto_idproyecto)
VALUES('Bloque 1', 'Bloque de prueba 1', '2020-09-09', '2021-01-01', '2020-09-09 17:50:14', 1);

INSERT INTO gestion.bloques
(nombrebloque, descbloque, iniciobloque, finbloque, fechacreacion, proyecto_idproyecto)
VALUES('Bloque 2', 'Bloque de prueba 2', '2020-09-09', '2021-01-01', '2020-09-09 17:50:14', 1);

INSERT INTO gestion.bloques
(nombrebloque, descbloque, iniciobloque, finbloque, fechacreacion, proyecto_idproyecto)
VALUES('Bloque 3', 'Bloque de prueba 3', '2020-09-09', '2020-09-09', '2020-09-09 17:50:14', 2);

INSERT INTO gestion.bloques
(nombrebloque, descbloque, iniciobloque, finbloque, fechacreacion, proyecto_idproyecto)
VALUES('Bloque 4', 'Bloque de prueba 4', '2020-09-09', '2020-09-09', '2020-09-09 17:50:14', 2);

-- ESTADOS
INSERT INTO gestion.estados (descestado) VALUES ('Sin asignación');
INSERT INTO gestion.estados (descestado) VALUES ('Asignada');
INSERT INTO gestion.estados (descestado) VALUES ('En progreso');
INSERT INTO gestion.estados (descestado) VALUES ('Realizada');
INSERT INTO gestion.estados (descestado) VALUES ('Pruebas');
INSERT INTO gestion.estados (descestado) VALUES ('Cerrada');

-- PRIORIDADES
INSERT INTO gestion.prioridades (descprioridad ,nivelprioridad) VALUES ('Ninguna',0);
INSERT INTO gestion.prioridades (descprioridad,nivelprioridad) VALUES ('Muy baja',1);
INSERT INTO gestion.prioridades (descprioridad,nivelprioridad) VALUES ('Baja',2);
INSERT INTO gestion.prioridades (descprioridad,nivelprioridad) VALUES ('Media',3);
INSERT INTO gestion.prioridades (descprioridad,nivelprioridad) VALUES ('Alta',4);
INSERT INTO gestion.prioridades (descprioridad,nivelprioridad) VALUES ('Muy alta',5);

-- TAREAS
INSERT INTO gestion.tareas
(nombretarea, desctarea, fechacreacion, fechainicio, fechafin, fechaactualizacion, horasestimacion, horasactuales, horasrestantes, bloques_idbloque, estados_idestado, prioridades_idprioridad, proyectos_idproyecto)
VALUES('Tarea 1', 'Prueba tarea 1', '2020-09-09', '2020-10-01', '2021-01-01', '2020-09-09 20:00:00', 34,643, 23, 1, 1, 1, 1);

INSERT INTO gestion.tareas
(nombretarea, desctarea, fechacreacion, fechainicio, fechafin, fechaactualizacion, horasestimacion, horasactuales, horasrestantes, bloques_idbloque, estados_idestado, prioridades_idprioridad, proyectos_idproyecto)
VALUES('Tarea 2', 'Prueba tarea 2', '2020-09-09', '2020-10-01', '2021-01-01', '2020-09-09 20:00:00', 34,643, 23, 1, 1, 1, 1);

INSERT INTO gestion.tareas
(nombretarea, desctarea, fechacreacion, fechainicio, fechafin, fechaactualizacion, horasestimacion, horasactuales, horasrestantes, bloques_idbloque, estados_idestado, prioridades_idprioridad, proyectos_idproyecto)
VALUES('Tarea 3', 'Prueba tarea 3', '2020-09-09', '2020-10-01', '2021-01-01', '2020-09-09 20:00:00', 34,643, 23, 2, 1, 1, 1);

INSERT INTO gestion.tareas
(nombretarea, desctarea, fechacreacion, fechainicio, fechafin, fechaactualizacion, horasestimacion, horasactuales, horasrestantes, bloques_idbloque, estados_idestado, prioridades_idprioridad, proyectos_idproyecto)
VALUES('Tarea 4', 'Prueba tarea 4', '2020-09-09', '2020-10-01', '2021-01-01', '2020-09-09 20:00:00', 34,643, 23, 3, 1, 1, 2);

INSERT INTO gestion.tareas
(nombretarea, desctarea, fechacreacion, fechainicio, fechafin, fechaactualizacion, horasestimacion, horasactuales, horasrestantes, bloques_idbloque, estados_idestado, prioridades_idprioridad, proyectos_idproyecto)
VALUES('Tarea 5', 'Prueba tarea 5', '2020-09-09', '2020-10-01', '2021-01-01', '2020-09-09 20:00:00', 34,643, 23, 4, 1, 1, 2);

-- TAREAS_USUARIOS
INSERT INTO gestion.tareas_usuario
(id, tareas_idtarea_id, usuarios_idusuario_id) VALUES(1, 1, 1);
INSERT INTO gestion.tareas_usuario
(id, tareas_idtarea_id, usuarios_idusuario_id) VALUES(2, 2, 1);
INSERT INTO gestion.tareas_usuario
(id, tareas_idtarea_id, usuarios_idusuario_id) VALUES(3, 3, 1);
INSERT INTO gestion.tareas_usuario
(id, tareas_idtarea_id, usuarios_idusuario_id) VALUES(4, 4, 2);
INSERT INTO gestion.tareas_usuario
(id, tareas_idtarea_id, usuarios_idusuario_id) VALUES(5, 5, 2);


