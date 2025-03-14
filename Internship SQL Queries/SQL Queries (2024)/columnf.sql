SELECT 
    CASE 
        WHEN POLE_EVW.ORG_ID = 'ascst' THEN 'Coast'
        WHEN POLE_EVW.ORG_ID = 'ashttb' THEN 'PineBelt'
        WHEN POLE_EVW.ORG_ID = 'asmrd' THEN 'Meridian'
        ELSE 'Other'
    END AS Division, 
POLE_EVW.OBJECTID, 
Count(ATTACH_OBJ_EVW.TYPE) AS "Count per Pole"
FROM ATTACH_OBJ_EVW 
INNER JOIN POLE_EVW ON ATTACH_OBJ_EVW.POLE_GUID = POLE_EVW.GLOBALID
WHERE (((POLE_EVW.POLE_USE)='DIST') AND ((POLE_EVW.OWNED_BY)='MPC'))
GROUP BY POLE_EVW.ORG_ID, POLE_EVW.OBJECTID
HAVING (((Count(ATTACH_OBJ_EVW.TYPE))>=2));
