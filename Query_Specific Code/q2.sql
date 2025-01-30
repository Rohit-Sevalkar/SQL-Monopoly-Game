-- Rohit Shashikant Sevalkar | 11493842 
-- This is the q2.sql file. The aim of this file is to simulate the play of Game2, and update the changes required in the various tables that were created previously.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS ChangeAuditTrail;
CREATE TRIGGER ChangeAuditTrail  --Creation of a Trigger to make changes to the Audittrail table
AFTER UPDATE OF bankbalance ON Players
WHEN NEW.name = "Norman"  AND NEW.bankbalance != OLD.bankbalance
BEGIN
INSERT INTO Audittrail (playerid, location, bankbalance, gameround)  -- Updating values in the Audittrail table
VALUES (NEW.playerid, NEW.currentlocation, NEW.bankbalance, 1);  --Values
END;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players -- Updating the Players Table after the Game2

SET currentlocation = (
SELECT locationname 
FROM Board -- Updating Current Location
WHERE locationid = ((SELECT locationid FROM Board WHERE locationname = currentlocation) + 1 - 1) % 16 + 1)
WHERE name = "Norman";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players-- Updating the Players Table after the Game2

SET bankbalance = CASE
WHEN name = "Norman" AND currentlocation LIKE "Chance 1" 
THEN bankbalance - (50 * (SELECT COUNT(*) FROM Players WHERE name != "Norman"))
WHEN name != "Norman" AND EXISTS (SELECT 1 FROM Players WHERE name = "Norman" AND currentlocation LIKE "Chance 1") 
THEN bankbalance + 50
ELSE bankbalance  -- Updaing Balance
END;