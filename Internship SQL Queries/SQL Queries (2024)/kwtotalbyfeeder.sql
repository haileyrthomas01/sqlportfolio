    SELECT GENERATOR_EVW.FEEDERID, Sum(GENERATOR_EVW.ACTIVE_GEN_KW) AS "KW Total"
    FROM GENERATOR_EVW
    WHERE (((GENERATOR_EVW.FACILITY_STATUS)='E') AND ((GENERATOR_EVW.GEN_TYPE)='S') AND ((GENERATOR_EVW.SUBTYPECD)=112))
    GROUP BY GENERATOR_EVW.FEEDERID
    HAVING (((GENERATOR_EVW.FEEDERID) != 'KC'))
    ORDER BY GENERATOR_EVW.FEEDERID
