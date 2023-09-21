/*Show the top 3 actors who have appeared in the most films.*/
select actor.actor_id, actor.first_name, actor.last_name, count(film_id) as film_count
from actor
join film_actor on actor.actor_id = film_actor.actor_id
group by actor.actor_id, actor.first_name, actor.last_name
order by film_count desc
limit 3;

/*Show the top 3 country that have the most stores.*/
select country.country, count(store_id) from country
join city on country.country_id = city.country_id
join address on city.city_id = address.city_id
join store on address.address_id = store.address_id
group by country.country
order by count(store_id) desc
limit 3;

/*Show the actor who has appeared in the film with the highest rental rate.*/
select actor.actor_id, actor.first_name, actor.last_name, film.rental_rate
from actor
inner join film_actor on actor.actor_id = film_actor.actor_id
inner join film on film_actor.film_id = film.film_id
group by actor.actor_id, actor.first_name, actor.last_name, film.rental_rate
order by film.rental_rate desc;

/*Show the store address and country that has the most inventory of the film "ACADEMY DINOSAUR."*/
select address.address, address.address2, country, count(inventory_id)
from country
inner join city on country.country_id = city.country_id
inner join address on city.city_id = address.city_id
inner join store on address.address_id = store.address_id
inner join inventory on store.store_id = inventory.store_id
inner join film on inventory.film_id =  film.film_id
where film.title = 'ACADEMY DINOSAUR'
group by address.address, address.address2, country
order by count(inventory_id) desc;

/* Show the most recent rental film titled "BOUND CHEAPER." */
select return_date from rental
inner join inventory on rental.inventory_id = inventory.inventory_id
inner join film on inventory.film_id = film.film_id
where film.title = 'BOUND CHEAPER'
order by rental.return_date desc;

/* Show the film with the highest number of rental rate based on category. */
select category.name, film.rental_rate, film.title from category
inner join film_category on category.category_id = film_category.category_id
inner join film on film_category.film_id = film.film_id
order by film.rental_rate desc
limit 5;

/* Show the film with the lowest number of viewers based on category. */
select category.name, film.rental_rate, film.title from category
inner join film_category on category.category_id = film_category.category_id
inner join film on film_category.film_id = film.film_id
order by film.rental_rate asc
limit 5;