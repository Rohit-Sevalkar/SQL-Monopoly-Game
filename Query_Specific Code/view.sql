-- Rohit Shashikant Sevalkar | 11493842 
-- This is the view.sql file. The aim of this file is to displays a leaderboard of the gameplay, whereby it could be called after each turn.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW "gameView" AS -- Creating a view
SELECT Players.name,  -- Including the columns for the view
Players.currentlocation, 
Players.bankbalance, 
Players.property 
FROM Players;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM gameView; -- Calling the gameView view