-- @block
CREATE DATABASE EcosystemDB;

-- Create Species table
CREATE TABLE Species (
    species_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    scientific_name VARCHAR(50),
    type VARCHAR(20),
    average_lifespan INT
);

-- Create Habitat table
CREATE TABLE Habitat (
    habitat_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    climate VARCHAR(20)
);

-- Create Population table
CREATE TABLE Population (
    population_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES Species(species_id),
    habitat_id INT REFERENCES Habitat(habitat_id),
    count INT,
    last_counted DATE
);

-- Create Interaction table
CREATE TABLE Interaction (
    interaction_id SERIAL PRIMARY KEY,
    type VARCHAR(20),
    species1_id INT REFERENCES Species(species_id),
    species2_id INT REFERENCES Species(species_id)
);

-- Create Resource table
CREATE TABLE Resource (
    resource_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    habitat_id INT REFERENCES Habitat(habitat_id),
    availability INT
);

-- @block
INSERT INTO Species (name, scientific_name, type, average_lifespan) VALUES
('Wolf', 'Canis lupus', 'Carnivore', 3650),
('Deer', 'Odocoileus virginianus', 'Herbivore', 3650),
('Oak Tree', 'Quercus robur', 'Producer', 36500);
-- @block
UPDATE Species SET average_lifespan = 4000 WHERE name = 'Wolf';

-- @block
INSERT INTO Habitat (name, climate) VALUES
('Forest', 'Temperate'),
('Lake', 'Freshwater');


-- @block
-- Assuming the species_id for Wolf is 1 and for Deer is 2
-- Assuming the habitat_id for Forest is 1 and for Lake is 2
INSERT INTO Population (species_id, habitat_id, count, last_counted) VALUES
(1, 1, 30, '2023-10-25'),
(2, 1, 100, '2023-10-25');

-- @block
-- Assuming the species_id for Wolf is 1 and for Deer is 2
INSERT INTO Interaction (type, species1_id, species2_id) VALUES
('Predation', 1, 2);

-- @block
-- Assuming the habitat_id for Forest is 1 and for Lake is 2
INSERT INTO Resource (name, habitat_id, availability) VALUES
('Water', 1, 1000),
('Fish', 2, 200);
