-- psqledit log file
-- date: 2017-01-06

--kosyo2@172.20.0.137:5432.kosyo2 09:55:12
select id, code, naiyo, bikou
from code_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 09:55:34
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 09:57:07
select id, code, naiyo, bikou
from code_mst;
--/

--kosyo2@172.20.0.137:5432.kosyo2 09:59:26
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 10:41:07
select id, code, naiyo, bikou
from code_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 10:41:34
select id, code, naiyo, bikou
from code_mst;
--/

--kosyo2@172.20.0.137:5432.kosyo2 10:41:49
select id, code, naiyo, bikou
from code_mst
where id = 10 and code ='1';
--/

--kosyo2@172.20.0.137:5432.kosyo2 10:41:58
select naiyo
from code_mst
where id = 10 and code ='1';
--/

--kosyo2@172.20.0.137:5432.kosyo2 10:54:37
select naiyo
from code_mst
where id = 10 and code ='1';
--/

--kosyo2@172.20.0.137:5432.kosyo2 10:54:40
select id, code, naiyo
from code_mst
where id = 10 and code ='1';
--/

--kosyo2@172.20.0.137:5432.kosyo2 10:54:43
select id, code, naiyo, bikou
from code_mst
where id = 10 and code ='1';
--/

--kosyo2@172.20.0.137:5432.kosyo2 11:21:22
select id, code, naiyo, bikou
from code_mst;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:40:09
select id, code, naiyo, bikou
from code_mst
where id = 10 and code ='1';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:02:32
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:08:11
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:08:25
select user_id, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:10:59
UPDATE user_mst SET lock_flg = 1, upd_date = '2017-01-06 14:06:36', upd_userid = 'fukuoka01' WHERE user_id = 'fukuoka01' ;
--/

