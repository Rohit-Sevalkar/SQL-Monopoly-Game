-- Rohit Shashikant Sevalkar | 11493842 
-- This is the q3.sql file. The aim of this file is to simulate the play of Game3, and update the changes required in the various tables that were created previously.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS ChangeAuditTrail;
CREATE TRIGGER ChangeAuditTrail  --Creation of a Trigger to make changes to the Audittrail table
AFTER UPDATE OF currentlocation ON Players
WHEN NEW.name = "Mary"  AND NEW.currentlocation = "Jail"
BEGIN
INSERT INTO Audittrail (playerid, location, bankbalance, gameround) -- Updating values in the Audittrail table
VALUES (NEW.playerid, NEW.currentlocation, NEW.bankbalance, 1); --Values
END;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players ---- Updating the Players Table after the Game3

SET currentlocation = CASE
WHEN (
SELECT locationname 
FROM Board
WHERE locationid = ( -- Updating the Location
(SELECT locationid FROM Board 
WHERE locationname = Players.currentlocation) + 4 - 1) % 16 + 1) = "Go To Jail" 
THEN "Jail"
END
WHERE Name = "Mary" AND currentlocation != "Jail";