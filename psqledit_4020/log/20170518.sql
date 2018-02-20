-- psqledit log file
-- date: 2017-05-18

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:27:14
select id, code, naiyo, bikou
from code_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:04:07
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
;
--/

