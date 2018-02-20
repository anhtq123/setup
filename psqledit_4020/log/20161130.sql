-- psqledit log file
-- date: 2016-11-30

--kosyo2@172.20.0.137:5432.kosyo2 13:49:44
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,
					   tk.kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code IN ('25','26','27','28','29','30') 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				INNER JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 13:51:09
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code IN ('25','26','27','28','29','30') 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				INNER JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:00:09
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,tk.kyoten_area 
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code ='27' 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				LEFT JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code
				WHERE tb.build_code is null 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:01:00
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code ='27' 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				INNER JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:02:02
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,
                       tk.kyoten_area 
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code ='27' 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				LEFT JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code
				WHERE tb.build_code is null 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:02:24
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code ='27' 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				LEFT JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code
				WHERE tb.build_code is null 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:03:04
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code ='27' 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				LEFT JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code
				WHERE tb.build_code is null 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:03:09
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code ='27' 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				INNER JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:03:31
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,
                       tk.kyoten_area 
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code ='27' 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				LEFT JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code
				--WHERE tb.build_code is null 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:11:48
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code ='27' 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				INNER JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:12:59
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   --tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code ='27' 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				INNER JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:53:18
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehaikanri_id=73;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:54:19
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehaikanri_id=112;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:54:34
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehaikanri_id=112
order by tehai_id, eda_no;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:55:18
select tehaikanri_id, tehai_id, eda_no, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid, timezone_code, kubun, 
	kikan_naiyou
from tehaisaki
where tehaikanri_id=112
order by tehai_id, eda_no;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:56:04
select tehaikanri_id, tehai_id, eda_no,kubun, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid, timezone_code,  
	kikan_naiyou
from tehaisaki
where tehaikanri_id=112
order by tehai_id, eda_no;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:56:46
select tehaikanri_id, tehai_id, eda_no,kubun, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid, timezone_code,  
	kikan_naiyou
from tehaisaki
where tehaikanri_id=112
order by tehai_id, eda_no;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 17:17:50
select tehaikanri_id, tehai_id, eda_no,kubun, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid, timezone_code,  
	kikan_naiyou
from tehaisaki
where tehaikanri_id=98
order by tehai_id, eda_no;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:29:46
select gyoumu_kbn, gyoumu_name, service_code
from gyoumukubun
;
--/

