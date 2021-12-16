/* Database schema to keep the structure of entire database. */
createdb vet_clinic

CREATE TABLE animals (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    date_of_birth DATE,
    escape_attempts integer,
    neutured boolean,
    weight_kg DECIMAL,
);

ALTER TABLE animals ADD COLUMN species varchar(255);

CREATE TABLE owners (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(255),
    age INTEGER,
);

CREATE TABLE species (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255)
);

-- Modify animals table: 
-- Make sure that id is set as autoincremented PRIMARY KEY
\d animals;

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id int;

ALTER TABLE animals ADD CONSTRAINT species_id_fk FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id int;

ALTER TABLE animals ADD CONSTRAINT owner_id_fk FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    specie_id INT,
    vet_id INT,
    CONSTRAINT specie_id_fk FOREIGN KEY (specie_id) REFERENCES species(id),
    CONSTRAINT vet_id_fk FOREIGN KEY (vet_id) REFERENCES vets(id)
);

CREATE TABLE visits (
    animal_id INT,
    vet_id INT,
    visit_date DATE,
    CONSTRAINT animal_id_fk FOREIGN KEY (animal_id) REFERENCES animals(id),
    CONSTRAINT vet_id_fk FOREIGN KEY (vet_id) REFERENCES vets(id)
);

CREATE INDEX visits_index ON visits(animal_id);
CREATE INDEX email_index ON owners(email ASC);
CREATE INDEX visits_all_index ON visits(vet_id, animal_id, visit_date);


