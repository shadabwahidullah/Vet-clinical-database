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

-- Agumon visited William Tatcher on May 24th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (1,1, 'may/24/2020');
-- Agumon visited Stephanie Mendez on Jul 22th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (1,3, 'jul/22/2020');
-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (2,4, 'feb/2/2021');
-- Pikachu visited Maisy Smith on Jan 5th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (3,2, 'jan/5/2020');
-- Pikachu visited Maisy Smith on Mar 8th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (3,2, 'may/8/2020');
-- Pikachu visited Maisy Smith on May 14th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (3,2, 'may/14/2020');
-- Devimon visited Stephanie Mendez on May 4th, 2021.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (4,3, 'may/4/2021');
-- Charmander visited Jack Harkness on Feb 24th, 2021.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (null ,4, 'feb/24/2021');
-- Plantmon visited Maisy Smith on Dec 21st, 2019.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (null ,2, 'dec/21/2019');
-- Plantmon visited William Tatcher on Aug 10th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (null ,1, 'aug/10/2020');
-- Plantmon visited Maisy Smith on Apr 7th, 2021.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (null ,1, 'apr/7/2021');
-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
    INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (7,3, 'sep/29/2019');
-- Angemon visited Jack Harkness on Oct 3rd, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (8,4, 'oct/3/2020');
-- Angemon visited Jack Harkness on Nov 4th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (8,4, 'nov/4/2020');
-- Boarmon visited Maisy Smith on Jan 24th, 2019.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (9,2, 'jan/24/2019');
-- Boarmon visited Maisy Smith on May 15th, 2019.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (9,2, 'may/15/2019');
-- Boarmon visited Maisy Smith on Feb 27th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (9,2, 'feb/27/2020');
-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (9,2, 'aug/3/2020');
-- Blossom visited Stephanie Mendez on May 24th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (10,3, 'may/24/2020');
-- Blossom visited William Tatcher on Jan 11th, 2021.
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (10,1, 'jan/11/2021');


-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120); -- run this command ten times


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp; --run this command ten times

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';  --run this command ten times
