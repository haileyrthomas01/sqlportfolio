WITH Division_Subs_Feeders AS 
(
    SELECT 
        CASE 
            WHEN DISGISDB.SUBSTATION_EVW.ORG_ID = 'ascst' THEN 'Coast'
            WHEN DISGISDB.SUBSTATION_EVW.ORG_ID = 'ashttb' THEN 'PineBelt'
            WHEN DISGISDB.SUBSTATION_EVW.ORG_ID = 'asmrd' THEN 'Meridian'
            ELSE 'Other'
        END AS Division,
        DISGISDB.SUBSTATION_EVW.SUBSTATION_NAME,
        DISGISDB.GETAWAY_EVW.FEEDERID
    FROM 
        DISGISDB.GETAWAY_EVW 
        INNER JOIN DISGISDB.SUBUNIT_EVW ON DISGISDB.GETAWAY_EVW.SUBUNIT_GLOBALID = DISGISDB.SUBUNIT_EVW.GLOBALID
        INNER JOIN DISGISDB.SUBSTATION_EVW ON DISGISDB.SUBUNIT_EVW.SUBSTATION_GLOBALID = DISGISDB.SUBSTATION_EVW.GLOBALID
    WHERE 
        DISGISDB.GETAWAY_EVW.LAST_WE = 'N'
),
Qry_Solar_KW_Total_By_Feeder AS
(
    SELECT 
        DISGISDB.GENERATOR_EVW.FEEDERID, 
        Sum(DISGISDB.GENERATOR_EVW.ACTIVE_GEN_KW) AS "KW Total"
    FROM 
        DISGISDB.GENERATOR_EVW
    WHERE 
        DISGISDB.GENERATOR_EVW.FACILITY_STATUS = 'E' 
        AND DISGISDB.GENERATOR_EVW.GEN_TYPE = 'S' 
        AND DISGISDB.GENERATOR_EVW.SUBTYPECD = 112
    GROUP BY 
        DISGISDB.GENERATOR_EVW.FEEDERID
    HAVING 
        DISGISDB.GENERATOR_EVW.FEEDERID != 'KC'
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