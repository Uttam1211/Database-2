/* inserts */

--Run commands
-- @C:\csy2038\as2\insert.sql

/*
Group 5
KHAGENDRA CHHETRI -  21427623
SUMAN ARYAL - 21430467
MADHAB SHRESTHA -  22400129
UTTAM THAKUR - 20419147
*/


--addresses
INSERT INTO addresses (street, city, country) 
VALUES ('123 MAIN ST', 'NEW YORK', 'USA');

INSERT INTO addresses (street, city, country) 
VALUES ('456 PARK AVE', 'LOS ANGELES', 'USA');

INSERT INTO addresses (street, city, country) 
VALUES ('789 ELM ST', 'CHICAGO', 'USA');

INSERT INTO addresses (street, city, country) 
VALUES ('321 OAK ST', 'HOUSTON', 'USA');

INSERT INTO addresses (street, city, country) 
VALUES ('159 BIRCH RD', 'SEATTLE', 'USA');

INSERT INTO addresses (street, city, country) 
VALUES ('753 MAPLE AVE', 'MIAMI', 'USA');

--exoerince_nature
INSERT INTO experience_natures (experience_nature_id, category, duration)
VALUES (experience_natures_seq.NEXTVAL, 'OUTDOOR', 3) ;

INSERT INTO experience_natures (experience_nature_id, category, duration)
VALUES (experience_natures_seq.NEXTVAL, 'WINTER SPORTS',2 );

INSERT INTO experience_natures (experience_nature_id, category, duration)
VALUES (experience_natures_seq.NEXTVAL, 'WATER SPORTS',1 );

INSERT INTO experience_natures (experience_nature_id, category, duration)
VALUES (experience_natures_seq.NEXTVAL, 'ADVENTURE SPORTS', 2);

INSERT INTO experience_natures (experience_nature_id, category, duration)
VALUES (experience_natures_seq.NEXTVAL, 'OUTDOOR', 4);

INSERT INTO experience_natures (experience_nature_id, category, duration)
VALUES (experience_natures_seq.NEXTVAL, 'WATER SPORTS', 2);

--location
INSERT INTO locations (location_id, address, facility)
VALUES (locations_seq.NEXTVAL, address_type('124 MAIN ST', 'NEW YORK', 'USA'), facility_table_type(facility_type('CAMPGROUND', 'CAMPING', 'NATURE STAY'), facility_type('LODGE', 'ACCOMMODATION', 'NATURE STAY')));

INSERT INTO locations (location_id, address, facility)
VALUES (locations_seq.NEXTVAL, address_type('456 PARK AVE', 'LOS ANGELES', 'USA'), facility_table_type(facility_type('SKI LODGE', 'ACCOMMODATION', 'WINTER SPORTS'), facility_type('SKI RENTAL', 'EQUIPMENT RENTAL', 'WINTER SPORTS')));

INSERT INTO locations (location_id, address, facility)
VALUES (locations_seq.NEXTVAL, address_type('789 ELM ST', 'CHICAGO', 'USA'), facility_table_type(facility_type('SURF SCHOOL', 'LESSONS', 'WATER SPORTS'), facility_type('SURF RENTAL', 'EQUIPMENT RENTAL', 'WATER SPORTS')));

INSERT INTO locations (location_id, address, facility)
VALUES (locations_seq.NEXTVAL, address_type('321 OAK ST', 'HOUSTON', 'USA'), facility_table_type(facility_type('CLIMBING GYM', 'INDOOR CLIMBING', 'ADVENTURE SPORTS'), facility_type('CLIMBING GEAR RENTAL', 'EQUIPMENT RENTAL', 'ADVENTURE SPORTS')));

INSERT INTO locations (location_id, address, facility)
VALUES (locations_seq.NEXTVAL, address_type('159 BIRCH RD', 'SEATTLE', 'USA'), facility_table_type(facility_type('FISHING CHARTER', 'BOAT RENTALS', 'OUTDOOR'), facility_type('FISHING GEAR RENTAL', 'EQUIPMENT RENTAL', 'OUTDOOR')));

INSERT INTO locations (location_id, address, facility)
VALUES (locations_seq.NEXTVAL, address_type('753 MAPLE AVE', 'MIAMI', 'USA'), facility_table_type(facility_type('KAYAK OUTFITTER', 'EQUIPMENT RENTAL', 'WATER SPORTS'), facility_type('KAYAK SCHOOL', 'LESSONS', 'WATER SPORTS')));


--experinces
INSERT INTO experiences (experience_name, experience_id,experience_nature_id, location_id, price, activity)
VALUES ('SKIING IN THE ROCKIES', experinces_seq.NEXTVAL, 101,101, 100, activity_varray_type(activity_type('HIKING', 'NATURE WALK', 'OUTDOOR'), activity_type('CAMPING', 'OVERNIGHT STAY', 'OUTDOOR')));


INSERT INTO experiences (experience_name, experience_id,experience_nature_id, location_id, price, activity)
VALUES ('SKIING ADVENTURE',experinces_seq.NEXTVAL, 102,102, 150, activity_varray_type(activity_type('SKIING', 'DOWNHILL SKIING', 'WINTER SPORTS'), activity_type('SNOWBOARDING', 'FREESTYLE', 'WINTER SPORTS')));

INSERT INTO experiences (experience_name, experience_id,experience_nature_id, location_id, price, activity)
VALUES ('SURFING EXPERIENCE', experinces_seq.NEXTVAL, 103,103, 200, activity_varray_type(activity_type('SURFING', 'BEGINNER LESSON', 'WATER SPORTS'), activity_type('STAND-UP PADDLEBOARDING', 'SUP', 'WATER SPORTS')));

