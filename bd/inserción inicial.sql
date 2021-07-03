insert
	into
	gestion.roles (idrol,
	descrol,
	nivelrol)
values(1,
'Administrador',
1);

insert
	into
	gestion.roles (idrol,
	descrol,
	nivelrol)
values(2,
'Jefe proyecto',
2);

insert
	into
	gestion.roles (idrol,
	descrol,
	nivelrol)
values(3,
'Programador',
3);

insert
	into
	gestion.permisos (idpermiso,
	nombrepermiso,
	codigonombre,
	idcodigo)
values(1,
'Administrador',
'admin',
1);

insert
	into
	gestion.permisos (idpermiso,
	nombrepermiso,
	codigonombre,
	idcodigo)
values(2,
'Crear proyecto',
'create_project',
2);

insert
	into
	gestion.permisos (idpermiso,
	nombrepermiso,
	codigonombre,
	idcodigo)
values(3,
'Crear bloque',
'create_block',
3);

insert
	into
	gestion.permisos (idpermiso,
	nombrepermiso,
	codigonombre,
	idcodigo)
values(4,
'Crear tarea',
'create_task',
4);

insert
	into
	gestion.permisos (idpermiso,
	nombrepermiso,
	codigonombre,
	idcodigo)
values(5,
'Actualizar proyecto',
'update_project',
5);

insert
	into
	gestion.permisos (idpermiso,
	nombrepermiso,
	codigonombre,
	idcodigo)
values(6,
'Actualizar bloque',
'update_block',
6);

insert
	into
	gestion.permisos (idpermiso,
	nombrepermiso,
	codigonombre,
	idcodigo)
values(7,
'Actualizar tarea',
'update_task',
7);

insert
	into
	gestion.permisos (idpermiso,
	nombrepermiso,
	codigonombre,
	idcodigo)
values(8,
'Eliminar proyecto',
'delete_project',
8);

insert
	into
	gestion.permisos (idpermiso,
	nombrepermiso,
	codigonombre,
	idcodigo)
values(9,
'Eliminar bloque',
'delete_block',
9);

insert
	into
	gestion.permisos (idpermiso,
	nombrepermiso,
	codigonombre,
	idcodigo)
values(10,
'Eliminar tarea',
'delete_task',
10);

insert
	into
	gestion.permisos (idpermiso,
	nombrepermiso,
	codigonombre,
	idcodigo)
values(11,
'Registrar horas',
'register_hours',
11);

insert
	into
	gestion.permisos_roles (id,
	permisos_idpermiso,
	roles_idrol)
values(1,
1,
1);

insert
	into
	gestion.permisos_roles (id,
	permisos_idpermiso,
	roles_idrol)
values(2,
2,
2);

insert
	into
	gestion.permisos_roles (id,
	permisos_idpermiso,
	roles_idrol)
values(3,
3,
2);

insert
	into
	gestion.permisos_roles (id,
	permisos_idpermiso,
	roles_idrol)
values(4,
4,
2);

insert
	into
	gestion.permisos_roles (id,
	permisos_idpermiso,
	roles_idrol)
values(5,
5,
2);

insert
	into
	gestion.permisos_roles (id,
	permisos_idpermiso,
	roles_idrol)
values(6,
6,
2);

insert
	into
	gestion.permisos_roles (id,
	permisos_idpermiso,
	roles_idrol)
values(7,
7,
2);

insert
	into
	gestion.permisos_roles (id,
	permisos_idpermiso,
	roles_idrol)
values(8,
8,
2);

insert
	into
	gestion.permisos_roles (id,
	permisos_idpermiso,
	roles_idrol)
values(9,
9,
2);

insert
	into
	gestion.permisos_roles (id,
	permisos_idpermiso,
	roles_idrol)
values(10,
10,
2);

insert
	into
	gestion.permisos_roles (id,
	permisos_idpermiso,
	roles_idrol)
values(11,
11,
3);

insert
	into
	gestion.permisos_roles (id,
	permisos_idpermiso,
	roles_idrol)
values(12,
4,
3);
-- ESTADOS
 insert
	into
	gestion.estados (descestado)
values ('Sin asignación');

insert
	into
	gestion.estados (descestado)
values ('Asignada');

insert
	into
	gestion.estados (descestado)
values ('En progreso');

insert
	into
	gestion.estados (descestado)
values ('Realizada');

insert
	into
	gestion.estados (descestado)
values ('Pruebas');

insert
	into
	gestion.estados (descestado)
values ('Cerrada');
-- PRIORIDADES
 insert
	into
	gestion.prioridades (descprioridad ,
	nivelprioridad)
values ('Ninguna',
0);

insert
	into
	gestion.prioridades (descprioridad,
	nivelprioridad)
values ('Muy baja',
1);

insert
	into
	gestion.prioridades (descprioridad,
	nivelprioridad)
values ('Baja',
2);

insert
	into
	gestion.prioridades (descprioridad,
	nivelprioridad)
values ('Media',
3);

insert
	into
	gestion.prioridades (descprioridad,
	nivelprioridad)
values ('Alta',
4);

insert
	into
	gestion.prioridades (descprioridad,
	nivelprioridad)
values ('Muy alta',
5);

--ALTER SEQUENCE gestion.tareas_idtarea_seq RESTART WITH 2;


--SELECT nextval('gestion.tareas_idtarea_seq');
SELECT last_value from "gestion".bloques_idbloque_seq;


