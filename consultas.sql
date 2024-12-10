DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;

CREATE TABLE departamento (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE UNSIGNED NOT NULL,
  gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  id_departamento INT UNSIGNED,
  FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);


select nombre, apellido1, apellido2 from empleado;
select distinct apellido1 from empleado;
select * from empleado;
select id_departamento from empleado;
select distinct id_departamento from empleado;
select * from empleado where apellido2 in ('Díaz', 'Moreno');
select concat(nombre,' ',apellido1,' ',apellido2) as 'Nombre Completo' from empleado;
select lower (concat(nombre,' ',apellido1,' ',apellido2)) as 'Nombre Minus' from alumno;
SELECT concat(id,' ', substr(nif, 1, 8)) AS nif_digitos, substr(nif, 9, 1) AS nif_letra FROM empleado;
select nombre, presupuesto-gastos as 'Presupuesto actual' from departamento order by 'Presupuesto actual' asc;
select nombre from departamento order by nombre desc;
select nombre, presupuesto from departamento order by presupuesto desc limit 3;
select nombre, presupuesto from departamento order by presupuesto asc limit 3;
select nombre, gastos from departamento order by gastos desc limit 2;
select nombre, gastos from departamento order by gastos asc limit 2;

select nombre, presupuesto from departamento where presupuesto>=150000;
select nombre, presupuesto from departamento where presupuesto>=100000 and presupuesto<=200000;
select nombre, presupuesto from departamento where presupuesto<=100000 or presupuesto>=200000;
select nombre, presupuesto, gastos from departamento where presupuesto<gastos;
select nombre, presupuesto, gastos from departamento where presupuesto>gastos;
select nombre, presupuesto, gastos from departamento where presupuesto=gastos;
select * from empleado where apellido2 is null;
select * from empleado where apellido2 is not null;
select * from empleado where apellido2='López';
select * from empleado where apellido2='Díaz' or apellido2='Moreno';
select nombre, apellido1, apellido2 from empleado where apellido2 in ('Díaz','Moreno');
select nombre, apellido1, apellido2, nif from empleado where id_departamento=3;
select nombre, apellido1, apellido2, nif from empleado where id_departamento in ('2','4','5');
SELECT MAX(presupuesto) AS max_presupuesto
FROM departamento;
SELECT nombre, presupuesto
FROM departamento
ORDER BY presupuesto DESC
LIMIT 1;
SELECT COUNT(*) AS total_empleados
FROM empleado;
SELECT COUNT(*)
FROM empleado
WHERE apellido2 IS NOT NULL;