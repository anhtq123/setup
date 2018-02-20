-- psqledit log file
-- date: 2017-04-12

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:25:36
select * 
from tehaisakikanri 
where kyoten_area ='' and
service_code = (select service_code from tehaisakikanri where tehaikanri_id = 1) and
fuken_code = (select fuken_code from tehaisakikanri where tehaikanri_id = 1)
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:26:01
select * 
from tehaisakikanri 
where kyoten_area =' ‰êQê—pQ‚P' and
service_code = (select service_code from tehaisakikanri where tehaikanri_id = 1) and
fuken_code = (select fuken_code from tehaisakikanri where tehaikanri_id = 1)
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:27:26
select tehaikanri_id 
from tehaisakikanri 
where kyoten_area =' ‰êQê—pQ‚P' and
service_code = (select service_code from tehaisakikanri where tehaikanri_id = 1) and
fuken_code = (select fuken_code from tehaisakikanri where tehaikanri_id = 1)
;
--/

