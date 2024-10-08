#01
SELECT * FROM tasks WHERE user_id = 10

#02
SELECT * FROM tasks WHERE status_id IN (SELECT id FROM status WHERE name = 'in progress');

#03
UPDATE tasks SET status_id = (SELECT id FROM status WHERE name = 'completed') WHERE id = 7

#04
SELECT * FROM users WHERE id NOT IN (SELECT DISTINCT user_id FROM tasks);

#05
INSERT INTO tasks (title, description, status_id, user_id) 
VALUES ('Prepare for the Martian Invasion', 'Create a plan in case the cat decides to take over the world.', 1, 9);

#06
SELECT * FROM tasks WHERE status_id <> (SELECT id FROM status WHERE name = 'completed');

#07
DELETE FROM tasks WHERE id = 16

#08
SELECT * FROM users WHERE email LIKE '%@example.org';

#09
UPDATE users SET fullname = 'Dolores Umbridge' WHERE id = 9;

#10
SELECT status.name, COUNT(tasks.id) FROM status LEFT JOIN tasks ON status.id = tasks.status_id GROUP BY status.name;

#11
SELECT tasks.* FROM tasks
JOIN users ON tasks.user_id = users.id
WHERE users.email LIKE '%@mgc.gov.uk';

#12
SELECT * FROM tasks WHERE description IS NULL;

#13
SELECT users.*, tasks.* FROM users
JOIN tasks ON users.id = tasks.user_id
WHERE tasks.status_id = (SELECT id FROM status WHERE name = 'in progress');

#14
SELECT users.*, COUNT(tasks.id) FROM users
LEFT JOIN tasks ON users.id = tasks.user_id
GROUP BY users.id;