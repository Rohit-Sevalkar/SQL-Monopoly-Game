-- Rohit Shashikant Sevalkar | 11493842 
-- This is the q4.sql file. The aim of this file is to simulate the play of Game4, and update the changes required in the various tables that were created previously.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS ChangeAuditTrail;
CREATE TRIGGER ChangeAuditTrail --Creation of a Trigger to make changes to the Audittrail table
AFTER UPDATE OF currentlocation, bankbalance ON Players
FOR EACH ROW
WHEN NEW.name = "Bill" AND NEW.currentlocation = "AMBS" AND NEW.bankbalance = 150
BEGIN
INSERT INTO Audittrail (playerid, location, bankbalance, gameround) -- Updating values in the Audittrail table
VALUES ((SELECT playerid 
FROM Players 
WHERE name = NEW.name), NEW.currentlocation, NEW.bankbalance, 1); --Values
END;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players -- Updating the Players Table after the Game4
SET currentlocation = (
SELECT locationname FROM Board -- Updating Current Location
WHERE locationid = ((SELECT locationid 
FROM Board 
WHERE locationname = currentlocation) + 2 - 1) % 16 + 1)
WHERE name = "Bill";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players -- Updating the Bank Balance
SET bankbalance = bankbalance - 400
WHERE name = "Bill";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players -- Updating Properties owned
SET property = "Victoria"||", AMBS"
WHERE name = "Bill";