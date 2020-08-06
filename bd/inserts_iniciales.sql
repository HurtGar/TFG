
-- Insertar estdos por defecto
 insert
	into
	gestion.estados (descestado)
values('Sin asignación');

insert
	into
	gestion.estados (descestado)
values('Asignada');

insert
	into
	gestion.estados (descestado)
values('En progreso');

insert
	into
	gestion.estados (descestado)
values('Realizada');

insert
	into
	gestion.estados (descestado)
values('Pruebas');

insert
	into
	gestion.estados (descestado)
values('Cerrada');


-- Insertar prioridades por defecto
 insert
	into
	gestion.prioridades (descprioridad, nivelprioridad)
values('Ninguna', 0);

insert
	into
	gestion.prioridades (descprioridad, nivelprioridad)
values('Muy baja', 1);

insert
	into
	gestion.prioridades (descprioridad, nivelprioridad)
values('Baja', 2);

insert
	into
	gestion.prioridades (descprioridad, nivelprioridad)
values('Media-baja', 3);

insert
	into
	gestion.prioridades (descprioridad, nivelprioridad)
values('Media', 4);

insert
	into
	gestion.prioridades (descprioridad, nivelprioridad)
values('Media-alta', 5);

insert
	into
	gestion.prioridades (descprioridad, nivelprioridad)
values('Alta', 6);

insert
	into
	gestion.prioridades (descprioridad, nivelprioridad)
values('Muy alta', 7);


-- Insertar roles por defecto
INSERT
	INTO
	gestion.roles (descrol, nivelrol)
VALUES('Gerente', 0);

INSERT
	INTO
	gestion.roles (descrol, nivelrol)
VALUES('Jefe de proyecto', 1);

INSERT
	INTO
	gestion.roles (descrol, nivelrol)
VALUES('Analista', 2);

INSERT
	INTO
	gestion.roles (descrol, nivelrol)
VALUES('Tester', 3);

INSERT
	INTO
	gestion.roles (descrol, nivelrol)
VALUES('Calidad', 4);

INSERT
	INTO
	gestion.roles (descrol, nivelrol)
VALUES('Coordinador', 5);

INSERT
	INTO
	gestion.roles (descrol, nivelrol)
VALUES('Desarrollador', 6);

INSERT
	INTO
	gestion.roles (descrol, nivelrol)
VALUES('Maquetador', 7);
