-- psqledit log file
-- date: 2017-01-18

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:03:50
select user_id, user_password, kaisya_id, soshiki_id, user_name
from user_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:03:56
select user_id,kaisya_id, soshiki_id, user_name
from user_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:04:08
select user_id,kaisya_id, soshiki_id, user_name
from user_mst
order by soshiki_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:05:00
select user_id,kaisya_id, soshiki_id, user_name, user_mail, user_authority
from user_mst
order by soshiki_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:36:34
select user_id,kaisya_id, soshiki_id, user_name, user_mail, user_authority
from user_mst
order by soshiki_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:11:06
SELECT soshiki_id,
						  coalesce(string_agg(user_mail,'; '),'') AS user_mail,
						  coalesce(string_agg(user_authority,' '),'') AS user_authority_ls
				   FROM user_mst
				   --WHERE user_authority = '4'
                    where soshiki_id=166
				   GROUP BY kaisya_id,
							soshiki_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:11:19
SELECT soshiki_id,
						  coalesce(string_agg(user_mail,'; '),'') AS user_mail,
						  coalesce(string_agg(user_authority,' '),'') AS user_authority_ls
				   FROM user_mst
				   --WHERE 
                    where soshiki_id=166
                    and user_authority = '4'
				   GROUP BY kaisya_id,
							soshiki_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:22:37
SELECT soshiki_id,
						  coalesce(string_agg(user_mail,'; '),'') AS user_mail,
						  coalesce(string_agg(user_authority,' '),'') AS user_authority_ls
				   FROM user_mst
                    where soshiki_id=166
                    and user_authority = '4'
				   GROUP BY kaisya_id,
							soshiki_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:22:12
select user_id,kaisya_id, soshiki_id, user_name, user_mail, user_authority
from user_mst
order by soshiki_id=119;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:22:19
select user_id,kaisya_id, soshiki_id, user_name, user_mail, user_authority
from user_mst
order by soshiki_id=119;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:22:30
select user_id,kaisya_id, soshiki_id, user_name, user_mail, user_authority
from user_mst
where soshiki_id=119;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:38:39
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_name='ネットワーク本部';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:44:44
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:45:00
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
where soshiki_id=543;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:45:35
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_id=206;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:54:47
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
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:58:35
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
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
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
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:59:11
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
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=s2.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:59:12
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
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=s2.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:59:12
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
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=s2.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:59:12
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
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=s2.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:59:12
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
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=s2.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:59:13
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
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=s2.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:59:13
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
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=s2.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:59:13
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
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=s2.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 14:59:13
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
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=s2.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:01:08
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
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=s2.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id AND s2.kaisya_id = i.itaku_kaisya_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:03:33
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
										  WHERE sf.soshiki_id = sm.soshiki_id), ',') fax,s2.soshiki_code,
					   CASE
						   WHEN length(s2.soshiki_code) > 1 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=s2.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id AND s2.kaisya_id = i.itaku_kaisya_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:04:34
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
										  WHERE sf.soshiki_id = sm.soshiki_id), ',') fax,s2.soshiki_id,s2.soshiki_code,
					   CASE
						   WHEN length(s2.soshiki_code) > 1 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 2)  limit 1)
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(s2.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 4)  limit 1)
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(s2.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 6)  limit 1)
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(s2.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=substring(s2.soshiki_code
																FROM 1
																FOR 8)  limit 1)
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(s2.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE s2.kaisya_id = kaisya_id AND soshiki_code=s2.soshiki_code  limit 1)
						   ELSE ''
					   END AS level_5
				FROM soshiki_mst sm
				LEFT JOIN itakumoto_soshiki i ON i.soshiki_id = sm.soshiki_id
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id AND s2.kaisya_id = i.itaku_kaisya_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:05:43
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where kaisya_id =2;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:10:25
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
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:10:39
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
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id AND s2.kaisya_id = i.itaku_kaisya_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:10:40
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
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id AND s2.kaisya_id = i.itaku_kaisya_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:10:41
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
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id AND s2.kaisya_id = i.itaku_kaisya_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:10:41
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
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id AND s2.kaisya_id = i.itaku_kaisya_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:10:41
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
				LEFT JOIN soshiki_mst s2 ON s2.soshiki_id = i.itaku_soshiki_id AND s2.kaisya_id = i.itaku_kaisya_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = s2.kaisya_id
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:11:37
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
								   WHERE s2.kaisya_id=kaisya_id AND soshiki_code=substring(s2.soshiki_code
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
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:27:32
select user_id,kaisya_id, soshiki_id, user_name, user_mail, user_authority
from user_mst
where user_name='7407114';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:27:43
select user_id,kaisya_id, soshiki_id, user_name, user_mail, user_authority
from user_mst
where user_id='7407114';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 15:28:10
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_id=271;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 17:17:20
select user_id,kaisya_id, soshiki_id, user_name, user_mail, user_authority
from user_mst
where user_id='5707788';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 17:17:47
select user_id,kaisya_id, soshiki_id, user_name, user_mail, user_authority, user_useauthority
from user_mst
where user_id='5707788';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 17:25:00
select user_id,kaisya_id, soshiki_id, user_name, user_mail, user_authority, user_useauthority
from user_mst
where user_id='5707788';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 17:26:59
select user_id,kaisya_id, soshiki_id, user_name, user_mail, user_authority, user_useauthority, user_tel1
from user_mst
where user_id='5707788';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 17:31:30
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
								   WHERE s2.kaisya_id=kaisya_id AND soshiki_code=substring(s2.soshiki_code
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
				WHERE sm.soshiki_id=543 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 17:34:01
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
where soshiki_id=543;
--/

