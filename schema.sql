/* Database schema to keep the structure of entire database. */
createdb vet_clinic

CREATE TABLE animals (
    id int PRIMARY KEY GENERATED  ALWAYS AS IDENTITY,,
    name varchar(255),
    date_of_birth DATE,
    escape_attempts integer,
    neutured boolean,
    weight_kg DECIMAL,
);
