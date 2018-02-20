-- psqledit log file
-- date: 2016-12-06

--kosyo2@172.20.0.137:5432.kosyo2 10:10:16
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
							WHERE t1.build_code=X.build_code), 'ÅA') kyoten_area
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
					  AND bm.build_code ='2710200101'
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

--kosyo2@172.20.0.137:5432.kosyo2 10:12:20
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
							WHERE t1.build_code=X.build_code
                                AND t2.service_code=tk.service_code), 'ÅA') kyoten_area
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
					  AND bm.build_code ='2710200101'
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

--kosyo2@172.20.0.137:5432.kosyo2 13:34:36
select kaisya_id, soshiki_id, fuken_code, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_tanto_fuken
where soshiki_id=22;
--/

--kosyo2@172.20.0.137:5432.kosyo2 13:37:03
select soshiki_id
from soshiki_mst
where kaisya_id=1 
    and soshiki_code='0103'
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 13:39:27
select kaisya_id, soshiki_id, fuken_code, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_tanto_fuken
where soshiki_id=22;
--/

--kosyo2@172.20.0.137:5432.kosyo2 13:39:36
select kaisya_id, soshiki_id, fuken_code
from soshiki_tanto_fuken
where soshiki_id=22;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:01:17
select kaisya_id, soshiki_id, block_code, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_tanto_block
where soshiki_id=152;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:01:26
select kaisya_id, soshiki_id, fuken_code
from soshiki_tanto_fuken
where soshiki_id=152;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:02:39
select kaisya_id, soshiki_id, fuken_code
from soshiki_tanto_fuken

--where soshiki_id=152
order by soshiki_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:03:12
select kaisya_id, soshiki_id, fuken_code
from soshiki_tanto_fuken

where kaisya_id=1
order by soshiki_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:04:30
select kaisya_id, soshiki_id, block_code, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_tanto_block
where soshiki_id=152;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:07:48
select kaisya_id, soshiki_id, fuken_code
from soshiki_tanto_fuken

where soshiki_id=152
order by soshiki_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:12:09
				SELECT DISTINCT
					t.tehaikanri_id,
					s.service_code,
					s.service_name,
					f.fuken_name,
					t.kyoten_area,
					t.bikou,
					array_to_string(ARRAY
                         (SELECT DISTINCT kb
                          FROM unnest(
							(SELECT string_to_array(
							  (SELECT (array_to_string(ARRAY
								 (SELECT array_to_string(ARRAY
								   (SELECT (lpad(''||gb.gyoumu_kbn, 5, '0')) || '_' || gyoumu_name
									FROM gyoumukubun gb
									WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm
								  FROM tehaisaki th
								  WHERE th.tehaikanri_id = t.tehaikanri_id), 'Å^'))),'Å^'))) AS kb
                          ORDER BY kb),'Å^') AS gyou_kbn
				FROM tehaisakikanri t
				JOIN service_mst s ON t.service_code = s.service_code
				JOIN block_mst bm ON bm.block_code = t.block_code
				JOIN fuken_mst f ON t.fuken_code = f.fuken_code 
				LEFT JOIN tehaisaki th ON th.tehaikanri_id = t.tehaikanri_id
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num 
				LEFT JOIN soshiki_mst sm1 ON sm1.soshiki_id = th.syukan_soshiki
				LEFT JOIN soshiki_mst sm2 ON sm2.soshiki_id = ts.soshiki_id 
				WHERE 1=1  AND (th.syukan_soshiki IN
								(SELECT shm.soshiki_id
								 FROM soshiki_mst shm
									WHERE shm.soshiki_code LIKE '01' || '%' AND shm.kaisya_id = 1 )
							OR ts.soshiki_id IN
								(SELECT shm.soshiki_id
								 FROM soshiki_mst shm
									WHERE shm.soshiki_code LIKE '01' || '%' AND shm.kaisya_id = 1 )
							OR (ts.soshiki_id IS NULL 
								AND t.fuken_code IN (SELECT fuken_code
											FROM soshiki_tanto_fuken
											WHERE soshiki_id=(SELECT soshiki_id
												FROM soshiki_mst
												WHERE kaisya_id=1 
													and soshiki_code='01') )
								)    )  AND t.service_code = '01'  ORDER BY t.tehaikanri_id
;
--/

