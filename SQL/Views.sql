CREATE OR REPLACE VIEW BoxLog_View AS
	SELECT *
	FROM Box_SmartUnit
	WHERE time > NOW() - INTERVAL '1 day';


SELECT * FROM BoxLog_View;