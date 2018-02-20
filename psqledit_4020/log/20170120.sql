-- psqledit log file
-- date: 2017-01-20

--kosyo2@172.20.0.137:5432.kosyo2_20170118 10:23:27
select kaisya_id, kaisya_name, kaisya_kubun, disp_no, add_date, 
	add_userid, upd_date, upd_userid
from kaisya_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 11:35:56
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 11:36:26
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
where user_id='0034379';
--/

--kosyo2@172.20.0.137:5432.kosyo_tool 11:36:47
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
where user_id='0034379';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 11:40:51
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_id=416;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 11:42:58
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
where user_id='0034379';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 11:45:42
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
where user_id='0034379';
--/

--kosyo2@172.20.0.137:5432.kosyo_tool 11:56:38
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
where user_id='0034379';
--/

--kosyo2@172.20.0.137:5432.kosyo_tool 11:57:33
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_id=416;
--/

--kosyo2@172.20.0.137:5432.kosyo_tool 13:05:28
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
where soshiki_id=416;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 13:05:46
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
where soshiki_id=416;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 13:05:54
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 13:06:19
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
where itaku_soshiki_id=416;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 13:07:42
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_id=514;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 13:10:47
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
where itaku_soshiki_id=416;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 13:10:57
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_id=511;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 13:11:49
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
where itaku_soshiki_id=294;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 13:11:58
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
where soshiki_id=294;
--/

