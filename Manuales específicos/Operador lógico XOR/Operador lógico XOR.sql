/*
Operador lógico XOR
 
 0 + 0 = 0
 1 + 0 = 1
 0 + 1 = 1
 1 + 1 = 0

*/

USE WORLD;
SELECT code, name, continent FROM country WHERE code LIKE 'A%' XOR code LIKE '%A' ORDER BY code;
SELECT code, name, continent FROM country WHERE continent LIKE 'A%' XOR continent LIKE '%A' ORDER BY continent;
SELECT code, name, continent FROM country WHERE name LIKE 'A%' XOR name LIKE '%A' ORDER BY name; 

