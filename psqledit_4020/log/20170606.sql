-- psqledit log file
-- date: 2017-06-06

--postgres@172.20.0.137:5432.kosyo_tool_step3 09:00:16
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 09:00:57
update user_mst set user_password='c6922b6ba9e0939583f973bc1682493351ad4fe8';
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 09:01:07
update user_mst set user_password='c6922b6ba9e0939583f973bc1682493351ad4fe8';
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 09:01:36
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 09:02:45
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
where user_id='5715015'
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 09:03:19
update user_mst set user_password='c6922b6ba9e0939583f973bcss1682493351ad4fe8'
where user_id='5715015';
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 09:03:41
update user_mst set user_password='c6922b6ba9e0939583f973bc1682493351ad4fe8'
where user_id='5715015';
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 09:03:52
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
where user_id='5715015';
--/

