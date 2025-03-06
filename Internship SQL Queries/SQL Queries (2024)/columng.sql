WITH Attachments_With_Pole_Table_Link AS (
    SELECT DISGISDB.ATTACH_OBJ_EVW.OBJECTID AS "Attach OBJ ObjectID", 
    DISGISDB.ATTACH_OBJ_EVW.OWNED_BY AS "Attachment Owner", 
    DISGISDB.ATTACH_OBJ_EVW.TYPE AS "Attachment Type", 
    DISGISDB.POLE_EVW.OBJECTID AS "Pole ObjectID", 
    DISGISDB.POLE_EVW.OWNED_BY AS "Pole Owner", 
    DISGISDB.POLE_EVW.POLE_USE, 
    DISGISDB.POLE_EVW.ORG_ID, 
    DISGISDB.ATTACH_OBJ_EVW.QUANTITY, 
    DISGISDB.POLE_EVW.COUNTY
    FROM DISGISDB.ATTACH_OBJ_EVW LEFT JOIN DISGISDB.POLE_EVW ON DISGISDB.ATTACH_OBJ_EVW.POLE_GUID = DISGISDB.POLE_EVW.GLOBALID
    ORDER BY DISGISDB.ATTACH_OBJ_EVW.OBJECTID),
    
    Poles_with_One_Attachment AS (
    SELECT Attachments_With_Pole_Table_Link.ORG_ID, 
        Attachments_With_Pole_Table_Link."Pole ObjectID", 
        Attachments_With_Pole_Table_Link."Pole Owner", 
        Attachments_With_Pole_Table_Link.POLE_USE, 
        Count(Attachments_With_Pole_Table_Link."Attach OBJ ObjectID") AS CountOfAttach_OBJ_ObjectID
    FROM Attachments_With_Pole_Table_Link
    GROUP BY Attachments_With_Pole_Table_Link.ORG_ID, Attachments_With_Pole_Table_Link."Pole ObjectID", Attachments_With_Pole_Table_Link."Pole Owner", Attachments_With_Pole_Table_Link.POLE_USE
    HAVING (((Attachments_With_Pole_Table_Link."Pole Owner")='MPC') AND ((Attachments_With_Pole_Table_Link.POLE_USE)='DIST') AND ((Count(Attachments_With_Pole_Table_Link."Attach OBJ ObjectID"))=1))
    ORDER BY Attachments_With_Pole_Table_Link.ORG_ID, Attachments_With_Pole_Table_Link."Pole ObjectID")
    
SELECT
        CASE 
        WHEN Poles_with_One_Attachment.ORG_ID = 'ascst' THEN 'Coast'
        WHEN Poles_with_One_Attachment.ORG_ID = 'ashttb' THEN 'Pinebelt'
        WHEN Poles_with_One_Attachment.ORG_ID = 'asmrd' THEN 'Meridian'
        ELSE 'Other'
    END AS "Division", 
    Attachments_With_Pole_Table_Link."Attachment Type", 
    Attachments_With_Pole_Table_Link."Attachment Owner", 
    Count(Poles_with_One_Attachment.CountOfAttach_OBJ_ObjectID) AS "Count"
FROM Poles_with_One_Attachment INNER JOIN Attachments_With_Pole_Table_Link ON Poles_with_One_Attachment."Pole ObjectID" = Attachments_With_Pole_Table_Link."Pole ObjectID"
GROUP BY Poles_with_One_Attachment.ORG_ID, Attachments_With_Pole_Table_Link."Attachment Type", Attachments_With_Pole_Table_Link."Attachment Owner"
HAVING (((Poles_with_One_Attachment.ORG_ID) Is Not Null) AND ((Attachments_With_Pole_Table_Link."Attachment Type")='TEL') AND ((Attachments_With_Pole_Table_Link."Attachment Owner")='ATT'));