-- Rohit Shashikant Sevalkar | 11493842 
-- This is the q1.sql file. The aim of this file is to simulate the play of Game1, and update the changes required in the various tables that were created previously.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS ChangeAuditTrail;  
CREATE TRIGGER ChangeAuditTrail     --Creation of a Trigger to make changes to the Audittrail table
AFTER UPDATE OF currentlocation on Players
WHEN NEW.currentlocation != OLD.currentlocation
BEGIN
INSERT INTO Audittrail (playerid,  location,  bankbalance, gameround) -- Updating values in the Audittrail table
VALUES (NEW.playerid,  NEW.currentlocation,  NEW.bankbalance, 1);  -- Values
END;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players -- Updating the Players Table after the Game1

SET currentlocation = (
SELECT locationname 
FROM Board -- Updating Current Location
WHERE locationid = ( 
(SELECT locationid 
FROM Board 
WHERE locationname = currentlocation) + 3 - 1) % 16 + 1),
 
bankbalance = bankbalance + 200 -- Updaing Balance
WHERE name = "Jane";