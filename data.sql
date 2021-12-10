/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutured, weight_kg) VALUES (1, 'Agumon','feb/3/2020',0,true,10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutured, weight_kg) VALUES (2, 'Gabumon','nov/15/2018',2,true,8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutured, weight_kg) VALUES (3, 'Pikachu','jan/7/2021',1,false,15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutured, weight_kg) VALUES (4, 'Devimon','may/12/2017',5,true,11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutured, weight_kg) VALUES (5, 'Charmander','feb/18/2020',5,false,11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutured, weight_kg) VALUES (6, 'Plantmon','nov/15/2022',2,true,5.7);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutured, weight_kg) VALUES (7, 'Squirtle','apr/2/1993',3,false,12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutured, weight_kg) VALUES (8, 'Angemon','jun/12/2005',1,true,45);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutured, weight_kg) VALUES (9, 'Boarmon','jun/7/2005',7,true,20.4);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutured, weight_kg) VALUES (10, 'Blossom','oct/13/1998',3,true,17);

INSERT INTO owners (full_name, age) VALUES ( 'Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ( 'Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ( 'Bob', 45);
INSERT INTO owners (full_name, age) VALUES ( 'Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ( 'Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ( 'Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, 'apr/23/2000');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, 'jan/17/2019');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, 'may/4/1981');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, 'jun/8/2008');

-- Vet William Tatcher is specialized in Pokemon.
INSERT INTO specializations (specie_id, vet_id) VALUES (1,1);
-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
INSERT INTO specializations (specie_id, vet_id) VALUES (1,3);
INSERT INTO specializations (specie_id, vet_id) VALUES (2,3);
-- Vet Jack Harkness is specialized in Digimon.
INSERT INTO specializations (specie_id, vet_id) VALUES (2,4);


