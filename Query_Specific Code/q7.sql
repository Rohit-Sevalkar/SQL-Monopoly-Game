-- Rohit Shashikant Sevalkar | 11493842 
-- This is the q7.sql file. The aim of this file is to simulate the play of Game7, and update the changes required in the various tables that were created previously.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS ChangeAuditTrail;
CREATE TRIGGER ChangeAuditTrail  --Creation of a Trigger to make changes to the Audittrail table
AFTER UPDATE OF bankbalance ON Players
FOR EACH ROW
WHEN NEW.name = "Mary" AND NEW.currentlocation = "Co-op"
BEGIN
INSERT INTO AuditTrail (playerid, location, bankbalance, gameround) -- Updating values in the Audittrail table
VALUES ((SELECT playerid FROM Players WHERE name = NEW.name), NEW.currentlocation, NEW.bankbalance, 2); --Values
END;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Here I have considered the after rolling a 6, Mary gets out of Jail and moves 6 places and lands on Chance 1. But since rolling a 6 has no effect
-- she will need to roll again. Now Mary rolls a 5 for her 2nd turn, and eventually lands on Co-op, and subsequently pays the rent there.
UPDATE Players -- Updating the Players Table after the Game7
SET currentlocation = ( -- Updating Current Location
SELECT locationname FROM Board
WHERE locationid = ((SELECT locationid FROM Board WHERE locationname = currentlocation) + 11 - 1) % 16 + 1)
WHERE name = "Mary";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players -- Updating the Players Table after the Game7
SET bankbalance = bankbalance - ( -- Updating the Bank Balance
SELECT cost FROM Properties where propertyid=4
)
WHERE name = "Mary";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Players -- Updating the Players Table after the Game7
SET bankbalance = bankbalance + ( -- Updating the Bank Balance
SELECT cost FROM Properties
WHERE property = "Co-op"
)
WHERE name = "Jane";