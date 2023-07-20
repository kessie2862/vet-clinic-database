CREATE DATABASE vet_clinic;

CREATE TABLE IF NOT EXISTS animals(
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(8,2)
);

---------------------------------------------------------
ALTER TABLE animals ADD COLUMN species VARCHAR(60);

--------------------------------------------------------
CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  age INTEGER
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(60)
);

ALTER TABLE animals DROP COLUMN IF EXISTS species;

ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);
-----------------------------------------------------------------------------
CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets(id),
  species_id INTEGER REFERENCES species(id),
  PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
  visit_id SERIAL PRIMARY KEY,
  vet_id INTEGER REFERENCES vets(id),
  animal_id INTEGER REFERENCES animals(id),
  visit_date DATE
);
-----------------------------------------------------------------------------
