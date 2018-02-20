-- psqledit log file
-- date: 2017-06-09

--postgres@172.20.0.137:5432.kosyo_tool_step3 15:07:41
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 15:09:36
update user_mst
set user_password='c6922b6ba9e0939583f973bc1682493351ad4fe8'
where user_id='9999999'
--22067cb54a7b24764186f1e48cb4586772733cd7;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 15:09:57
update user_mst
set user_password='22067cb54a7b24764186f1e48cb4586772733cd7'
where user_id='9999999'
--22067cb54a7b24764186f1e48cb4586772733cd7;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 15:10:27
select log_id, log_kubun, user_id, access_date, access_time, 
	access_screen, action, action_keydata, last_update
from t_log
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 15:10:37
select log_id, log_kubun, user_id, access_date, access_time, 
	access_screen, action, action_keydata, last_update
from t_log
order by log_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 16:18:53
select log_id, log_kubun, user_id, access_date, access_time, 
	access_screen, action, action_keydata, last_update
from t_log

order by log_id desc;
--/

