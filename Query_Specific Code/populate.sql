-- Rohit Shashikant Sevalkar | 11493842 
-- This is the populate.sql file. The aim of this file is to populate the skeleton of the tables that have been created in the create.sql file.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PART A | This part of the code aims to populate the Monopolee Board table. 
-- This lists out the 16 different locations of the board, in their clockwise gameplay order.
INSERT INTO Board
VALUES
(1, "GO"),
(2, "Kilburn"),
(3, "Chance 1"),
(4, "Uni Place"),
(5, "Jail"),
(6, "Victoria"),
(7, "Community Chest 1"),
(8, "Piccadilly"),
(9, "Free Parking"),
(10, "Oak House"),
(11, "Chance 2"),
(12, "Owens Park"),
(13, "Go To Jail"),
(14, "AMBS"),
(15, "Community Chest 2"),
(16, "Co-op");

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PART B | This part of the code aims to populate the Bonus table.
-- The 7 bonus locations that appear on the board and their descriptions have been mentioned.
INSERT INTO Bonus
VALUES
(1,"Chance 1","Pay each of the other players £50"),
(2,"Chance 2","Move forward 3 spaces"),
(3,"Community Chest 1","For winning a Beauty Contest, you win £100"),
(4,"Community Chest 2","Your library books are overdue. Play a fine of £30"),
(5,"Free Parking","No action"),
(6,"Go To Jail","Go to Jail, do not pass GO, do not collect £200"),
(7,"GO","Collect £200");

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PART C | This part of the code aims to populate the Properties table.
-- The 8 properties that can be bought or have been already bought have been mentioned here, 
-- with their Costs(which also serve as rents if they already have an owner). 
-- Their Colour codes have been mentioned as well.
INSERT INTO Properties
VALUES
(1,"Oak House", 100, "Orange"),
(2,"Owens Park", 30, "Orange"),
(3,"AMBS", 400, "Blue"),
(4,"Co-op", 30, "Blue"),
(5,"Kilburn", 120, "Yellow"),
(6,"Uni Place", 100, "Yellow"),
(7,"Victoria", 75, "Green"),
(8,"Piccadilly", 35, "Green");

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PART D | This part of the code aims to populate the Players table.
-- The 4 Players that are currently playing the game have been mentioned.
-- Their token object, initial location, their bank balance, and the properties that they own are mentioned.
INSERT INTO Players
VALUES
(1,"Mary","Battleship","Free Parking",190,"Uni Place"),
(2,"Bill","Dog","Owens Park",500,"Victoria"),
(3,"Jane","Car","AMBS",150,"Co-op"),
(4,"Norman","Thimble","Kilburn",250,"Oak House, Owens Park");

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PART E | This part of the code aims to populate the Token table.
-- The 6 token choices that the players can choose out of have been mentioned here
INSERT INTO Token 
VALUES
(1,"Dog"),
(2,"Car"),
(3,"Battleship"),
(4,"Top Hat"),
(5,"Thimble"),
(6,"Boot")