/*
1. En inicio de palabra: colum REGEXP '^dato';
	1.1 En inicio de palabra encasulado mas otros terminos: colum REGEXP '^[dato]dato';
2. En final de palabra: colum REGEXP 'dato$'; 
	2.1 En inicio de palabra encasulado mas otros terminos: colum  REGEXP 'dato[dato]$'
3. Multiples datos:
	3.1 Comando or en la expresion que contenga los siguientes datos: colum REGEXP 'dato1 | dato2 | dato3';
    3.2 Comando or en la expresion que contenga los siguientes datos: colum REGEXP '^dato1 | dato2 | dato3$'; 
    3.3 Rango de datos multiples que contenga un número de ellos: colum REGEXP '((dato1|dato2|dato3){valor_numerico})'
4. Encapsulamiento:
	4.1 Rango de letras: colum REGEXP '[a-z]dato'
5. Valor único variable: colum REGEXP 'dato?'
*/

USE world;

-- 1.En inicio de palabra: colum REGEXP '^dato';
SELECT * FROM country WHERE name REGEXP '^Sa';

-- 1.1 En inicio de palabra encasulado mas otros terminos: colum REGEXP '^[dato]';
SELECT * FROM country WHERE name REGEXP '^[aeiou]s';

-- 2. En final de palabra: colum REGEXP 'dato$'; 
SELECT * FROM country WHERE name REGEXP 'es$';

-- 	2.1 En inicio de palabra encasulado mas otros terminos: colum  REGEXP 'dato[dato]$'
SELECT * FROM country WHERE name REGEXP 'p[aeiou]$';


-- 3. Multiples datos:
	-- 3.1 Comando or en la expresion que contenga los siguientes datos: colum REGEXP 'dato1 | dato2 | dato3';
	SELECT * FROM country WHERE name REGEXP 'spa|germ';
    
    
    -- 3.2 Comando or en la expresion que contenga los siguientes datos: colum REGEXP '^dato1 | dato2 | dato3$';
	SELECT * FROM country WHERE name REGEXP '^spa|germ|ly$';

	-- 3.3 Rango de datos multiples que contenga un número de ellos: colum REGEXP '((dato1|dato2|dato3){valor_numerico})'
	SELECT * FROM country WHERE name REGEXP '((a|e|i|o|u){2})'; -- En cualquier posición
    SELECT * FROM country WHERE name REGEXP '(^(a|e|i|o|u){2})'; -- Al principio
    
    
-- 4. Encapsulamiento:
	-- 4.1 Rango de letras: colum REGEXP '[a-z]dato'
SELECT * FROM country WHERE name REGEXP '[a-z]rn';


-- 5. Valor único variable: colum REGEXP 'd?to'
SELECT * FROM country WHERE name REGEXP 'spa?n';
