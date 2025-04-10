SELECT EMP_ID, EMP_SALARIO, 12 * (EMP_SALARIO+100000)
FROM EMPLEADOS;

SELECT EMP_NOMBRE, EMP_SALARIO, EMP_COMISION
FROM EMPLEADOS;

SELECT EMP_NOMBRE, EMP_SALARIO, EMP_COMISION, EMP_SALARIO + EMP_COMISION
FROM EMPLEADOS;

SELECT EMP_NOMBRE, EMP_SALARIO, EMP_COMISION, EMP_SALARIO + EMP_COMISION SALARIO_ANUAL
FROM EMPLEADOS;

SELECT EMP_NOMBRE, EMP_SALARIO, EMP_COMISION, EMP_SALARIO + EMP_COMISION "SALARIO_ANUAL"
FROM EMPLEADOS;

SELECT EMP_NOMBRE, EMP_SALARIO, EMP_COMISION, EMP_SALARIO + EMP_COMISION AS SALARIO_ANUAL
FROM EMPLEADOS;

SELECT EMP_NOMBRE || ' ES UN '|| EMP_CARGO AS EMPLEADOS_Y_CARGOS
FROM EMPLEADOS;

SELECT DISTINCT DEP_ID
FROM EMPLEADOS;

SELECT * 
FROM EMPLEADOS
WHERE DEP_ID = 10;

SELECT * 
FROM EMPLEADOS
WHERE EMP_CARGO = 'OFICINISTA';

SELECT EMP_NOMBRE || ' FUE CONTRATADO EN ' || EMP_FECHACONTRATO AS FECHA_CONTRATACION
FROM EMPLEADOS
WHERE EMP_FECHACONTRATO > '31/12/2001';

SELECT *
FROM EMPLEADOS
WHERE EMP_SALARIO BETWEEN 1550000 AND 2000000;

SELECT EMP_NOMBRE || ' ' || EMP_CARGO
FROM EMPLEADOS
WHERE EMP_CARGO IN ('PRESIDENTE', 'ANALISTA');

SELECT EMP_ID, EMP_NOMBRE, EMP_CARGO
FROM EMPLEADOS
WHERE EMP_NOMBRE LIKE 'J%';

SELECT EMP_ID, EMP_NOMBRE, EMP_CARGO
FROM EMPLEADOS
WHERE EMP_NOMBRE LIKE '_O%';

SELECT EMP_NOMBRE
FROM EMPLEADOS
WHERE EMP_NOMBRE LIKE '__R%';

SELECT EMP_ID, EMP_NOMBRE, EMP_SALARIO
FROM EMPLEADOS
WHERE EMP_NOMBRE LIKE '%N%' AND EMP_SALARIO > 1200000;

SELECT *
FROM EMPLEADOS
WHERE LENGTH(EMP_NOMBRE)>7 AND EMP_SALARIO BETWEEN 2000000 AND 3100000;

