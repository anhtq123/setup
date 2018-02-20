-- psqledit log file
-- date: 2017-01-25

--kosyo2@172.20.0.137:5432.kosyo2_20170119 10:21:49
select irai_id, title, naiyou, upd_naiyou, kigen, soshiki_id, 
	irai_houhou, service_code, timezone_code, kubun, send_houhou, 
	send_date, send_time, status, status_upd_dt, add_date, add_userid, 
	upd_date, upd_userid
from work_irai
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 10:27:19
select irai_id, soshiki_id, seq_no, status, status_upd_dt, add_date, 
	add_userid, upd_date, upd_userid
from work_irai_req
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 10:46:25
select irai_id, soshiki_id, seq_no, status, status_upd_dt, add_date, 
	add_userid, upd_date, upd_userid
from work_irai_req
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 10:47:02
select irai_id, title, naiyou, upd_naiyou, kigen, soshiki_id, 
	irai_houhou, service_code, timezone_code, kubun, send_houhou, 
	send_date, send_time, status, status_upd_dt, add_date, add_userid, 
	upd_date, upd_userid
from work_irai;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 10:55:50
select log_id, log_kubun, user_id, access_date, access_time, 
	access_screen, action, action_keydata, last_update
from t_log
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 10:56:20
select log_id, log_kubun, user_id, access_date, access_time, 
	access_screen, action, action_keydata, last_update
from t_log
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 10:58:22
select irai_id, soshiki_id, seq_no, status, status_upd_dt, add_date, 
	add_userid, upd_date, upd_userid
from work_irai_req;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 10:59:17
select irai_id, soshiki_id, seq_no, status, status_upd_dt, add_date, 
	add_userid, upd_date, upd_userid
from work_irai_req;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 10:59:30
UPDATE work_irai_req SET status=12,  status_upd_dt='2017-01-25 10:57:30', upd_date='2017-01-25 10:57:30', upd_userid='kanri1' WHERE irai_id=3 AND soshiki_id=372;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 10:59:39
select irai_id, soshiki_id, seq_no, status, status_upd_dt, add_date, 
	add_userid, upd_date, upd_userid
from work_irai_req;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 11:50:24
select err_id, err_date, kubun, naiyou, upd_date, upd_userid, del_flg
from err_info
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 11:50:27
select err_id, err_date, kubun, naiyou, upd_date, upd_userid, del_flg
from err_info
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 13:36:53
SELECT DISTINCT user_mail 
						FROM user_mst 
						WHERE soshiki_id=4;
--/

