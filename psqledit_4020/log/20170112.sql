-- psqledit log file
-- date: 2017-01-12

--kosyo2@172.20.0.137:5432.kosyo2 09:48:43
				SELECT distinct
					   x.*,
					   tk.service_code,
					   sm.service_name,		   
					   y.kyoten_area
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
				  WHERE bm.block_code ='02'
						  AND bm.fuken_code IN ('21','22','23','24') 
						  
				   ) X
				INNER JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code 
				LEFT JOIN
					(SELECT t1.build_code, t2.service_code, string_agg(t2.kyoten_area,'、') kyoten_area
					FROM tehaisaki_build t1
					LEFT JOIN tehaisakikanri t2 ON t2.tehaikanri_id = t1.tehaikanri_id
					GROUP BY t1.build_code, t2.service_code ) y ON  y.build_code = x.build_code AND y.service_code=tk.service_code
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:28:54
select irai_id, title, naiyou, upd_naiyou, kigen, soshiki_id, 
	irai_houhou, service_code, timezone_code, kubun, send_houhou, 
	send_date, send_time, status, status_upd_dt, add_date, add_userid, 
	upd_date, upd_userid
from work_irai
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:52:02
 
					SELECT 	wi.irai_id, 
							wi.title, 
							wi.kigen, 
							wi.irai_houhou, 
							wi.status, 
							wi.status_upd_dt,
							wi.add_date,
							km1.kaisya_name || '　' || (CASE
								 WHEN length(sm1.soshiki_code) > 1 THEN
										(SELECT soshiki_name
										 FROM soshiki_mst b
										 WHERE b.soshiki_code = substring(sm1.soshiki_code,1,2)
										   AND b.kaisya_id = sm1.kaisya_id)
								 ELSE ''
							 END) || '　' || CASE
												WHEN length(sm1.soshiki_code) > 3 THEN
													   (SELECT soshiki_name
														FROM soshiki_mst b
														WHERE b.soshiki_code = substring(sm1.soshiki_code,1,4)
														  AND b.kaisya_id = sm1.kaisya_id)
												ELSE ''
											END || '　' || CASE
															  WHEN length(sm1.soshiki_code) > 5 THEN
																	 (SELECT soshiki_name
																	  FROM soshiki_mst b
																	  WHERE b.soshiki_code = substring(sm1.soshiki_code,1,6)
																		AND b.kaisya_id = sm1.kaisya_id)
															  ELSE ''
														  END || '　' || CASE
																			WHEN length(sm1.soshiki_code) > 7 THEN
																				   (SELECT soshiki_name
																					FROM soshiki_mst b
																					WHERE b.soshiki_code = substring(sm1.soshiki_code,1,8)
																					  AND b.kaisya_id = sm1.kaisya_id)
																			ELSE ''
																		END || '　' || CASE
																						  WHEN length(sm1.soshiki_code) > 9 THEN
																								 (SELECT soshiki_name
																								  FROM soshiki_mst b
																								  WHERE b.soshiki_code = substring(sm1.soshiki_code,1,10)
																									AND b.kaisya_id = sm1.kaisya_id)
																						  ELSE ''
																					  END AS iraimoto,
							km2.kaisya_name || '　' || (CASE
								 WHEN length(sm2.soshiki_code) > 1 THEN
										(SELECT soshiki_name
										 FROM soshiki_mst b
										 WHERE b.soshiki_code = substring(sm2.soshiki_code,1,2)
										   AND b.kaisya_id = sm2.kaisya_id)
								 ELSE ''
							 END) || '　' || CASE
												WHEN length(sm2.soshiki_code) > 3 THEN
													   (SELECT soshiki_name
														FROM soshiki_mst b
														WHERE b.soshiki_code = substring(sm2.soshiki_code,1,4)
														  AND b.kaisya_id = sm2.kaisya_id)
												ELSE ''
											END || '　' || CASE
															  WHEN length(sm2.soshiki_code) > 5 THEN
																	 (SELECT soshiki_name
																	  FROM soshiki_mst b
																	  WHERE b.soshiki_code = substring(sm2.soshiki_code,1,6)
																		AND b.kaisya_id = sm2.kaisya_id)
															  ELSE ''
														  END || '　' || CASE
																			WHEN length(sm2.soshiki_code) > 7 THEN
																				   (SELECT soshiki_name
																					FROM soshiki_mst b
																					WHERE b.soshiki_code = substring(sm2.soshiki_code,1,8)
																					  AND b.kaisya_id = sm2.kaisya_id)
																			ELSE ''
																		END || '　' || CASE
																						  WHEN length(sm2.soshiki_code) > 9 THEN
																								 (SELECT soshiki_name
																								  FROM soshiki_mst b
																								  WHERE b.soshiki_code = substring(sm2.soshiki_code,1,10)
																									AND b.kaisya_id = sm2.kaisya_id)
																						  ELSE ''
																					  END AS iraisaki,
							sm2.soshiki_id,
						    wir.status AS iraisaki_status,
						    wir.seq_no,
							inum.irai_su,
							st.kanryou_su
					FROM work_irai 				wi
					LEFT JOIN soshiki_mst		sm1  ON sm1.soshiki_id = wi.soshiki_id
					LEFT JOIN kaisya_mst 		km1  ON km1.kaisya_id = sm1.kaisya_id
					LEFT JOIN work_irai_req		wir  ON wir.irai_id = wi.irai_id
					LEFT JOIN soshiki_mst		sm2  ON sm2.soshiki_id = wir.soshiki_id
					LEFT JOIN kaisya_mst 		km2	 ON km2.kaisya_id = sm2.kaisya_id
					LEFT JOIN
					  (SELECT req.irai_id,
							  count(req.irai_id) AS irai_su,
							  req.soshiki_id
					   FROM work_irai_tehai req
					   GROUP BY req.irai_id,
								req.soshiki_id) inum ON wi.irai_id = inum.irai_id AND wir.soshiki_id = inum.soshiki_id
					LEFT JOIN
					  (SELECT req.irai_id,
							  count(req.status) AS kanryou_su,
							  req.soshiki_id
					   FROM work_irai_tehai req
					   WHERE req.status >= 9
					   GROUP BY req.irai_id,
								req.soshiki_id) st ON wi.irai_id = st.irai_id AND st.soshiki_id = wir.soshiki_id 
					WHERE 1 = 1 
						AND wi.irai_houhou = '1' 
					ORDER BY wi.kigen, 
						wi.irai_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:54:52
 
					SELECT 	wi.irai_id, 
							wi.title, 
							wi.kigen, 
							wi.irai_houhou, 
							wi.status, 
							wi.status_upd_dt,
							wi.add_date,
							km1.kaisya_name || '　' || (CASE
								 WHEN length(sm1.soshiki_code) > 1 THEN
										(SELECT soshiki_name
										 FROM soshiki_mst b
										 WHERE b.soshiki_code = substring(sm1.soshiki_code,1,2)
										   AND b.kaisya_id = sm1.kaisya_id)
								 ELSE ''
							 END) || '　' || CASE
												WHEN length(sm1.soshiki_code) > 3 THEN
													   (SELECT soshiki_name
														FROM soshiki_mst b
														WHERE b.soshiki_code = substring(sm1.soshiki_code,1,4)
														  AND b.kaisya_id = sm1.kaisya_id)
												ELSE ''
											END || '　' || CASE
															  WHEN length(sm1.soshiki_code) > 5 THEN
																	 (SELECT soshiki_name
																	  FROM soshiki_mst b
																	  WHERE b.soshiki_code = substring(sm1.soshiki_code,1,6)
																		AND b.kaisya_id = sm1.kaisya_id)
															  ELSE ''
														  END || '　' || CASE
																			WHEN length(sm1.soshiki_code) > 7 THEN
																				   (SELECT soshiki_name
																					FROM soshiki_mst b
																					WHERE b.soshiki_code = substring(sm1.soshiki_code,1,8)
																					  AND b.kaisya_id = sm1.kaisya_id)
																			ELSE ''
																		END || '　' || CASE
																						  WHEN length(sm1.soshiki_code) > 9 THEN
																								 (SELECT soshiki_name
																								  FROM soshiki_mst b
																								  WHERE b.soshiki_code = substring(sm1.soshiki_code,1,10)
																									AND b.kaisya_id = sm1.kaisya_id)
																						  ELSE ''
																					  END AS iraimoto,
							km2.kaisya_name || '　' || (CASE
								 WHEN length(sm2.soshiki_code) > 1 THEN
										(SELECT soshiki_name
										 FROM soshiki_mst b
										 WHERE b.soshiki_code = substring(sm2.soshiki_code,1,2)
										   AND b.kaisya_id = sm2.kaisya_id)
								 ELSE ''
							 END) || '　' || CASE
												WHEN length(sm2.soshiki_code) > 3 THEN
													   (SELECT soshiki_name
														FROM soshiki_mst b
														WHERE b.soshiki_code = substring(sm2.soshiki_code,1,4)
														  AND b.kaisya_id = sm2.kaisya_id)
												ELSE ''
											END || '　' || CASE
															  WHEN length(sm2.soshiki_code) > 5 THEN
																	 (SELECT soshiki_name
																	  FROM soshiki_mst b
																	  WHERE b.soshiki_code = substring(sm2.soshiki_code,1,6)
																		AND b.kaisya_id = sm2.kaisya_id)
															  ELSE ''
														  END || '　' || CASE
																			WHEN length(sm2.soshiki_code) > 7 THEN
																				   (SELECT soshiki_name
																					FROM soshiki_mst b
																					WHERE b.soshiki_code = substring(sm2.soshiki_code,1,8)
																					  AND b.kaisya_id = sm2.kaisya_id)
																			ELSE ''
																		END || '　' || CASE
																						  WHEN length(sm2.soshiki_code) > 9 THEN
																								 (SELECT soshiki_name
																								  FROM soshiki_mst b
																								  WHERE b.soshiki_code = substring(sm2.soshiki_code,1,10)
																									AND b.kaisya_id = sm2.kaisya_id)
																						  ELSE ''
																					  END AS iraisaki,
							sm2.soshiki_id,
						    wir.status AS iraisaki_status,
						    wir.seq_no,
							inum.irai_su,
							st.kanryou_su
					FROM work_irai 				wi
					LEFT JOIN soshiki_mst		sm1  ON sm1.soshiki_id = wi.soshiki_id
					LEFT JOIN kaisya_mst 		km1  ON km1.kaisya_id = sm1.kaisya_id
					LEFT JOIN work_irai_req		wir  ON wir.irai_id = wi.irai_id
					LEFT JOIN soshiki_mst		sm2  ON sm2.soshiki_id = wir.soshiki_id
					LEFT JOIN kaisya_mst 		km2	 ON km2.kaisya_id = sm2.kaisya_id
					LEFT JOIN
					  (SELECT req.irai_id,
							  count(req.irai_id) AS irai_su,
							  req.soshiki_id
					   FROM work_irai_tehai req
					   GROUP BY req.irai_id,
								req.soshiki_id) inum ON wi.irai_id = inum.irai_id AND wir.soshiki_id = inum.soshiki_id
					LEFT JOIN
					  (SELECT req.irai_id,
							  count(req.status) AS kanryou_su,
							  req.soshiki_id
					   FROM work_irai_tehai req
					   WHERE req.status >= 9
					   GROUP BY req.irai_id,
								req.soshiki_id) st ON wi.irai_id = st.irai_id AND st.soshiki_id = wir.soshiki_id 
					WHERE 1 = 1 
						AND wi.irai_houhou = '1' 
						AND wi.status >= 12  
					ORDER BY wi.kigen, 
						wi.irai_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:54:57
 
					SELECT 	wi.irai_id, 
							wi.title, 
							wi.kigen, 
							wi.irai_houhou, 
							wi.status, 
							wi.status_upd_dt,
							wi.add_date,
							km1.kaisya_name || '　' || (CASE
								 WHEN length(sm1.soshiki_code) > 1 THEN
										(SELECT soshiki_name
										 FROM soshiki_mst b
										 WHERE b.soshiki_code = substring(sm1.soshiki_code,1,2)
										   AND b.kaisya_id = sm1.kaisya_id)
								 ELSE ''
							 END) || '　' || CASE
												WHEN length(sm1.soshiki_code) > 3 THEN
													   (SELECT soshiki_name
														FROM soshiki_mst b
														WHERE b.soshiki_code = substring(sm1.soshiki_code,1,4)
														  AND b.kaisya_id = sm1.kaisya_id)
												ELSE ''
											END || '　' || CASE
															  WHEN length(sm1.soshiki_code) > 5 THEN
																	 (SELECT soshiki_name
																	  FROM soshiki_mst b
																	  WHERE b.soshiki_code = substring(sm1.soshiki_code,1,6)
																		AND b.kaisya_id = sm1.kaisya_id)
															  ELSE ''
														  END || '　' || CASE
																			WHEN length(sm1.soshiki_code) > 7 THEN
																				   (SELECT soshiki_name
																					FROM soshiki_mst b
																					WHERE b.soshiki_code = substring(sm1.soshiki_code,1,8)
																					  AND b.kaisya_id = sm1.kaisya_id)
																			ELSE ''
																		END || '　' || CASE
																						  WHEN length(sm1.soshiki_code) > 9 THEN
																								 (SELECT soshiki_name
																								  FROM soshiki_mst b
																								  WHERE b.soshiki_code = substring(sm1.soshiki_code,1,10)
																									AND b.kaisya_id = sm1.kaisya_id)
																						  ELSE ''
																					  END AS iraimoto,
							km2.kaisya_name || '　' || (CASE
								 WHEN length(sm2.soshiki_code) > 1 THEN
										(SELECT soshiki_name
										 FROM soshiki_mst b
										 WHERE b.soshiki_code = substring(sm2.soshiki_code,1,2)
										   AND b.kaisya_id = sm2.kaisya_id)
								 ELSE ''
							 END) || '　' || CASE
												WHEN length(sm2.soshiki_code) > 3 THEN
													   (SELECT soshiki_name
														FROM soshiki_mst b
														WHERE b.soshiki_code = substring(sm2.soshiki_code,1,4)
														  AND b.kaisya_id = sm2.kaisya_id)
												ELSE ''
											END || '　' || CASE
															  WHEN length(sm2.soshiki_code) > 5 THEN
																	 (SELECT soshiki_name
																	  FROM soshiki_mst b
																	  WHERE b.soshiki_code = substring(sm2.soshiki_code,1,6)
																		AND b.kaisya_id = sm2.kaisya_id)
															  ELSE ''
														  END || '　' || CASE
																			WHEN length(sm2.soshiki_code) > 7 THEN
																				   (SELECT soshiki_name
																					FROM soshiki_mst b
																					WHERE b.soshiki_code = substring(sm2.soshiki_code,1,8)
																					  AND b.kaisya_id = sm2.kaisya_id)
																			ELSE ''
																		END || '　' || CASE
																						  WHEN length(sm2.soshiki_code) > 9 THEN
																								 (SELECT soshiki_name
																								  FROM soshiki_mst b
																								  WHERE b.soshiki_code = substring(sm2.soshiki_code,1,10)
																									AND b.kaisya_id = sm2.kaisya_id)
																						  ELSE ''
																					  END AS iraisaki,
							sm2.soshiki_id,
						    wir.status AS iraisaki_status,
						    wir.seq_no,
							inum.irai_su,
							st.kanryou_su
					FROM work_irai 				wi
					LEFT JOIN soshiki_mst		sm1  ON sm1.soshiki_id = wi.soshiki_id
					LEFT JOIN kaisya_mst 		km1  ON km1.kaisya_id = sm1.kaisya_id
					LEFT JOIN work_irai_req		wir  ON wir.irai_id = wi.irai_id
					LEFT JOIN soshiki_mst		sm2  ON sm2.soshiki_id = wir.soshiki_id
					LEFT JOIN kaisya_mst 		km2	 ON km2.kaisya_id = sm2.kaisya_id
					LEFT JOIN
					  (SELECT req.irai_id,
							  count(req.irai_id) AS irai_su,
							  req.soshiki_id
					   FROM work_irai_tehai req
					   GROUP BY req.irai_id,
								req.soshiki_id) inum ON wi.irai_id = inum.irai_id AND wir.soshiki_id = inum.soshiki_id
					LEFT JOIN
					  (SELECT req.irai_id,
							  count(req.status) AS kanryou_su,
							  req.soshiki_id
					   FROM work_irai_tehai req
					   WHERE req.status >= 9
					   GROUP BY req.irai_id,
								req.soshiki_id) st ON wi.irai_id = st.irai_id AND st.soshiki_id = wir.soshiki_id 
					WHERE 1 = 1 
						AND wi.irai_houhou = '1' 
						AND wir.status >= 12  
					ORDER BY wi.kigen, 
						wi.irai_id;
--/

