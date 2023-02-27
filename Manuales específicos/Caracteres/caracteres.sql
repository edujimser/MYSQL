-- Salto de lineas 
SELECT 'This\nIs\nFour\nLines';

-- Número positivos y negativos
SELECT +6 AS NUM_1, -7 AS NUM_2;

-- Para fechas se puede utilizar diversos caracteres delimitadores
SELECT DATE'2012-12-31', DATE'2012/12/31', DATE'2012^12^31', DATE'2012@12@31';

-- Mas ejemplos:'YYYY-MM-DD hh:mm:ss''YY-MM-DD hh:mm:ss'
SELECT CAST('2012-12-31 11:30:45' AS DATETIME), CAST('2012^12^31 11+30+45'AS DATETIME), CAST('2012/12/31 11*30*45'AS DATETIME), CAST('2012@12@31 11^30^45'AS DATETIME);
-- Sin formato, formatos aceptados YYYYMMDD o YYMMDD
SELECT DATE '20210826';

/*
Las fechas que contienen valores de año de dos dígitos son ambiguas porque se desconoce el siglo. MySQL interpreta los valores de año de dos dígitos usando estas reglas:

Los valores de año en el rango 70-99se convierten en 1970-1999.

Los valores de año en el rango 00-69se convierten en 2000-2069.

*/