-- Rohit Shashikant Sevalkar | 11493842 
-- This is the q5.sql file. The aim of this file is to simulate the play of Game5, and update the changes required in the various tables that were created previously.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS ChangeAuditTrail;
CREATE TRIGGER ChangeAuditTrail --Creation of a Trigger to make changes to the Audittrail table
AFTER UPDATE OF currentlocation, bankbalance ON Players
FOR EACH ROW
WHEN NEW.name = "Jane" AND NEW.currentlocation = "Victoria" AND NEW.bankbalance = 325
BEGIN
INSERT INTO Audittrail (playerid, location, bankbalance, gameround) -- Updating values in the Audittrail table
VALUES ((SELECT playerid 
FROM Players 
WHERE name = NEW.name), NEW.currentlocation, NEW.bankbalance, 2); --Values
END;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players -- Updating the Players Table after the Game5
SET currentlocation = ( -- Updating Current Location
SELECT locationname FROM Board
WHERE locationid = ((SELECT locationid 
FROM Board 
WHERE locationname = currentlocation) + 5 - 1) % 16 + 1)
WHERE name = "Jane";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players-- Updating the Players Table after the Game5
SET bankbalance = bankbalance - ( -- Updating the Bank Balance
SELECT cost FROM Properties where propertyid=7
)
WHERE name = "Jane";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players-- Updating the Players Table after the Game5
SET bankbalance = bankbalance + ( -- Updating the Bank Balance
SELECT cost FROM Properties
WHERE propertyid=7
)
WHERE name = "Bill";