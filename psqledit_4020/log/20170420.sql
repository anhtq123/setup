-- psqledit log file
-- date: 2017-04-20

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:03:40
select id, code, naiyo, bikou
from code_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:05:13
insert into code_mst
(id, code, naiyo, bikou)
values('10', '5', '30', '期限経過日数');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:05:22
select id, code, naiyo, bikou
from code_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:22:10
select irai_id, kigen
from work_irai
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:23:26
select irai_id
from work_irai
where kigen > '2017/04/20';
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:23:32
select irai_id
from work_irai
where kigen >= '2017/04/20';
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:25:43
select irai_id
from work_irai
where kigen < '2017/04/20';
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:33:02
select irai_id
from work_irai
where CAST(kigen AS DATE)  < CAST('2017-04-20' AS DATE) + CAST('1 day' AS INTERVAL);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:33:09
select irai_id
from work_irai
where CAST(kigen AS DATE)  < CAST('2017-04-20' AS DATE) + CAST('30 day' AS INTERVAL);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:33:45
select irai_id,CAST(kigen AS DATE)
from work_irai
where CAST(kigen AS DATE)  < CAST('2017-04-20' AS DATE) + CAST('30 day' AS INTERVAL);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:34:00
select irai_id,CAST(kigen AS DATE),CAST('2017-04-20' AS DATE) + CAST('30 day' AS INTERVAL)
from work_irai
where CAST(kigen AS DATE)  < CAST('2017-04-20' AS DATE) + CAST('30 day' AS INTERVAL);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:34:31
select irai_id,CAST(kigen AS DATE),CAST('2017-04-20' AS DATE) + CAST('30 day' AS INTERVAL)
from work_irai
where CAST(kigen AS DATE) + CAST('30 day' AS INTERVAL) < CAST('2017-04-20' AS DATE) ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:34:47
select irai_id, kigen
from work_irai
where CAST(kigen AS DATE) + CAST('30 day' AS INTERVAL) < CAST('2017-04-20' AS DATE) ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:34:58
select irai_id, kigen
from work_irai
where CAST(kigen AS DATE) + CAST('31 day' AS INTERVAL) < CAST('2017-04-20' AS DATE) ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:35:01
select irai_id, kigen
from work_irai
where CAST(kigen AS DATE) + CAST('30 day' AS INTERVAL) < CAST('2017-04-20' AS DATE) ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:39:54
select id, code, naiyo, bikou
from code_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:50:21
select irai_id, soshiki_id, tehai_id, eda_no, status, status_upd_dt, 
	add_date, add_userid, upd_date, upd_userid
from work_irai_tehai
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:57:05
select id, code, naiyo, bikou
from code_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:55:43
				SELECT distinct 
					th.kubun   || '' || 
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
							AND tt.eda_no = th.eda_no), '') thkey,				
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
					tk.kyoten_area,
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
				FROM tehaisakikanri tk 
				LEFT JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id 
				LEFT JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				LEFT JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num 
					AND tk.service_code = '01'  
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:56:49
				SELECT distinct 
					th.kubun   || '' || 
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
							AND tt.eda_no = th.eda_no), '') thkey,				
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
					tk.kyoten_area,
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
				FROM tehaisakikanri tk 
				LEFT JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id 
				LEFT JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				LEFT JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num 
					AND tk.service_code = '01'  
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:00:02
				SELECT distinct 
					th.kubun   || '' || 
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
							AND tt.eda_no = th.eda_no), '') thkey,				
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
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					tk.service_code,
					tk.kyoten_area,
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
				FROM tehaisakikanri tk 
				LEFT JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id 
				LEFT JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				LEFT JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num 
					AND tk.service_code = '01'  
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:00:36
				SELECT distinct 
					th.kubun   || '' || 
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
							AND tt.eda_no = th.eda_no), '') thkey,				
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
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					tk.service_code,
					tk.kyoten_area,
					sm.kaisya_id,						
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki

				FROM tehaisakikanri tk 
				LEFT JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id 
				LEFT JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				LEFT JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num 
					AND tk.service_code = '01'  
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:04:22
				SELECT distinct 
					th.kubun   || '' || 
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
							AND tt.eda_no = th.eda_no), '') thkey,				
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
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
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					tk.kyoten_area,
					th.kubun kubun1


				FROM tehaisakikanri tk 
				LEFT JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id 
				LEFT JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				LEFT JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num 
					AND tk.service_code = '01'  
					AND (th.syukan_soshiki IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR th.syukan_soshiki IN (558)
					   OR ts.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR ts.soshiki_id IN (558) ) 
				ORDER BY 
					thkey,
					th.gyoumu_kbn,
					th.timezone_code,
					kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:11:52
			SELECT distinct 
					th.kubun   || '' || 
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
							AND tt.eda_no = th.eda_no), '') thkey,				
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
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
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					tk.kyoten_area
					
				FROM tehaisakikanri tk 
				LEFT JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id 
				LEFT JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				LEFT JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num 
					AND tk.block_code = '01'  
					AND tk.fuken_code = '25'  
					AND tk.service_code = '01'  
					AND (th.syukan_soshiki IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR th.syukan_soshiki IN (558)
					   OR ts.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR ts.soshiki_id IN (558) ) 
				ORDER BY 
					thkey,
					th.gyoumu_kbn,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:14:12
				SELECT distinct 
					th.kubun   || '' || 
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
							AND tt.eda_no = th.eda_no), '') thkey,				
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
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
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					tk.kyoten_area
					
				FROM tehaisakikanri tk 
				LEFT JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id 
				LEFT JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				LEFT JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE 1=1  
					AND tk.block_code = '01'  
					AND tk.fuken_code = '25'  
					AND tk.service_code = '01'  
					AND (th.syukan_soshiki IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR th.syukan_soshiki IN (558)
					   OR ts.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR ts.soshiki_id IN (558) ) 
				ORDER BY 
					thkey,
					th.gyoumu_kbn,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:32:01
				SELECT distinct 
					th.tehaikanri_id || '' || 
                    th.kubun   || '' || 
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
							AND tt.eda_no = th.eda_no), '') thkey,				
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
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
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					tk.kyoten_area
					
				FROM tehaisakikanri tk 
				LEFT JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id 
				LEFT JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				LEFT JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE 1=1  
					AND tk.block_code = '01'  
					AND tk.fuken_code = '25'  
					AND tk.service_code = '01'  
					AND (th.syukan_soshiki IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR th.syukan_soshiki IN (558)
					   OR ts.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR ts.soshiki_id IN (558) ) 
				ORDER BY 
					thkey,
					th.gyoumu_kbn,
					th.timezone_code;
--/

