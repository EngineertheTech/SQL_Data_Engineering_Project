-- .read 'Lessons/1.21/1.21_DDL_DML_PT1.sql'

USE data_jobs;

DROP DATABASE IF EXISTS jobs_mart;

CREATE DATABASE IF NOT EXISTS jobs_mart;

SHOW DATABASES;

SELECT *
FROM information_schema.schemata;

USE jobs_mart;

CREATE SCHEMA IF NOT EXISTS staging;

/*DROP SCHEMA IF EXISTS staging;*/

CREATE TABLE IF NOT EXISTS staging.prefered_roles (
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR
);

SELECT *
FROM information_schema.tables
WHERE table_catalog = 'jobs_mart';

INSERT INTO staging.prefered_roles (role_id, role_name)
VALUES
    (1, 'Data Engineer'),
    (2, 'Senior Data Engineer'),
    (3, 'Software Engineer');

SELECT *
FROM staging.prefered_roles;

ALTER TABLE staging.prefered_roles
ADD COLUMN prefered_role BOOLEAN;

UPDATE staging.prefered_roles
SET prefered_role = TRUE
WHERE role_id = 1 or role_id = 2;

UPDATE staging.prefered_roles
SET prefered_role = FALSE
WHERE role_id = 3;

SELECT *
FROM staging.priority_roles;

ALTER TABLE staging.prefered_roles
RENAME TO priority_roles;

ALTER TABLE staging.priority_roles
RENAME COLUMN prefered_role TO priority_lvl;

ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INTEGER;

UPDATE staging.priority_roles
SET priority_lvl = 3
WHERE role_id = 3;

SELECT *
FROM staging.priority_roles;