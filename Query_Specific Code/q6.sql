-- Rohit Shashikant Sevalkar | 11493842 
-- This is the q6.sql file. The aim of this file is to simulate the play of Game6, and update the changes required in the various tables that were created previously.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS ChangeAuditTrail;
CREATE TRIGGER ChangeAuditTrail --Creation of a Trigger to make changes to the Audittrail table
AFTER UPDATE OF bankbalance ON Players
FOR EACH ROW
WHEN NEW.name = "Norman" AND NEW.currentlocation = "Community Chest 1"
BEGIN
INSERT INTO Audittrail (playerid, location, bankbalance, gameround) -- Updating values in the Audittrail table
VALUES ((SELECT playerid 
FROM Players 
WHERE name = NEW.name), NEW.currentlocation, NEW.bankbalance, 2); --Values
END;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players  -- Updating the Players Table after the Game6

SET currentlocation = ( -- Updating Current Location
SELECT locationname FROM Board
WHERE locationid = ((SELECT locationid 
FROM Board 
WHERE locationname = currentlocation) + 4 - 1) % 16 + 1)
WHERE name = "Norman";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players  -- Updating the Players Table after the Game6

SET bankbalance = CASE  -- Updating the Bank Balance
WHEN name = "Norman" AND currentlocation LIKE "Community Chest 1" 
THEN bankbalance + 100
ELSE bankbalance
END;