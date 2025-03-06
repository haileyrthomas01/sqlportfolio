select capacitor_evw.loc_num as all_loc_num, capacitor_evw.feederid as all_feederid, capacitor_evw.objectid as all_objectid, 'Capacitor' as device from capacitor_evw
union all
select recloser_evw.loc_num as all_loc_num, recloser_evw.feederid as all_feederid, recloser_evw.objectid as all_objectid, 'Recloser' as device from recloser_evw
union all
select sectionalizer_evw.loc_num as all_loc_num, sectionalizer_evw.feederid as all_feederid, sectionalizer_evw.objectid as all_objectid, 'Sectionalizer' as device from sectionalizer_evw
union all
select switch_evw.loc_num as all_loc_num, switch_evw.feederid as all_feederid, switch_evw.objectid as all_objectid, 'Switch' as device from switch_evw
union all
select fuse_evw.loc_num as all_loc_num, fuse_evw.feederid as all_feederid, fuse_evw.objectid as all_objectid, 'Fuse' as device from fuse_evw
order by all_loc_num, device
