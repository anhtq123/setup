-- psqledit log file
-- date: 2016-12-19

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:38:23
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:38:35
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:38:55
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:43:09
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:44:20
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst

where
soshiki_code like '0304%';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:47:20
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:47:34
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst

where
soshiki_code like '0304%';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:47:40
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:48:20
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:49:50
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:59:35
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:00:39
SELECT sm.soshiki_id,
					   sm.kaisya_id,
					   sm.soshiki_code,
					   sm.level,
					   km.kaisya_name,
					   sm.soshiki_name,
					   sm.menbers_net,
					   sm.zipcode,
					   sm.addr,
					   sm.mail,
					   array_to_string(ARRAY
										 (SELECT telno
										  FROM soshiki_tel st
										  WHERE st.soshiki_id = sm.soshiki_id), ',') tel,
					   array_to_string(ARRAY
										 (SELECT faxno
										  FROM soshiki_fax sf
										  WHERE sf.soshiki_id = sm.soshiki_id), ',') fax,
					   CASE
						   WHEN length(s2.soshiki_code) > 1 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=sm.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=351 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:00:48
SELECT sm.soshiki_id,
					   sm.kaisya_id,
					   sm.soshiki_code,
					   sm.level,
					   km.kaisya_name,
					   sm.soshiki_name,
					   sm.menbers_net,
					   sm.zipcode,
					   sm.addr,
					   sm.mail,
					   array_to_string(ARRAY
										 (SELECT telno
										  FROM soshiki_tel st
										  WHERE st.soshiki_id = sm.soshiki_id), ',') tel,
					   array_to_string(ARRAY
										 (SELECT faxno
										  FROM soshiki_fax sf
										  WHERE sf.soshiki_id = sm.soshiki_id), ',') fax,
					   CASE
						   WHEN length(s2.soshiki_code) > 1 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=sm.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=367;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:00:57
SELECT sm.soshiki_id,
					   sm.kaisya_id,
					   sm.soshiki_code,
					   sm.level,
					   km.kaisya_name,
					   sm.soshiki_name,
					   sm.menbers_net,
					   sm.zipcode,
					   sm.addr,
					   sm.mail,
					   array_to_string(ARRAY
										 (SELECT telno
										  FROM soshiki_tel st
										  WHERE st.soshiki_id = sm.soshiki_id), ',') tel,
					   array_to_string(ARRAY
										 (SELECT faxno
										  FROM soshiki_fax sf
										  WHERE sf.soshiki_id = sm.soshiki_id), ',') fax,
					   CASE
						   WHEN length(s2.soshiki_code) > 1 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=sm.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=366;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:03:01
SELECT sm.soshiki_id,
					   sm.kaisya_id,
					   sm.soshiki_code,
					   sm.level,
					   km.kaisya_name,
					   sm.soshiki_name,
					   sm.menbers_net,
					   sm.zipcode,
					   sm.addr,
					   sm.mail,
					   array_to_string(ARRAY
										 (SELECT telno
										  FROM soshiki_tel st
										  WHERE st.soshiki_id = sm.soshiki_id), ',') tel,
					   array_to_string(ARRAY
										 (SELECT faxno
										  FROM soshiki_fax sf
										  WHERE sf.soshiki_id = sm.soshiki_id), ',') fax,
					   CASE
						   WHEN length(s2.soshiki_code) > 1 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE soshiki_code=s2.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=366;
--/

