-- psqledit log file
-- date: 2017-05-01

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:53:21
				SELECT distinct 
					th.tehaikanri_id 	|| 
					th.kubun   			|| 
					th.gyoumu_kbn   	|| 
					th.st_date 			|| 
					th.st_time 			|| 
					th.ed_date 			|| 
					th.ed_time   		|| 
					md5(th.syukan_soshiki   || 
					array_to_string(ARRAY (
                            SELECT 
                                ts.soshiki_id	|| '-' || 
                                ts.disp_flg		|| '-' || 
                                ts.tel_id	    || '-' || 
                                ts.fax_id
                        FROM tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')  								  || 
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
						  ORDER BY tt.priority), '')  											||  
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||  
								tt.tousei_no 	|| '' || 
								tt.tel_id 
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 									||
					th.bikou) thkey,				
					th.tehaikanri_id,
					th.tehai_id,
					th.eda_no,
					th.st_date, 
					th.st_time, 
					th.ed_date, 
					th.ed_time, 
					th.timezone_code,
					th.kubun,
					th.gyoumu_kbn,
					tz.timezone_name,
					tk.kyoten_area,
					(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) 		||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm
					
					
				FROM tehaisakikanri tk 
				LEFT JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id 
				LEFT JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				LEFT JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num		
				WHERE 1=1 
					AND th.kubun ='2' 
					AND tk.block_code = '01'  
					AND tk.fuken_code = '25'  
					AND tk.service_code = '01'  
					AND (th.syukan_soshiki IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR th.syukan_soshiki IN (558)
					   OR ts.soshiki_id IN (13,54,199,299,422,355,423,379,88,200,117,198,421,447,463)
					   OR ts.soshiki_id IN (558) ) 
				ORDER BY 
					th.kubun,
					th.gyoumu_kbn,
					th.st_date, 
					th.st_time, 
					th.ed_date, 
					th.ed_time, 
					th.timezone_code
						  
				
;
--/

