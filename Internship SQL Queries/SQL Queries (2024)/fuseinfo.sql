SELECT
    fuse_evw.objectid,
    fuse_evw.type,
    fuse_evw.voltage,
    fuse_evw.feederid,
    fuse_evw.phases,
    fuse_evw.owned_by,
    decode(fuse_evw.org_id, 'ascst', 'Coast', 'ashttb', 'Pine Belt',
           'asmrd', 'Meridian') AS division
FROM
    fuse_evw
ORDER BY
    division
