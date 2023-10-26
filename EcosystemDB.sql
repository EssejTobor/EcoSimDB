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


-- @block
SELECT s.name AS species, h.name AS habitat
FROM Species s
JOIN Population p ON s.species_id = p.species_id
JOIN Habitat h ON p.habitat_id = h.habitat_id;

-- @block
SELECT h.name AS habitat, r.name AS resource
FROM Species s
JOIN Population p ON s.species_id = p.species_id
JOIN Habitat h ON p.habitat_id = h.habitat_id
JOIN Resource r ON h.habitat_id = r.habitat_id
WHERE s.name = 'Wolf';

-- generate more data and add it into the database
-- @block
INSERT INTO Species (name, scientific_name, type, average_lifespan) VALUES
('Brown Bear', 'Ursus arctos', 'Carnivore', 9490),
('Salmon', 'Salmo salar', 'Omnivore', 3652),
('Bald Eagle', 'Haliaeetus leucocephalus', 'Carnivore', 9125),
('Cottonwood Tree', 'Populus deltoides', 'Producer', 18250),
('Rabbit', 'Oryctolagus cuniculus', 'Herbivore', 3285),
('Sparrow', 'Passeridae', 'Omnivore', 2190),
('Maple Tree', 'Acer', 'Producer', 29200),
('Fox', 'Vulpes vulpes', 'Carnivore', 4745),
('Fir Tree', 'Abies', 'Producer', 47450),
('Carp', 'Cyprinus carpio', 'Omnivore', 5475),
('Rose Bush', 'Rosa', 'Producer', 7300),
('Coyote', 'Canis latrans', 'Carnivore', 5475),
('Cattail', 'Typha', 'Producer', 7300),
('Elk', 'Cervus canadensis', 'Herbivore', 9130),
('Pine Tree', 'Pinus', 'Producer', 29200),
('Beaver', 'Castor canadensis', 'Herbivore', 4745),
('Willow Tree', 'Salix', 'Producer', 18250),
('Lynx', 'Lynx canadensis', 'Carnivore', 7300),
('Birch Tree', 'Betula', 'Producer', 18250),
('Trout', 'Salmonidae', 'Omnivore', 2555),
('Mushroom', 'Agaricomycetes', 'Decomposer', 30),
('Hawk', 'Accipitridae', 'Carnivore', 7300),
('Dandelion', 'Taraxacum', 'Producer', 1500),
('Squirrel', 'Sciuridae', 'Herbivore', 2555),
('Apple Tree', 'Malus domestica', 'Producer', 18250),
('Moose', 'Alces alces', 'Herbivore', 9490),
('Bamboo', 'Bambusoideae', 'Producer', 7300),
('Mountain Lion', 'Puma concolor', 'Carnivore', 5475),
('Blueberry Bush', 'Vaccinium', 'Producer', 5475),
('Pigeon', 'Columba livia', 'Herbivore', 3650),
('Lily Pad', 'Nymphaeaceae', 'Producer', 1825),
('Crow', 'Corvus', 'Omnivore', 4745),
('Palm Tree', 'Arecaceae', 'Producer', 29200),
('Zebra', 'Equus quagga', 'Herbivore', 9130),
('Cactus', 'Cactaceae', 'Producer', 18250),
('Lemur', 'Lemuridae', 'Herbivore', 5475),
('Orchid', 'Orchidaceae', 'Producer', 3650),
('Shark', 'Selachimorpha', 'Carnivore', 10950),
('Seaweed', 'Algae', 'Producer', 7300),
('Panda', 'Ailuropoda melanoleuca', 'Herbivore', 12775),
('Sunflower', 'Helianthus', 'Producer', 150),
('Elephant', 'Loxodonta', 'Herbivore', 23725),
('Banana Tree', 'Musa', 'Producer', 5475),
('Ostrich', 'Struthio camelus', 'Omnivore', 12775),
('Grape Vine', 'Vitis', 'Producer', 5475),
('Ant', 'Formicidae', 'Omnivore', 730),
('Fern', 'Polypodiophyta', 'Producer', 3650),
('Giraffe', 'Giraffa', 'Herbivore', 9130),
('Olive Tree', 'Olea europaea', 'Producer', 32850),
('Snake', 'Serpentes', 'Carnivore', 7300);



-- @block
INSERT INTO Habitat (name, climate) VALUES
('Mountain', 'Alpine'),
('River', 'Freshwater'),
('Desert', 'Arid'),
('Swamp', 'Wetland'),
('Ocean', 'Saltwater'),
('Savanna', 'Tropical'),
('Tundra', 'Polar'),
('Island', 'Varied'),
('Rainforest', 'Humid'),
('Prairie', 'Temperate'),
('Glacier', 'Polar'),
('Cave', 'Subterranean'),
('Beach', 'Coastal'),
('Cliff', 'Temperate'),
('Estuary', 'Brackish'),
('Coral Reef', 'Tropical Saltwater'),
('Mangrove', 'Tropical Wetland'),
('Volcano', 'Extreme'),
('Marsh', 'Wetland'),
('Jungle', 'Tropical');


-- @block
-- Example records adding populations of different species in various habitats
INSERT INTO Population (species_id, habitat_id, count, last_counted) VALUES
(3, 1, 2000, '2023-10-25'),
(4, 2, 50, '2023-10-25'),
(5, 3, 40, '2023-10-25'),
(6, 4, 200, '2023-10-25'),
(7, 5, 120, '2023-10-25'),
(8, 6, 30, '2023-10-25'),
(9, 7, 75, '2023-10-25'),
(10, 8, 50, '2023-10-25'),
(11, 6, 10, '2023-10-25'),
(12, 9, 100, '2023-10-25'),
(13, 10, 300, '2023-10-25'),
(14, 11, 5000, '2023-10-25'),
(15, 7, 25, '2023-10-25'),
(16, 12, 60, '2023-10-25'),
(17, 13, 2, '2023-10-25'),
(18, 14, 180, '2023-10-25'),
(19, 15, 400, '2023-10-25'),
(20, 16, 5, '2023-10-25'),
(21, 17, 150, '2023-10-25'),
(22, 18, 20, '2023-10-25');




