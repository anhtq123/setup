-- psqledit log file
-- date: 2016-12-20

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:55:38
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

