-- psqledit log file
-- date: 2017-06-02

--postgres@172.20.0.137:5432.kosyo_tool_step3 13:59:05
select tehai_id, eda_no, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2, add_date, add_userid, upd_date, 
	upd_userid
from tehaisaki_tanto
where tehai_id = 3954
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 14:00:39
select tehai_id, eda_num, soshiki_id, disp_flg, tel_id, fax_id, 
	add_date, add_userid, upd_date, upd_userid
from tehaisaki_soshiki

where tehai_id = 3954
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 14:01:26
select tehai_id, eda_num, soshiki_id, disp_flg, tel_id, fax_id, 
	add_date, add_userid, upd_date, upd_userid
from tehaisaki_soshiki

where tehai_id = 3954 and eda_num =1
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 14:14:28
          SELECT shm.soshiki_id
									 FROM soshiki_mst shm
										WHERE shm.soshiki_code LIKE '01010101' || '%' AND shm.kaisya_id = 2;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 14:40:15
SELECT DISTINCT
					tk.block_code,
					tk.fuken_code,
					tk.service_code,
					ts.soshiki_id,
					tk.tehaikanri_id,
					fk.fuken_name,
					tk.kyoten_area,
					sv.service_name,
					ml.mail_name,
					ml.mail_addr,
					TO_CHAR(ml.add_date, 'yyyy/mm/dd') add_date,
					km.kaisya_name || '　' || array_to_string (ARRAY
                                       (SELECT soshiki_name
                                        FROM soshiki_mst
                                        WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
                                          AND length(soshiki_code) <= length(sm.soshiki_code)
                                          AND kaisya_id = sm.kaisya_id
                                          AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
                                        ORDER BY soshiki_code), '　') soshiki_name

				FROM tehaisakikanri tk
				JOIN service_mst sv ON tk.service_code = sv.service_code
				JOIN block_mst bm ON bm.block_code = tk.block_code
				JOIN fuken_mst fk ON tk.fuken_code = fk.fuken_code
				JOIN tehaisaki th on tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num AND ts.disp_flg = '1'
				JOIN soshiki_mst sm ON sm.soshiki_id = ts.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sm.kaisya_id
				JOIN soshiki_mail ml ON sm.soshiki_id = ml.soshiki_id
				WHERE 1 = 1 
				    AND ts.soshiki_id IN
									(SELECT shm.soshiki_id
									 FROM soshiki_mst shm
										WHERE shm.soshiki_code LIKE '01010101' || '%' AND shm.kaisya_id = 2 )  
					AND tk.service_code IN ('03')  
					AND tk.block_code = '01'
					AND tk.fuken_code = '25'
					ORDER BY tk.block_code,
							tk.fuken_code,
							tk.service_code,
							ts.soshiki_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 14:41:35
SELECT DISTINCT
					tk.block_code,
					tk.fuken_code,
					tk.service_code,
					ts.soshiki_id,
					tk.tehaikanri_id,
					fk.fuken_name,
					tk.kyoten_area,
					sv.service_name,
					ml.mail_name,
					ml.mail_addr,
					TO_CHAR(ml.add_date, 'yyyy/mm/dd') add_date,
					km.kaisya_name || '　' || array_to_string (ARRAY
                                       (SELECT soshiki_name
                                        FROM soshiki_mst
                                        WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
                                          AND length(soshiki_code) <= length(sm.soshiki_code)
                                          AND kaisya_id = sm.kaisya_id
                                          AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
                                        ORDER BY soshiki_code), '　') soshiki_name

				FROM tehaisakikanri tk
				JOIN service_mst sv ON tk.service_code = sv.service_code
				JOIN block_mst bm ON bm.block_code = tk.block_code
				JOIN fuken_mst fk ON tk.fuken_code = fk.fuken_code
				JOIN tehaisaki th on tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num AND ts.disp_flg = '1'
				JOIN soshiki_mst sm ON sm.soshiki_id = ts.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sm.kaisya_id
				JOIN soshiki_mail ml ON sm.soshiki_id = ml.soshiki_id
				WHERE 1 = 1 
				    AND ts.soshiki_id IN
									(SELECT shm.soshiki_id
									 FROM soshiki_mst shm
										WHERE shm.soshiki_code LIKE '01010101' || '%' AND shm.kaisya_id = 2 )  
					AND tk.service_code IN ('03')  
					AND tk.block_code = '01'
					AND tk.fuken_code = '25'
					ORDER BY tk.block_code,
							tk.fuken_code,
							tk.service_code,
							ts.soshiki_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 14:41:44
