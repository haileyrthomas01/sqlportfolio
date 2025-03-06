SELECT 
        CASE 
        WHEN POLE_EVW.ORG_ID = 'ascst' THEN 'Coast'
        WHEN POLE_EVW.ORG_ID = 'ashttb' THEN 'Pinebelt'
        WHEN POLE_EVW.ORG_ID = 'asmrd' THEN 'Meridian'
        ELSE 'Other'
    END AS "Division", 
    Count(POLE_EVW.OBJECTID) AS "Count"
FROM POLE_EVW
WHERE (((POLE_EVW.POLE_USE)='FDIST') AND ((POLE_EVW.OWNED_BY)='ATT')) 
OR (((POLE_EVW.POLE_USE)='FDIST') AND ((POLE_EVW.OWNED_BY)='MPC'))
GROUP BY POLE_EVW.ORG_ID
ORDER BY POLE_EVW.ORG_ID;