INSERT INTO experiences (experience_name, experience_id,experience_nature_id, location_id, price, activity)
VALUES ('ROCK CLIMBING EXCURSION', experinces_seq.NEXTVAL, 104,104, 250, activity_varray_type(activity_type('Rock Climbing', 'Outdoor Climbing', 'Adventure Sports'), activity_type('BOULDERING', 'INDOOR CLIMBING', 'ADVENTURE SPORTS')));

INSERT INTO experiences (experience_name, experience_id,experience_nature_id, location_id, price, activity)
VALUES ('FISHING TRIP', experinces_seq.NEXTVAL, 105,105, 300, activity_varray_type(activity_type('Fishing', 'Fly Fishing', 'Outdoor'), activity_type('FISHING', 'DEEP SEA FISHING', 'OUTDOOR')));

INSERT INTO experiences (experience_name, experience_id,experience_nature_id, location_id, price, activity)
VALUES ('KAYAKING EXPEDITION', experinces_seq.NEXTVAL,100,100, 350, activity_varray_type(activity_type('KAYAKING', 'WHITEWATER KAYAKING', 'WATER SPORTS'), activity_type('KAYAKING', 'SEA KAYAKING', 'WATER SPORTS')));

--ambassadors
INSERT INTO ambassadors (ambassador_id, ambassador_name, profile)
VALUES (ambassadors_seq.NEXTVAL, 'JOHN SMITH', 'EXPERIENCED HIKER AND OUTDOOR ENTHUSIAST');

UPDATE ambassadors SET address = 
(SELECT REF(a) FROM addresses a 
WHERE a.street = '123 Main St') 
WHERE ambassador_id = 100;

INSERT INTO ambassadors (ambassador_id, ambassador_name, profile)
VALUES (ambassadors_seq.NEXTVAL, 'JANE DOE', 'EXPERIENCED SKIER AND WINTER SPORTS ENTHUSIAST');

UPDATE ambassadors SET address = 
(SELECT REF(a) FROM addresses a
WHERE a.street = '456 Park Ave')
WHERE ambassador_id = 101;


INSERT INTO ambassadors (ambassador_id, ambassador_name, profile)
VALUES (ambassadors_seq.NEXTVAL, 'MIKE JOHNSON', 'EXPERIENCED SURFER AND WATER SPORTS ENTHUSIAST');

UPDATE ambassadors SET address = 
(SELECT REF(a) FROM addresses a 
WHERE a.street = '789 Elm St')
WHERE ambassador_id = 102;

INSERT INTO ambassadors (ambassador_id, ambassador_name, profile)
VALUES (ambassadors_seq.NEXTVAL, 'SOPHIE THOMPSON', 'EXPERIENCED ROCK CLIMBER AND ADVENTURE SPORTS ENTHUSIAST');

UPDATE ambassadors SET address = 
(SELECT REF(a) FROM addresses a 
WHERE a.street = '321 Oak St')
WHERE ambassador_id = 103;

INSERT INTO ambassadors (ambassador_id, ambassador_name, profile)
VALUES (ambassadors_seq.NEXTVAL, 'CHRIS BROWN', 'EXPERIENCED ANGLER AND OUTDOOR ENTHUSIAST');

UPDATE ambassadors SET address = 
(SELECT REF(a) FROM addresses a 
WHERE a.street = '159 Birch Rd')
WHERE ambassador_id = 104;

INSERT INTO ambassadors (ambassador_id, ambassador_name, profile)
VALUES (ambassadors_seq.NEXTVAL, 'EMILY DAVIS', 'EXPERIENCED KAYAKER AND WATER SPORTS ENTHUSIAST');

UPDATE ambassadors SET address = 
(SELECT REF(a) FROM addresses a 
WHERE a.street = '753 MAPLE AVE')
WHERE ambassador_id = 105;

--experince ambassador
INSERT INTO experience_ambassadors (ambassador_id, experience_id)
VALUES (100,100);


INSERT INTO experience_ambassadors (ambassador_id, experience_id)
VALUES (101,101);

INSERT INTO experience_ambassadors (ambassador_id, experience_id)
VALUES (102,102);

INSERT INTO experience_ambassadors (ambassador_id, experience_id)
VALUES (103,103);

INSERT INTO experience_ambassadors (ambassador_id, experience_id)
VALUES (104,104);

INSERT INTO experience_ambassadors (ambassador_id, experience_id)
VALUES (105,105);


--update
UPDATE ambassadors b
SET b.profile = 'EXPERIENCED HIKER AND OUTDOOR ENTHUSIAST WITH 10 YEARS OF EXPERIENCE'
WHERE b.ambassador_name = 'JOHN SMITH';

UPDATE ambassadors
SET address = (SELECT REF(a) FROM addresses a WHERE a.street='789 ELM ST')
WHERE ambassador_id = 102;

UPDATE locations
SET facility = facility_table_type(facility_type('CAMPGROUND', 'CAMPING', 'NATURE STAY'), facility_type('LODGE', '&SERVICES', 'NATURE STAY'))
WHERE location_id = 103;

UPDATE experience_natures
SET duration = 1
WHERE experience_nature_id = 100;

COMMIT;
/* _______________________________________________
            
            CHECK INSERTS
__________________________________________________
*/

/* COLUMN street FORMAT A20;
COLUMN city FORMAT A20;
SELECT * FROM experience_natures;
SELECT * FROM experiences;
SELECT * FROM ambassadors;
SELECT l.experience_id, l.address.street, l.address.city,l.address.country FROM locations;
SELECT * FROM experience_ambassadors; */

