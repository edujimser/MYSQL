/*
Sirve para comparar cadenas que tiene una expresion sonora parecida
	- expre1 SOUNDS LIKE expr2


*/
 -- 1 Si son paredicos
 -- 2 Si no son parecidos

SELECT 'Pepe' SOUNDS LIKE 'Pepa'; -- 1
SELECT 'Pepe' SOUNDS LIKE 'Peppa'; -- 1
SELECT 'Pepe' SOUNDS LIKE 'Peeppa'; -- 1
SELECT 'Pepe' SOUNDS LIKE 'PPeeppa'; -- 1
SELECT 'Pepe' SOUNDS LIKE 'Peppu'; -- 1
SELECT 'Pepe' SOUNDS LIKE 'Puppa'; -- 1
SELECT 'Pepe' SOUNDS LIKE 'Pipi'; -- 1

SELECT 'Juan' SOUNDS LIKE 'Juanito'; -- 0
SELECT 'Juan' SOUNDS LIKE 'Jaan'; -- 1
SELECT 'Juan' SOUNDS LIKE 'Juam'; -- 1
SELECT 'Juan' SOUNDS LIKE 'Jaam'; -- 1
SELECT 'Juan' SOUNDS LIKE 'Guam'; -- 0