SELECT DISTINCT
					tk.block_code,
					tk.fuken_code,
					tk.service_code,
					ts.soshiki_id,
					tk.tehaikanri_id,
					fk.fuken_name,
					tk.kyoten_area,
					sv.service_name,
					ml.mail_name,
					ml.mail_addr,
					TO_CHAR(ml.add_date, 'yyyy/mm/dd') add_date,
					km.kaisya_name || '　' || array_to_string (ARRAY
                                       (SELECT soshiki_name
                                        FROM soshiki_mst
                                        WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
                                          AND length(soshiki_code) <= length(sm.soshiki_code)
                                          AND kaisya_id = sm.kaisya_id
                                          AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
                                        ORDER BY soshiki_code), '　') soshiki_name

				FROM tehaisakikanri tk
				JOIN service_mst sv ON tk.service_code = sv.service_code
				JOIN block_mst bm ON bm.block_code = tk.block_code
				JOIN fuken_mst fk ON tk.fuken_code = fk.fuken_code
				JOIN tehaisaki th on tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num-- AND ts.disp_flg = '1'
				JOIN soshiki_mst sm ON sm.soshiki_id = ts.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sm.kaisya_id
				JOIN soshiki_mail ml ON sm.soshiki_id = ml.soshiki_id
				WHERE 1 = 1 
				    AND ts.soshiki_id IN
									(SELECT shm.soshiki_id
									 FROM soshiki_mst shm
										WHERE shm.soshiki_code LIKE '01010101' || '%' AND shm.kaisya_id = 2 )  
					AND tk.service_code IN ('03')  
					AND tk.block_code = '01'
					AND tk.fuken_code = '25'
					ORDER BY tk.block_code,
							tk.fuken_code,
							tk.service_code,
							ts.soshiki_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 14:42:15
SELECT DISTINCT
					tk.block_code,
					tk.fuken_code,
					tk.service_code,
					ts.soshiki_id,
					tk.tehaikanri_id,
					fk.fuken_name,
					tk.kyoten_area,
					sv.service_name,
					ml.mail_name,
					ml.mail_addr,
					TO_CHAR(ml.add_date, 'yyyy/mm/dd') add_date,
					km.kaisya_name || '　' || array_to_string (ARRAY
                                       (SELECT soshiki_name
                                        FROM soshiki_mst
                                        WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
                                          AND length(soshiki_code) <= length(sm.soshiki_code)
                                          AND kaisya_id = sm.kaisya_id
                                          AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
                                        ORDER BY soshiki_code), '　') soshiki_name

				FROM tehaisakikanri tk
				JOIN service_mst sv ON tk.service_code = sv.service_code
				JOIN block_mst bm ON bm.block_code = tk.block_code
				JOIN fuken_mst fk ON tk.fuken_code = fk.fuken_code
				JOIN tehaisaki th on tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num AND ts.disp_flg = '1'
				JOIN soshiki_mst sm ON sm.soshiki_id = ts.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sm.kaisya_id
				JOIN soshiki_mail ml ON sm.soshiki_id = ml.soshiki_id
				WHERE 1 = 1 
				    AND ts.soshiki_id IN
									(SELECT shm.soshiki_id
									 FROM soshiki_mst shm
										WHERE shm.soshiki_code LIKE '01010101' || '%' AND shm.kaisya_id = 2 )  
					AND tk.service_code IN ('03')  
					AND tk.block_code = '01'
					AND tk.fuken_code = '25'
					ORDER BY tk.block_code,
							tk.fuken_code,
							tk.service_code,
							ts.soshiki_id;
--/

