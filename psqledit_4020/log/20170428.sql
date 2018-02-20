-- psqledit log file
-- date: 2017-04-28

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:34:52
select octet_length(bikou)
from tehaisaki
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:36:31
select BIT_LENGTH(bikou)
from tehaisaki
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:37:05
select BIT_LENGTH(bikou),tehaikanri_id, tehai_id, eda_no
from tehaisaki
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:37:13
select BIT_LENGTH(bikou),tehaikanri_id, tehai_id, eda_no,bikou
from tehaisaki
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:37:23
select tehaikanri_id, tehai_id, BIT_LENGTH(bikou),eda_no,bikou
from tehaisaki
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:37:33
select tehaikanri_id, tehai_id, eda_no,BIT_LENGTH(bikou),bikou
from tehaisaki
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:41:09
select tehaikanri_id, tehai_id, eda_no,BIT_LENGTH(bikou),bikou
from tehaisaki
order by tehaikanri_id, tehai_id, eda_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:47:40
select tehaikanri_id, tehai_id, eda_no, md5(bikou),bikou
from tehaisaki
order by tehaikanri_id, tehai_id, eda_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:48:02
select tehaikanri_id , tehai_id, eda_no, md5(bikou),bikou
from tehaisaki
order by tehaikanri_id desc, tehai_id, eda_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:59:12
select tehaikanri_id , tehai_id, eda_no, md5(bikou),bikou
from tehaisaki
order by tehaikanri_id desc, tehai_id, eda_no ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:15:36
SELECT gyoumu_kbn,
					service_code,
					gyoumu_name
					FROM gyoumukubun
					WHERE service_code = '01';
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:35:20
SELECT gyoumu_kbn,
					service_code,
					gyoumu_name
					FROM gyoumukubun
					WHERE service_code = '01';
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:35:20
SELECT gyoumu_kbn,
					service_code,
					gyoumu_name
					FROM gyoumukubun
					WHERE service_code = '01';
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:35:21
SELECT gyoumu_kbn,
					service_code,
					gyoumu_name
					FROM gyoumukubun
					WHERE service_code = '01';
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:35:21
SELECT gyoumu_kbn,
					service_code,
					gyoumu_name
					FROM gyoumukubun
					WHERE service_code = '01';
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:35:21
SELECT gyoumu_kbn,
					service_code,
					gyoumu_name
					FROM gyoumukubun
					WHERE service_code = '01';
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:49:25
				SELECT distinct 
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||  
								tt.priority 	|| '' || 
								tt.shikibetu1 	|| '' ||  
								tt.tel_id1 		|| '' ||  
								tt.shikibetu2 	|| '' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '') xxx, th.kubun   || '' || 
					th.gyoumu_kbn   || '' || 
					th.st_date || '' || 
					th.st_time || 
					th.ed_date || '' || 
					th.ed_time   || '' || 
					th.syukan_soshiki   || '' || 
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  || '' || 
					array_to_string(ARRAY
						(SELECT tt.tanto_id || '' ||  
								tt.priority || '' || 
								tt.shikibetu1 || '' ||  
								tt.tel_id1 || '' ||  
								tt.shikibetu2 || '' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  || '' ||  
					array_to_string(ARRAY
						(SELECT tt.soshiki_id || '' ||  
								tt.tousei_no || '' || 
								tt.tel_id 
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') || '' || 
					md5(th.bikou) thkey,				
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,			
					array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)  || '_' || 
                                    (SELECT faxno FROM soshiki_fax sfax WHERE sfax.soshiki_id =tso.soshiki_id AND sfax.fax_id=tso.fax_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,		
					array_to_string(ARRAY
		                         (select ttanto.soshiki_id || '_' || ttanto.tanto_id || '_' || ttanto.shikibetu1 || '_' || ttanto.tel_id1 || '_' ||  ttanto.shikibetu2 || '_' ||  ttanto.tel_id2
                                    from tehaisaki_tanto ttanto
                                    where ttanto.tehai_id = th.tehai_id AND th.eda_no = ttanto.eda_no
                                    order by ttanto.priority), '/') ttil,			  
					tk.service_code,
					sm.kaisya_id,						
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki, 
					th.bikou,				
					(SELECT count(p.soshiki_id)
						FROM soshiki_mst p
						WHERE p.soshiki_id = sm.soshiki_id AND ((p.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
									AND p.kaisya_id = 2)
							OR p.soshiki_id IN (558)) ) editable 
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 725  
					AND (th.syukan_soshiki IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR th.syukan_soshiki IN (558)
					   OR ts.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR ts.soshiki_id IN (558) ) 
				ORDER BY 
					thkey,
					th.gyoumu_kbn,
					th.timezone_code,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:50:06
				SELECT distinct 
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '-' ||  
								tt.priority 	|| '-' || 
								tt.shikibetu1 	|| '-' ||  
								tt.tel_id1 		|| '-' ||  
								tt.shikibetu2 	|| '-' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '') xxx, th.kubun   || '' || 
					th.gyoumu_kbn   || '' || 
					th.st_date || '' || 
					th.st_time || 
					th.ed_date || '' || 
					th.ed_time   || '' || 
					th.syukan_soshiki   || '' || 
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  || '' || 
					array_to_string(ARRAY
						(SELECT tt.tanto_id || '' ||  
								tt.priority || '' || 
								tt.shikibetu1 || '' ||  
								tt.tel_id1 || '' ||  
								tt.shikibetu2 || '' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  || '' ||  
					array_to_string(ARRAY
						(SELECT tt.soshiki_id || '' ||  
								tt.tousei_no || '' || 
								tt.tel_id 
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') || '' || 
					md5(th.bikou) thkey,				
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,			
					array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)  || '_' || 
                                    (SELECT faxno FROM soshiki_fax sfax WHERE sfax.soshiki_id =tso.soshiki_id AND sfax.fax_id=tso.fax_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,		
					array_to_string(ARRAY
		                         (select ttanto.soshiki_id || '_' || ttanto.tanto_id || '_' || ttanto.shikibetu1 || '_' || ttanto.tel_id1 || '_' ||  ttanto.shikibetu2 || '_' ||  ttanto.tel_id2
                                    from tehaisaki_tanto ttanto
                                    where ttanto.tehai_id = th.tehai_id AND th.eda_no = ttanto.eda_no
                                    order by ttanto.priority), '/') ttil,			  
					tk.service_code,
					sm.kaisya_id,						
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki, 
					th.bikou,				
					(SELECT count(p.soshiki_id)
						FROM soshiki_mst p
						WHERE p.soshiki_id = sm.soshiki_id AND ((p.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
									AND p.kaisya_id = 2)
							OR p.soshiki_id IN (558)) ) editable 
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 725  
					AND (th.syukan_soshiki IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR th.syukan_soshiki IN (558)
					   OR ts.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR ts.soshiki_id IN (558) ) 
				ORDER BY 
					thkey,
					th.gyoumu_kbn,
					th.timezone_code,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:54:34
				SELECT distinct 
					th.kubun   		||
					th.gyoumu_kbn 	|| 
					th.st_date 		||  
					th.st_time 		|| 
					th.ed_date 		||  
					th.ed_time   	||  
					md5(th.syukan_soshiki   ||  
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||  
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||  
								tt.priority 	|| '' || 
								tt.shikibetu1 	|| '' ||  
								tt.tel_id1 		|| '' ||  
								tt.shikibetu2 	|| '' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  										|| 
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||  
								tt.tousei_no 	|| '' || 
								tt.tel_id 
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,				
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,			
					array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)  || '_' || 
                                    (SELECT faxno FROM soshiki_fax sfax WHERE sfax.soshiki_id =tso.soshiki_id AND sfax.fax_id=tso.fax_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,		
					array_to_string(ARRAY
		                         (select ttanto.soshiki_id || '_' || ttanto.tanto_id || '_' || ttanto.shikibetu1 || '_' || ttanto.tel_id1 || '_' ||  ttanto.shikibetu2 || '_' ||  ttanto.tel_id2
                                    from tehaisaki_tanto ttanto
                                    where ttanto.tehai_id = th.tehai_id AND th.eda_no = ttanto.eda_no
                                    order by ttanto.priority), '/') ttil,			  
					tk.service_code,
					sm.kaisya_id,						
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki, 
					th.bikou,				
					(SELECT count(p.soshiki_id)
						FROM soshiki_mst p
						WHERE p.soshiki_id = sm.soshiki_id AND ((p.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
									AND p.kaisya_id = 2)
							OR p.soshiki_id IN (558)) ) editable 
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 725  
					AND (th.syukan_soshiki IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR th.syukan_soshiki IN (558)
					   OR ts.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR ts.soshiki_id IN (558) ) 
				ORDER BY 
					thkey,
					th.gyoumu_kbn,
					th.timezone_code,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:55:03
				SELECT distinct 
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||  
								tt.priority 	|| '' || 
								tt.shikibetu1 	|| '' ||  
								tt.tel_id1 		|| '' ||  
								tt.shikibetu2 	|| '' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')x ,
                    th.kubun   		||
					th.gyoumu_kbn 	|| 
					th.st_date 		||  
					th.st_time 		|| 
					th.ed_date 		||  
					th.ed_time   	||  
					md5(th.syukan_soshiki   ||  
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||  
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||  
								tt.priority 	|| '' || 
								tt.shikibetu1 	|| '' ||  
								tt.tel_id1 		|| '' ||  
								tt.shikibetu2 	|| '' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  										|| 
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||  
								tt.tousei_no 	|| '' || 
								tt.tel_id 
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,				
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,			
					array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)  || '_' || 
                                    (SELECT faxno FROM soshiki_fax sfax WHERE sfax.soshiki_id =tso.soshiki_id AND sfax.fax_id=tso.fax_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,		
					array_to_string(ARRAY
		                         (select ttanto.soshiki_id || '_' || ttanto.tanto_id || '_' || ttanto.shikibetu1 || '_' || ttanto.tel_id1 || '_' ||  ttanto.shikibetu2 || '_' ||  ttanto.tel_id2
                                    from tehaisaki_tanto ttanto
                                    where ttanto.tehai_id = th.tehai_id AND th.eda_no = ttanto.eda_no
                                    order by ttanto.priority), '/') ttil,			  
					tk.service_code,
					sm.kaisya_id,						
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki, 
					th.bikou,				
					(SELECT count(p.soshiki_id)
						FROM soshiki_mst p
						WHERE p.soshiki_id = sm.soshiki_id AND ((p.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
									AND p.kaisya_id = 2)
							OR p.soshiki_id IN (558)) ) editable 
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 725  
					AND (th.syukan_soshiki IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR th.syukan_soshiki IN (558)
					   OR ts.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR ts.soshiki_id IN (558) ) 
				ORDER BY 
					thkey,
					th.gyoumu_kbn,
					th.timezone_code,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:55:14
				SELECT distinct 
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '-' ||  
								tt.priority 	|| '-' || 
								tt.shikibetu1 	|| '-' ||  
								tt.tel_id1 		|| '-' ||  
								tt.shikibetu2 	|| '-' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')x ,
                    th.kubun   		||
					th.gyoumu_kbn 	|| 
					th.st_date 		||  
					th.st_time 		|| 
					th.ed_date 		||  
					th.ed_time   	||  
					md5(th.syukan_soshiki   ||  
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||  
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||  
								tt.priority 	|| '' || 
								tt.shikibetu1 	|| '' ||  
								tt.tel_id1 		|| '' ||  
								tt.shikibetu2 	|| '' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  										|| 
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||  
								tt.tousei_no 	|| '' || 
								tt.tel_id 
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,				
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,			
					array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)  || '_' || 
                                    (SELECT faxno FROM soshiki_fax sfax WHERE sfax.soshiki_id =tso.soshiki_id AND sfax.fax_id=tso.fax_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,		
					array_to_string(ARRAY
		                         (select ttanto.soshiki_id || '_' || ttanto.tanto_id || '_' || ttanto.shikibetu1 || '_' || ttanto.tel_id1 || '_' ||  ttanto.shikibetu2 || '_' ||  ttanto.tel_id2
                                    from tehaisaki_tanto ttanto
                                    where ttanto.tehai_id = th.tehai_id AND th.eda_no = ttanto.eda_no
                                    order by ttanto.priority), '/') ttil,			  
					tk.service_code,
					sm.kaisya_id,						
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki, 
					th.bikou,				
					(SELECT count(p.soshiki_id)
						FROM soshiki_mst p
						WHERE p.soshiki_id = sm.soshiki_id AND ((p.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
									AND p.kaisya_id = 2)
							OR p.soshiki_id IN (558)) ) editable 
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 725  
					AND (th.syukan_soshiki IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR th.syukan_soshiki IN (558)
					   OR ts.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR ts.soshiki_id IN (558) ) 
				ORDER BY 
					thkey,
					th.gyoumu_kbn,
					th.timezone_code,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:57:12
				SELECT distinct 
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '-' ||  
								tt.priority 	|| '-' || 
								tt.shikibetu1 	|| '-' ||  
								tt.tel_id1 		|| '-' ||  
								tt.shikibetu2 	|| '-' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')x ,
                    th.kubun   		||
					th.gyoumu_kbn 	|| 
					th.st_date 		||  
					th.st_time 		|| 
					th.ed_date 		||  
					th.ed_time   	||  
					md5(th.syukan_soshiki   ||  
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||  
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||  
								tt.priority 	|| '' || 
								tt.shikibetu1 	|| '' ||  
								tt.tel_id1 		|| '' ||  
								tt.shikibetu2 	|| '' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  										|| 
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||  
								tt.tousei_no 	|| '' || 
								tt.tel_id 
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,				
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,			
					array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)  || '_' || 
                                    (SELECT faxno FROM soshiki_fax sfax WHERE sfax.soshiki_id =tso.soshiki_id AND sfax.fax_id=tso.fax_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,		
					array_to_string(ARRAY
		                         (select ttanto.soshiki_id || '_' || ttanto.tanto_id || '_' || ttanto.shikibetu1 || '_' || ttanto.tel_id1 || '_' ||  ttanto.shikibetu2 || '_' ||  ttanto.tel_id2
                                    from tehaisaki_tanto ttanto
                                    where ttanto.tehai_id = th.tehai_id AND th.eda_no = ttanto.eda_no
                                    order by ttanto.priority), '/') ttil,			  
					tk.service_code,
					sm.kaisya_id,						
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki, 
					th.bikou,				
					(SELECT count(p.soshiki_id)
						FROM soshiki_mst p
						WHERE p.soshiki_id = sm.soshiki_id AND ((p.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
									AND p.kaisya_id = 2)
							OR p.soshiki_id IN (558)) ) editable 
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 725  and th.tehai_id in (3852,3854,3855)
					AND (th.syukan_soshiki IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR th.syukan_soshiki IN (558)
					   OR ts.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR ts.soshiki_id IN (558) ) 
				ORDER BY 
					thkey,
					th.gyoumu_kbn,
					th.timezone_code,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:58:48
SELECT tt.tanto_id 	|| '-' ||  
								tt.priority 	|| '-' || 
								tt.shikibetu1 	|| '-' ||  
								tt.tel_id1 		|| '-' ||  
								tt.shikibetu2 	|| '-' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id in (3852,3854,3855);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:00:06
SELECT tt.tanto_id 	|| '-' ||  
								tt.priority 	|| '-' || 
								tt.shikibetu1 	|| '-' ||  
								tt.tel_id1 		|| '-' ||  
								tt.shikibetu2 	|| '-' || 
								tt.tel_id2 ,tt.tehai_id, tt.eda_no, tt.soshiki_id, tt.tanto_id, tt.priority, tt.shikibetu1, 
	tt.tel_id1, tt.shikibetu2, tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id in (3852,3854,3855)
				

;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:00:18
SELECT tt.tanto_id 	|| '-' ||  
								tt.priority 	|| '-' || 
								tt.shikibetu1 	|| '-' ||  
								tt.tel_id1 		|| '-' ||  
								tt.shikibetu2 	|| '-' || 
								tt.tel_id2 ,tt.tehai_id, tt.eda_no, tt.soshiki_id, tt.tanto_id, tt.priority, tt.shikibetu1, 
	tt.tel_id1, tt.shikibetu2, tt.tel_id2
						  FROM tehaisaki_tanto tt
						  left JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id in (3852,3854,3855)
				

;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:00:30
SELECT tt.tanto_id 	|| '-' ||  
								tt.priority 	|| '-' || 
								tt.shikibetu1 	|| '-' ||  
								tt.tel_id1 		|| '-' ||  
								tt.shikibetu2 	|| '-' || 
								tt.tel_id2 ,tt.tehai_id, tt.eda_no, tt.soshiki_id, tt.tanto_id, tt.priority, tt.shikibetu1, 
	tt.tel_id1, tt.shikibetu2, tt.tel_id2
						  FROM tehaisaki_tanto tt
						  left JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id in (3852)
				

;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:02:16
select tehai_id, eda_num, soshiki_id, disp_flg, tel_id, fax_id, 
	add_date, add_userid, upd_date, upd_userid
from tehaisaki_soshiki
WHERE tehai_id in (3852,3854,3855)
				
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:02:22
select tehai_id, eda_num, soshiki_id, disp_flg, tel_id, fax_id, 
	add_date, add_userid, upd_date, upd_userid
from tehaisaki_soshiki
WHERE tehai_id in (3852)
				
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:07:18
				SELECT distinct 
					array_to_string(ARRAY (
                            select 
                                ts.soshiki_id	|| '-' || 
                                ts.disp_flg	|| '-' || 
                                ts.tel_id	    || '-' || 
                                ts.fax_id
                        from tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')x ,
                    th.kubun   		||
					th.gyoumu_kbn 	|| 
					th.st_date 		||  
					th.st_time 		|| 
					th.ed_date 		||  
					th.ed_time   	||  
					md5(th.syukan_soshiki   ||  
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||  
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||  
								tt.priority 	|| '' || 
								tt.shikibetu1 	|| '' ||  
								tt.tel_id1 		|| '' ||  
								tt.shikibetu2 	|| '' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  										|| 
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||  
								tt.tousei_no 	|| '' || 
								tt.tel_id 
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,				
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,			
					array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)  || '_' || 
                                    (SELECT faxno FROM soshiki_fax sfax WHERE sfax.soshiki_id =tso.soshiki_id AND sfax.fax_id=tso.fax_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,		
					array_to_string(ARRAY
		                         (select ttanto.soshiki_id || '_' || ttanto.tanto_id || '_' || ttanto.shikibetu1 || '_' || ttanto.tel_id1 || '_' ||  ttanto.shikibetu2 || '_' ||  ttanto.tel_id2
                                    from tehaisaki_tanto ttanto
                                    where ttanto.tehai_id = th.tehai_id AND th.eda_no = ttanto.eda_no
                                    order by ttanto.priority), '/') ttil,			  
					tk.service_code,
					sm.kaisya_id,						
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki, 
					th.bikou,				
					(SELECT count(p.soshiki_id)
						FROM soshiki_mst p
						WHERE p.soshiki_id = sm.soshiki_id AND ((p.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
									AND p.kaisya_id = 2)
							OR p.soshiki_id IN (558)) ) editable 
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 725  and th.tehai_id in (3852,3854,3855)
					AND (th.syukan_soshiki IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR th.syukan_soshiki IN (558)
					   OR ts.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR ts.soshiki_id IN (558) ) 
				ORDER BY 
					thkey,
					th.gyoumu_kbn,
					th.timezone_code,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:32:23
				SELECT distinct 
					
                    th.kubun   		||
					th.gyoumu_kbn 	|| 
					th.st_date 		||  
					th.st_time 		|| 
					th.ed_date 		||  
					th.ed_time   	||  
					md5(th.syukan_soshiki   ||  
                    array_to_string(ARRAY (
                            select 
                                ts.soshiki_id	|| '-' || 
                                ts.disp_flg	|| '-' || 
                                ts.tel_id	    || '-' || 
                                ts.fax_id
                        from tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')   ||  
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||  
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||  
								tt.priority 	|| '' || 
								tt.shikibetu1 	|| '' ||  
								tt.tel_id1 		|| '' ||  
								tt.shikibetu2 	|| '' || 
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  										|| 
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||  
								tt.tousei_no 	|| '' || 
								tt.tel_id 
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,				
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,			
					array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)  || '_' || 
                                    (SELECT faxno FROM soshiki_fax sfax WHERE sfax.soshiki_id =tso.soshiki_id AND sfax.fax_id=tso.fax_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,		
					array_to_string(ARRAY
		                         (select ttanto.soshiki_id || '_' || ttanto.tanto_id || '_' || ttanto.shikibetu1 || '_' || ttanto.tel_id1 || '_' ||  ttanto.shikibetu2 || '_' ||  ttanto.tel_id2
                                    from tehaisaki_tanto ttanto
                                    where ttanto.tehai_id = th.tehai_id AND th.eda_no = ttanto.eda_no
                                    order by ttanto.priority), '/') ttil,			  
					tk.service_code,
					sm.kaisya_id,						
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki, 
					th.bikou,				
					(SELECT count(p.soshiki_id)
						FROM soshiki_mst p
						WHERE p.soshiki_id = sm.soshiki_id AND ((p.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
									AND p.kaisya_id = 2)
							OR p.soshiki_id IN (558)) ) editable 
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 725  and th.tehai_id in (3852,3854,3855)
					AND (th.syukan_soshiki IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR th.syukan_soshiki IN (558)
					   OR ts.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR ts.soshiki_id IN (558) ) 
				ORDER BY 
					thkey,
					th.gyoumu_kbn,
					th.timezone_code,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					kubun1;
--/

