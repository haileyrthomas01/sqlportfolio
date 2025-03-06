select
    sum(customers) as "Number of Customers on Automated Circuits"

from 
    customer_count

where
    feederid in (
        select *
        from (
            -- Capacitors
            select 
                capacitor_evw.feederid
            from 
                capacitor_evw
            where 
                capacitor_evw.owned_by = 'MPC' 
                and capacitor_evw.dagroup_globalid is NOT NULL
                and capacitor_evw.feederid Not In ('KC','S2546','S2566','S2576')
            UNION ALL
            -- Reclosers
            select 
                recloser_evw.feederid
            from
                recloser_evw
            where
                recloser_evw.subtypecd = '105'
                and recloser_evw.owned_by = 'MPC' 
                and recloser_evw.facility_status = 'E'
                and recloser_evw.dagroup_globalid is NOT NULL
                and recloser_evw.feederid Not In ('KC','S2546','S2566','S2576')
            UNION ALL
            -- Regulators
            select 
                regulator_evw.feederid
            from
                regulator_evw
            where
                regulator_evw.owned_by = 'MPC' 
                and regulator_evw.facility_status = 'E'
                and regulator_evw.dagroup_globalid is NOT NULL
                and regulator_evw.feederid Not In ('KC','S2546','S2566','S2576')
            UNION ALL
            -- Switch Gears
            select 
                switch_evw.feederid
            from
                switch_evw
            where
                switch_evw.dagroup_globalid is NOT NULL))
            and subtypedesc = 'Getaway'
