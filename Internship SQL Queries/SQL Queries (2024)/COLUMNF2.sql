WITH List_of_Poles_with_2_or_more_attachments AS (
    SELECT POLE_EVW.ORG_ID, 
    POLE_EVW.OBJECTID, 
    Count(ATTACH_OBJ_EVW.TYPE) AS "Count per Pole"
    FROM ATTACH_OBJ_EVW 
    INNER JOIN POLE_EVW ON ATTACH_OBJ_EVW.POLE_GUID = POLE_EVW.GLOBALID
    WHERE (((POLE_EVW.POLE_USE)='DIST') AND ((POLE_EVW.OWNED_BY)='MPC'))
    GROUP BY POLE_EVW.ORG_ID, POLE_EVW.OBJECTID
    HAVING (((Count(ATTACH_OBJ_EVW.TYPE))>=2)))
    
SELECT 
        CASE 
        WHEN List_of_Poles_with_2_or_more_attachments.ORG_ID = 'ascst' THEN 'Coast'
        WHEN List_of_Poles_with_2_or_more_attachments.ORG_ID = 'ashttb' THEN 'Pinebelt'
        WHEN List_of_Poles_with_2_or_more_attachments.ORG_ID = 'asmrd' THEN 'Meridian'
        ELSE 'Other'
    END AS "Division", 
    Count(List_of_Poles_with_2_or_more_attachments.OBJECTID) AS "Count"
FROM List_of_Poles_with_2_or_more_attachments
WHERE (List_of_Poles_with_2_or_more_attachments."Count per Pole") >=2
GROUP BY List_of_Poles_with_2_or_more_attachments.ORG_ID
ORDER BY List_of_Poles_with_2_or_more_attachments.ORG_ID;
