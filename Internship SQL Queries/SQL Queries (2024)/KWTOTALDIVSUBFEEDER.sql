WITH Division_Subs_Feeders AS 
(
    SELECT 
        CASE 
            WHEN SUBSTATION_EVW.ORG_ID = 'ascst' THEN 'Coast'
            WHEN SUBSTATION_EVW.ORG_ID = 'ashttb' THEN 'PineBelt'
            WHEN SUBSTATION_EVW.ORG_ID = 'asmrd' THEN 'Meridian'
            ELSE 'Other'
        END AS Division,
        SUBSTATION_EVW.SUBSTATION_NAME,
        GETAWAY_EVW.FEEDERID
    FROM 
        GETAWAY_EVW 
        INNER JOIN SUBUNIT_EVW ON GETAWAY_EVW.SUBUNIT_GLOBALID = SUBUNIT_EVW.GLOBALID
        INNER JOIN SUBSTATION_EVW ON SUBUNIT_EVW.SUBSTATION_GLOBALID = SUBSTATION_EVW.GLOBALID
    WHERE 
        GETAWAY_EVW.LAST_WE = 'N'
),
Qry_Solar_KW_Total_By_Feeder AS
(
    SELECT 
        GENERATOR_EVW.FEEDERID, 
        Sum(GENERATOR_EVW.ACTIVE_GEN_KW) AS "KW Total"
    FROM 
        GENERATOR_EVW
    WHERE 
        GENERATOR_EVW.FACILITY_STATUS = 'E' 
        AND GENERATOR_EVW.GEN_TYPE = 'S' 
        AND GENERATOR_EVW.SUBTYPECD = 112
    GROUP BY 
        GENERATOR_EVW.FEEDERID
    HAVING 
        GENERATOR_EVW.FEEDERID != 'KC'
)
SELECT 
    Division_Subs_Feeders.Division, 
    Division_Subs_Feeders.SUBSTATION_NAME, 
    Division_Subs_Feeders.FEEDERID, 
    Qry_Solar_KW_Total_By_Feeder."KW Total" AS Solar_KW_Total
FROM 
    Division_Subs_Feeders 
    LEFT JOIN Qry_Solar_KW_Total_By_Feeder ON Division_Subs_Feeders.FEEDERID = Qry_Solar_KW_Total_By_Feeder.FEEDERID
ORDER BY 
    Division_Subs_Feeders.Division ASC, 
    Division_Subs_Feeders.SUBSTATION_NAME ASC, 
    Division_Subs_Feeders.FEEDERID ASC;
