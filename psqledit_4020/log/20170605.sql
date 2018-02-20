-- psqledit log file
-- date: 2017-06-05

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:37:48
select log_id, log_kubun, user_id, access_date, access_time, 
	access_screen, action, action_keydata, last_update
from t_log
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:38:02
select log_id, log_kubun, user_id, access_date, access_time, 
	access_screen, action, action_keydata, last_update
from t_log
order by log_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:40:17
select log_id, log_kubun, user_id, access_date, access_time, 
	access_screen, action, action_keydata, last_update
from t_log
order by log_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:40:35
select log_id, log_kubun, user_id, access_date, access_time, 
	access_screen, action, action_keydata, last_update
from t_log
order by log_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 13:18:03
select tanto_id, tel_id, telno
from tanto_tel
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 14:16:25
select tanto_id, kaisya_id, soshiki_id, tanto_name, yakusyoku_code, 
	add_date, add_userid, upd_date, upd_userid
from tanto_mst
where tanto_id=736;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 16:38:45
select gyoumu_kbn, gyoumu_name, service_code
from gyoumukubun
;
--/

