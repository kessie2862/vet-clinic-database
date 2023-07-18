CREATE DATABASE vet_clinic;

CREATE TABLE IF NOT EXISTS animals(
id SERIAL NOT NULL PRIMARY KEY,
name VARCHAR(100),
date_of_birth DATE,
escape_attempts INT,
neutered BOOLEAN,
weight_kg DECIMAL(8,2));
