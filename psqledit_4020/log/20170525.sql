-- psqledit log file
-- date: 2017-05-25

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:13:56
SELECT count(tehai_id) count
				FROM tehaisaki
				WHERE tehaikanri_id = 1
				  AND timezone_code = '2'
				  AND gyoumu_kbn = '2';
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:14:17
SELECT *
				FROM tehaisaki
				WHERE tehaikanri_id = 1
				  AND timezone_code = '2'
				  AND gyoumu_kbn = '2';
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:39:02
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:54:47
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=3838
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:54:50
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=3838
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:54:51
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:04:33
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:04:47
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
order by tehai_id desc
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:06:06
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
order by tehai_id desc
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:22:37
select tehai_id, eda_num, soshiki_id, disp_flg, tel_id, fax_id, 
	add_date, add_userid, upd_date, upd_userid
from tehaisaki_soshiki
;
--/

