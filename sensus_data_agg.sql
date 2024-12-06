USE sensus_survey;

# Get all fields for each participant.
SELECT *
	FROM survey_result AS S
    GROUP BY S.participant_id;

# Query 1
SELECT S.participant_id, MIN(S.Timestamp) AS first_timestamp, MAX(S.Timestamp) AS last_timestamp
	FROM survey_result AS S
    GROUP BY S.participant_id;
    
# Query 2
SELECT S.participant_id, COUNT(S.Activity)
	FROM survey_result AS S
    WHERE S.Activity IS NOT NULL
    GROUP BY S.participant_id;

SELECT S.participant_id, COUNT(S.Decibels)
	FROM survey_result AS S
    WHERE S.Activity IS NOT NULL
    GROUP BY S.participant_id;

SELECT S.participant_id, COUNT(S.Longitude)
	FROM survey_result AS S
    WHERE S.Activity IS NOT NULL
    GROUP BY S.participant_id;
    
SELECT S.participant_id, COUNT(S.BatteryLevel)
	FROM survey_result AS S
    WHERE S.Activity IS NOT NULL
    GROUP BY S.participant_id;

SELECT S.participant_id, COUNT(S.AccessPointBSSID)
	FROM survey_result AS S
    WHERE S.Activity IS NOT NULL
    GROUP BY S.participant_id;
    
# Query 3
    
SELECT S.participant_id, S.Activity, COUNT(S.Activity) AS act_count
	FROM survey_result AS S
	WHERE S.Activity IS NOT NULL AND act_count >= (SELECT COUNT(S2.Activity)
									FROM survey_result AS S2
                                    WHERE S2.participant_id = S.participant_id
                                    GROUP BY S2.participant_id, S2.Activity)
    GROUP BY S.participant_id, S.Activity;
    
# Query 4

SELECT S.participant_id, S.Timestamp, S.BatteryLevel
	FROM survey_result AS S
    ORDER BY S.participant_id;