WITH Attachments_With_Pole_Table_Link AS (
    SELECT ATTACH_OBJ_EVW.OBJECTID AS "Attach OBJ ObjectID", 
    ATTACH_OBJ_EVW.OWNED_BY AS "Attachment Owner", 
    ATTACH_OBJ_EVW.TYPE AS "Attachment Type", 
    POLE_EVW.OBJECTID AS "Pole ObjectID", 
    POLE_EVW.OWNED_BY AS "Pole Owner", 
    POLE_EVW.POLE_USE, 
    POLE_EVW.ORG_ID, 
    ATTACH_OBJ_EVW.QUANTITY, 
    POLE_EVW.COUNTY
    FROM ATTACH_OBJ_EVW LEFT JOIN POLE_EVW ON ATTACH_OBJ_EVW.POLE_GUID = POLE_EVW.GLOBALID
    ORDER BY ATTACH_OBJ_EVW.OBJECTID)
    
SELECT 
        CASE 
        WHEN Attachments_With_Pole_Table_Link.ORG_ID = 'ascst' THEN 'Coast'
        WHEN Attachments_With_Pole_Table_Link.ORG_ID = 'ashttb' THEN 'Pinebelt'
        WHEN Attachments_With_Pole_Table_Link.ORG_ID = 'asmrd' THEN 'Meridian'
        ELSE 'Other'
    END AS "Division", 
    Attachments_With_Pole_Table_Link."Pole ObjectID", 
    Attachments_With_Pole_Table_Link."Pole Owner", 
    Attachments_With_Pole_Table_Link.POLE_USE, 
    Count(Attachments_With_Pole_Table_Link."Attach OBJ ObjectID") AS CountOfAttach_OBJ_ObjectID
FROM Attachments_With_Pole_Table_Link
GROUP BY Attachments_With_Pole_Table_Link.ORG_ID, Attachments_With_Pole_Table_Link."Pole ObjectID", Attachments_With_Pole_Table_Link."Pole Owner", Attachments_With_Pole_Table_Link.POLE_USE
HAVING (((Attachments_With_Pole_Table_Link."Pole Owner")='MPC') AND ((Attachments_With_Pole_Table_Link.POLE_USE)='DIST') AND ((Count(Attachments_With_Pole_Table_Link."Attach OBJ ObjectID"))=1))
ORDER BY Attachments_With_Pole_Table_Link.ORG_ID, Attachments_With_Pole_Table_Link."Pole ObjectID";
