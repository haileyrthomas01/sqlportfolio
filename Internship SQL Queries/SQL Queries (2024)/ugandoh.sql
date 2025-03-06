WITH Qry_OH_Primary_Miles_By_Voltage AS
(SELECT 
  CASE 
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 51 THEN '4 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 54 THEN '4 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 60 THEN '12 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 75 THEN '12 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 66 THEN '13.8 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 81 THEN '13.8 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 78 THEN '23 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 89 THEN '23 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 84 THEN '14.4 KV'
    ELSE 'Other'
  END AS Voltage,
  SUM(DISGISDB.PRIMARY_OH_EVW.LENGTH / 5280) AS "OH Miles"
FROM 
  DISGISDB.PRIMARY_OH_EVW
WHERE 
  DISGISDB.PRIMARY_OH_EVW.OWNED_BY = 'MPC'
GROUP BY 
  CASE 
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 51 THEN '4 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 54 THEN '4 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 60 THEN '12 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 75 THEN '12 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 66 THEN '13.8 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 81 THEN '13.8 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 78 THEN '23 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 89 THEN '23 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 84 THEN '14.4 KV'
    ELSE 'Other'
  END
ORDER BY 
  CASE 
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 51 THEN '4 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 54 THEN '4 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 60 THEN '12 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 75 THEN '12 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 66 THEN '13.8 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 81 THEN '13.8 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 78 THEN '23 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 89 THEN '23 KV'
    WHEN DISGISDB.PRIMARY_OH_EVW.OVOLTAGE = 84 THEN '14.4 KV'
    ELSE 'Other'
  END),

Qry_UG_Primary_Miles_By_Voltage AS
(SELECT 
  CASE 
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 51 THEN '4 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 54 THEN '4 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 60 THEN '12 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 75 THEN '12 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 66 THEN '13.8 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 81 THEN '13.8 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 78 THEN '23 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 89 THEN '23 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 84 THEN '14.4 KV'
    ELSE 'Other'
  END AS Voltage,
  SUM(DISGISDB.PRIMARY_UG_EVW.LENGTH / 5280) AS "UG Miles"
FROM 
  DISGISDB.PRIMARY_UG_EVW
WHERE 
  DISGISDB.PRIMARY_UG_EVW.OWNED_BY = 'MPC'
GROUP BY 
  CASE 
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 51 THEN '4 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 54 THEN '4 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 60 THEN '12 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 75 THEN '12 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 66 THEN '13.8 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 81 THEN '13.8 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 78 THEN '23 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 89 THEN '23 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 84 THEN '14.4 KV'
    ELSE 'Other'
  END
HAVING 
  SUM(DISGISDB.PRIMARY_UG_EVW.LENGTH / 5280) > 0
ORDER BY 
  CASE 
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 51 THEN '4 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 54 THEN '4 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 60 THEN '12 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 75 THEN '12 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 66 THEN '13.8 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 81 THEN '13.8 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 78 THEN '23 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 89 THEN '23 KV'
    WHEN DISGISDB.PRIMARY_UG_EVW.OVOLTAGE = 84 THEN '14.4 KV'
    ELSE 'Other'
  END)

SELECT 
    Qry_OH_Primary_Miles_By_Voltage.Voltage, 
    Qry_OH_Primary_Miles_By_Voltage."OH Miles", 
    Qry_UG_Primary_Miles_By_Voltage."UG Miles", 
    Qry_OH_Primary_Miles_By_Voltage."OH Miles" + Qry_UG_Primary_Miles_By_Voltage."UG Miles" AS "Total Circuit Miles"
FROM 
    Qry_UG_Primary_Miles_By_Voltage
    RIGHT JOIN Qry_OH_Primary_Miles_By_Voltage 
    ON Qry_UG_Primary_Miles_By_Voltage.Voltage = Qry_OH_Primary_Miles_By_Voltage.Voltage;