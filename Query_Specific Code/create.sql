-- Rohit Shashikant Sevalkar | 11493842 
-- This is the create.sql file. The aim of this file is to create the skeleton of the tables that are required to store the data required for running the game.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PART A | This part of the code aims to create the Monopolee Board table. 
-- There are 2 attributes to this table namely the Location ID and the Location name. 
-- The domains of the attributes, and the primary key for the table has been mentioned
CREATE TABLE "Board" (
"locationid"	INT,
"locationname"	TEXT,
PRIMARY KEY("locationid")
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PART B | This part of the code aims to create the Bonus Description table. 
-- There are 3 attributes to this table namely the Bonus ID, bonus name, and the bonus description.
-- The domains of the attributes, and the primary key for the table has been mentioned
CREATE TABLE "Bonus" (
"bonusid"	INTEGER,
"bonusname"	TEXT,
"description"	TEXT,
PRIMARY KEY("bonusid")
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PART C | This part of the code aims to create the Properties table. 
-- There are 4 attributes to this table namely the Property ID, property name, Cost/rent of the property and the colour code of the property.
-- The domains of the attributes, and the primary key for the table has been mentioned
CREATE TABLE "Properties" (
"propertyid"	INTEGER,
"property"	TEXT,
"cost"	INT,
"colour"	TEXT,
PRIMARY KEY("propertyid")
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PART D | This part of the code aims to create the Player Information table. 
-- There are 6 attributes to this table namely Player ID, Player name, playable token object, initial location on board, 
-- their bank balance, and the properties owned by the players.
-- The domains of the attributes, and the primary key for the table has been mentioned
CREATE TABLE "Players" (
"playerid"	INT,
"name"	TEXT,
"token"	TEXT,
"currentlocation"	TEXT,
"bankbalance"	INT,
"property"	TEXT,
PRIMARY KEY("playerid")
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PART E | This part of the code aims to create the Audit Trail Gameplay Table. 
-- There are 5 attributes to this table namely the Audittrail ID, player ID, locaiton landed on, current bank balance, and number of the game round.
-- The aim of this table is to record the game events with their particulars. 
--The domains of the attributes, and the primary key for the table has been mentioned
CREATE TABLE "Audittrail" (
"auditid"	INTEGER,
"playerid"	INT,
"location"	TEXT,
"bankbalance"	INT,
"gameround"	INT,
PRIMARY KEY("auditid" AUTOINCREMENT),
FOREIGN KEY("playerid") REFERENCES "Players"("playerid")
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PART F | This part of the code aims to create the Tokens Table. 
-- There are 2 attributes to this table namely the Token ID and the Token Name
-- The aim of this table is to record the game events with their particulars. 
--The domains of the attributes, and the primary key for the table has been mentioned
CREATE TABLE "Token" (
	"tokenid"	INTEGER,
	"tokenname"	INTEGER,
	PRIMARY KEY("tokenid")
);