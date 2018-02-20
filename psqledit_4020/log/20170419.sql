-- psqledit log file
-- date: 2017-04-19

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:40:23
select service_code, service_name, tempfile_name, mail, add_date, 
	add_userid, upd_date, upd_userid
from service_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:00:49
select id, code, naiyo, bikou
from code_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:25:26
select irai_id, title, naiyou, upd_naiyou, kigen, soshiki_id, 
	irai_houhou, service_code, timezone_code, kubun, send_houhou, 
	send_date, send_time, status, status_upd_dt, add_date, add_userid, 
	upd_date, upd_userid
from work_irai
;
--/

