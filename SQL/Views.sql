-- Used to get all items from the last 24 hours
CREATE VIEW BoxLog_View AS
	SELECT *
	FROM Box_SmartUnit
	WHERE time <= now() AND time >= now() - interval '24 hour';

-- Vær lige opmærksom på at datoerne sansynligvis er forældet 
-- inden på InsertData.sql linje 23, 25 og 27
SELECT * FROM BoxLog_View;
