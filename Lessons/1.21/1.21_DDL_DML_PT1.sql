CREATE DATABASE IF NOT EXISTS jobs_mart;

SHOW DATABASES;

/*DROP DATABASE IF EXISTS jobs_mart;*/

SELECT *
FROM information_schema.schemata;

USE jobs_mart;

CREATE SCHEMA IF NOT EXISTS staging;

/*DROP SCHEMA IF EXISTS staging;*/

CREATE TABLE IF NOT EXISTS staging.prefered_roles (
    role_id INTEGER,
    role_name VARCHAR
);

SELECT *
FROM information_schema.tables
WHERE table_catalog = 'jobs_mart';

DROP TABLE IF EXISTS main.prefered_roles;

-- .read 'Lessons/1.21/1.21_DDL_DML_PT1.sql'