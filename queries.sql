-- Display people and their phone numbers.
SELECT
u.first_name, u.last_name, p.country_code, p.area_code, p.exchange_number, p.line_number
FROM
users as u JOIN phone_numbers as p ON u.id = p.user_id
ORDER BY
u.last_name, u.first_name;

-- Display people and their addresses.
SELECT
u.first_name, u.last_name, a.street_1, a.street_2, a.city, a.state, a.zip, a.country
FROM
users as u JOIN addresses as a ON u.id = a.user_id
ORDER BY
u.last_name, u.first_name;

-- Display people and their addresses ONLY if they're in California
SELECT
u.first_name, u.last_name, a.street_1, a.street_2, a.city, a.state, a.zip, a.country
FROM
users as u JOIN addresses as a ON u.id = a.user_id
WHERE
a.state = 'CA'
ORDER BY
u.last_name, u.first_name;

-- Show how many people have addresses in each state
SELECT
u.first_name, u.last_name, a.state, COUNT(a.state)
FROM
users as u JOIN addresses as a ON u.id = a.user_id
GROUP BY
u.last_name, u.first_name, a.state
ORDER BY
u.last_name, u.first_name;

-- Show the % of people that have multiple addresses
WITH
users_with_multiple_addresses AS (
	SELECT
		user_id,
		COUNT(*)
	FROM addresses
	GROUP BY user_id
	HAVING COUNT(*) > 1
)

SELECT
ROUND(((SELECT COUNT(*) FROM users_with_multiple_addresses)::numeric / COUNT(*)) * 100, 2) as "% Users with Multiple Addresses"
FROM
users;