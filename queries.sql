/*Queries that provide answers to the questions from all projects.*/
SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '1/1/2016' AND '1/1/2019';
SELECT name from animals WHERE neutured = true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutured = true;
SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS null;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > 'jan/1/2022';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;


-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutured, SUM(escape_attempts) FROM animals GROUP BY neutured;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth > '1/1/1990' AND date_of_birth < '1/1/2000' GROUP BY species;

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS null;


-- What animals belong to Melody Pond?
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id; 
-- How many animals are there per species?
SELECT species.name, COUNT(animals.species_id) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE animals.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';
-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(animals.name) DESC;



-- Who was the last animal seen by William Tatcher?
SELECT a.name FROM animals a JOIN visits v ON a.id = v.animal_id WHERE v.vet_id = 1;
-- How many different animals did Stephanie Mendez see?
SELECT COUNT(a.name) FROM animals a JOIN visits v ON a.id = v.animal_id WHERE v.vet_id = 3;
-- List all vets and their specialties, including vets with no specialties.
SELECT v.id, v.name, s.name specializations FROM vets v FULL JOIN specializations sp ON v.id = sp.vet_id FULL JOIN species s ON s.id = sp.specie_id ;
-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT a.name, ve.name vet, v.visit_date FROM animals a JOIN visits v ON a.id = v.animal_id JOIN vets ve ON ve.id = v.vet_id  WHERE v.visit_date > 'apr/1/2020' AND v.visit_date < 'aug/30/2020' AND ve.name = 'Stephanie Mendez';
-- What animal has the most visits to vets?
SELECT a.name, COUNT(a.name) FROM animals a JOIN visits v ON a.id = v.animal_id GROUP BY a.name ORDER BY COUNT(a.name) DESC;
-- Who was Maisy Smith's first visit?
SELECT a.name, MIN(v.visit_date) first_visit FROM animals a JOIN visits v ON a.id = v.animal_id JOIN vets ve ON ve.id = v.vet_id WHERE ve.name = 'Maisy Smith'  GROUP BY a.name ORDER BY (first_visit);
-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT a.name, a.weight_kg, a.neutured, ve.name vet_name, v.visit_date FROM animals a JOIN visits v ON a.id = v.animal_id JOIN vets ve ON ve.id = v.vet_id;
-- How many visits were with a vet that did not specialize in that animal's species?
SELECT ve.name, COUNT(ve.name) FROM vets ve LEFT JOIN visits v ON ve.id = v.vet_id GROUP BY ve.name; 
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT ve.name, COUNT(ve.name) FROM visits v  JOIN vets ve ON ve.id = v.vet_id JOIN specializations s ON s.vet_id = v.vet_id WHERE ve.name = 'Maisy Smith' GROUP BY ve.name; 



