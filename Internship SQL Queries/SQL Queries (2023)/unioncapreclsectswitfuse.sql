select disgisdb.capacitor_evw.loc_num as all_loc_num, disgisdb.capacitor_evw.feederid as all_feederid, disgisdb.capacitor_evw.objectid as all_objectid, 'Capacitor' as device from disgisdb.capacitor_evw
union all
select disgisdb.recloser_evw.loc_num as all_loc_num, disgisdb.recloser_evw.feederid as all_feederid, disgisdb.recloser_evw.objectid as all_objectid, 'Recloser' as device from disgisdb.recloser_evw
union all
select disgisdb.sectionalizer_evw.loc_num as all_loc_num, disgisdb.sectionalizer_evw.feederid as all_feederid, disgisdb.sectionalizer_evw.objectid as all_objectid, 'Sectionalizer' as device from disgisdb.sectionalizer_evw
union all
select disgisdb.switch_evw.loc_num as all_loc_num, disgisdb.switch_evw.feederid as all_feederid, disgisdb.switch_evw.objectid as all_objectid, 'Switch' as device from disgisdb.switch_evw
union all
select disgisdb.fuse_evw.loc_num as all_loc_num, disgisdb.fuse_evw.feederid as all_feederid, disgisdb.fuse_evw.objectid as all_objectid, 'Fuse' as device from disgisdb.fuse_evw
order by all_loc_num, device