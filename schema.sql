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