-- @block
-- More example interactions to diversify the simulation
INSERT INTO Interaction (type, species1_id, species2_id) VALUES
('Mutualism', 3, 4),  -- Mutualism between Oak Tree and Maple Tree
('Competition', 5, 6),  -- Competition between Fox and Coyote
('Symbiosis', 7, 8),  -- Symbiosis between Carp and Lotus
('Commensalism', 9, 10),  -- Commensalism between Seagull and Whale
('Parasitism', 11, 12),  -- Parasitism between Tick and Deer
('Predation', 13, 14),  -- Predation between Eagle and Rabbit
('Mutualism', 15, 16),  -- Mutualism between Butterfly and Flower
('Predation', 17, 18),  -- Predation between Shark and Small Fish
('Competition', 19, 20),  -- Competition between Lemur and Monkey
('Symbiosis', 21, 22),  -- Symbiosis between Clownfish and Anemone
('Commensalism', 23, 24),  -- Commensalism between Barnacle and Whale
('Predation', 25, 26),  -- Predation between Crocodile and Zebra
('Parasitism', 27, 28),  -- Parasitism between Leech and Frog
('Predation', 29, 30),  -- Predation between Spider and Fly
('Competition', 31, 32);  -- Competition between Grass and Shrub
-- @block

INSERT INTO Resource (name, habitat_id, availability) VALUES
('Berries', 1, 300),
('Insects', 1, 1000),
('Plankton', 2, 10000),
('Algae', 2, 8000),
('Seeds', 3, 150),
('Fruits', 3, 100),
('Grass', 4, 900),
('Bushes', 4, 200),
('Mice', 5, 80),
('Small Fish', 5, 400),
('Rocks', 6, 500),
('Fallen Logs', 6, 100),
('Nuts', 7, 250),
('Worms', 7, 300),
('Vegetation', 8, 1000);

-- @block
-- Adding 5 more resources across different habitats
INSERT INTO Resource (name, habitat_id, availability) VALUES
('Seaweed', 2, 1000),
('Bamboo', 8, 500),
('Ferns', 11, 1000),
('Grubs', 12, 1000),
('Moss', 13, 1000);

-- @block
--oops REMEMBER TO not to allow co-pilot to generate data. It has no context.

DELETE FROM Resource WHERE
(name = 'Seaweed' AND habitat_id = 2 AND availability = 1000) OR
(name = 'Bamboo' AND habitat_id = 8 AND availability = 500) OR
(name = 'Ferns' AND habitat_id = 11 AND availability = 1000) OR
(name = 'Grubs' AND habitat_id = 12 AND availability = 1000) OR
(name = 'Moss' AND habitat_id = 13 AND availability = 1000);

-- @block
INSERT INTO Resource (name, habitat_id, availability) VALUES
('Seaweed', 2, 1000),
('Bamboo', 8, 500),
('Ferns', 6, 1000),
('Grubs', 6, 1000),
('Moss', 6, 1000);


-- @block
-- Create Triggers for Predation
CREATE OR REPLACE FUNCTION predation_trigger()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Population
    SET count = count - 1
    WHERE species_id = NEW.species2_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER handle_predation
AFTER INSERT ON Interaction
FOR EACH ROW EXECUTE FUNCTION predation_trigger();

-- @block
-- Insert a new predation interaction (assuming species_id for Wolf is 1 and Deer is 2)
INSERT INTO Interaction (type, species1_id, species2_id) VALUES ('Predation', 1, 2);

-- @block
BEGIN;
INSERT INTO Interaction (type, species1_id, species2_id) VALUES ('Predation', 1, 2);
UPDATE Population SET count = count + 1 WHERE species_id = 1;
COMMIT;

-- @block

-- let's check in the those little guys
SELECT 
    s.species_id,
    s.name AS species_name,
    s.type AS species_type,
    s.average_lifespan,
    p.habitat_id,
    p.count AS population_count,
    p.last_counted
FROM 
    Species s
JOIN 
    Population p ON s.species_id = p.species_id
ORDER BY 
    s.species_id, p.habitat_id;
-- @block
SELECT AVG(count) FROM Population;

-- @block
SELECT species_id, SUM(count)
FROM Population
GROUP BY species_id;

-- @block
SELECT species_id, SUM(count)
FROM Population
GROUP BY species_id
HAVING SUM(count) > 5;

-- @block
SELECT h.name, AVG(p.count)
FROM Habitat h
JOIN Population p ON h.habitat_id = p.habitat_id
GROUP BY h.name;


-- @block
SELECT species_id, count, SUM(count) OVER (PARTITION BY species_id ORDER BY last_counted)
FROM Population;


-- @block
WITH HabitatAvg AS (
    SELECT habitat_id, AVG(count) AS avg_count
    FROM Population
    GROUP BY habitat_id
)
SELECT h.name, ha.avg_count
FROM Habitat h
JOIN HabitatAvg ha ON h.habitat_id = ha.habitat_id;

-- @block
CREATE INDEX idx_species_name ON Species(name);

-- @block
SELECT * FROM Species;
-- @block
-- reminder for the command for double checking the connection is closed: netstat -an | findstr 5432


-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block



-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block
-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block

-- @block