INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', date '2020-02-03', 0, true, 10.23);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', date '2018-11-15', 2, true, 8.00);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', date '2021-01-07', 1, false, 15.04);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', date '2017-05-12', 5, true, 11.00);
---------------------------------------------------------------------------------------
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, 'f', -11.00),
	('Plantmon', '2021-11-15', 2, 't', -5.70),
	('Squirtle', '1993-04-02', 3, 'f', -12.13),
	('Angemon', '2005-06-12', 1, 't', -45.00),
	('Boarmon', '2005-06-07', 7, 't', 20.40),
	('Blossom', '1998-10-13', 3, 't', 17.00),
	('Ditto', '2022-05-14', 4, 't', 22.00);

----------------------------------------------------------------------------------------

INSERT INTO owners (full_name, age) VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES
  ('Pokemon'),
  ('Digimon');

UPDATE animals
SET species_id = CASE
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
  END;

UPDATE animals
SET owner_id = CASE
    WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
    WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
  END;
-----------------------------------------------------------------------------------------------------------------------------
