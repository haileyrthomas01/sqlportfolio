SELECT
    disgisdb.fuse_evw.objectid,
    disgisdb.fuse_evw.type,
    disgisdb.fuse_evw.voltage,
    disgisdb.fuse_evw.feederid,
    disgisdb.fuse_evw.phases,
    disgisdb.fuse_evw.owned_by,
    decode(disgisdb.fuse_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division
FROM
    disgisdb.fuse_evw
ORDER BY
    division