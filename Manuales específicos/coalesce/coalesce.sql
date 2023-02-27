/* COALELCE: Te sustituye es valor nulo de un coluimna por el primer valor de una lista de valores*/

USE sakila;
SELECT * FROM film;

SELECT film_id, title, COALESCE(original_language_id, language_id, 'No tiene' ) FROM film;