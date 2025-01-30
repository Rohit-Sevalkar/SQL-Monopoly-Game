-- Rohit Shashikant Sevalkar | 11493842 
-- This is the q8.sql file. The aim of this file is to simulate the play of Game8, and update the changes required in the various tables that were created previously.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS ChangeAuditTrail;
CREATE TRIGGER ChangeAuditTrail --Creation of a Trigger to make changes to the Audittrail table
AFTER UPDATE OF bankbalance ON Players
FOR EACH ROW
WHEN NEW.name = "Bill" AND NEW.bankbalance = 525
BEGIN
INSERT INTO AuditTrail (playerid, location, bankbalance, gameround) -- Updating values in the Audittrail table
VALUES ((SELECT playerid 
FROM Players 
WHERE name = NEW.name), NEW.currentlocation, NEW.bankbalance, 2); --Values
END;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players -- Updating the Players Table after the Game8

SET currentlocation = ( -- Updating Current Location
SELECT locationname 
FROM Board
WHERE locationid = ((SELECT locationid 
FROM Board 
WHERE locationname = currentlocation) + 9 - 1) % 16 + 1),
bankbalance = bankbalance + 100 + 200 -- Updating the Bank Balance
WHERE name = "Bill";