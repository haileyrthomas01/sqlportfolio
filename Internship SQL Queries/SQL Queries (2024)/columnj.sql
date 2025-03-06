WITH Others_attached AS (
    SELECT POLE_EVW.ORG_ID, 
    ATTACH_OBJ_EVW.TYPE, 
    ATTACH_OBJ_EVW.OWNED_BY AS "Attachment Owner", 
    Count(ATTACH_OBJ_EVW.OBJECTID) AS "Count", 
    POLE_EVW.OWNED_BY, 
    POLE_EVW.POLE_USE
    FROM ATTACH_OBJ_EVW 
    INNER JOIN POLE_EVW ON ATTACH_OBJ_EVW.POLE_GUID = POLE_EVW.GLOBALID
    GROUP BY POLE_EVW.ORG_ID, ATTACH_OBJ_EVW.TYPE, ATTACH_OBJ_EVW.OWNED_BY, POLE_EVW.OWNED_BY, POLE_EVW.POLE_USE
    HAVING (((ATTACH_OBJ_EVW.TYPE) != 'CTV') AND ((ATTACH_OBJ_EVW.OWNED_BY) != 'ATT' And (ATTACH_OBJ_EVW.OWNED_BY) Is Not Null) AND ((POLE_EVW.OWNED_BY)='MPC') AND ((POLE_EVW.POLE_USE)='DIST'))
    ORDER BY POLE_EVW.ORG_ID)
    
SELECT 
        CASE 
        WHEN Others_attached.ORG_ID = 'ascst' THEN 'Coast'
        WHEN Others_attached.ORG_ID = 'ashttb' THEN 'Pinebelt'
        WHEN Others_attached.ORG_ID = 'asmrd' THEN 'Meridian'
        ELSE 'Other'
    END AS "Division", 
    Sum(Others_attached."Count") AS "SumOfCount"
FROM Others_attached
GROUP BY Others_attached.ORG_ID
ORDER BY Others_attached.ORG_ID;
