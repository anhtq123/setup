-- psqledit log file
-- date: 2017-05-30

--postgres@172.20.0.137:5432.kosyo_tool_step2 10:13:49
SELECT wit.irai_id,
						   wit.status,
						   wit.eda_no,
						   wit.soshiki_id,
						   wit.tehai_id,
						   tk.kyoten_area,
						   tk.tehaikanri_id,
						   wi.kubun,
						   wi.kigen,
						   t.st_date || ' '|| t.st_time || ' Å` '||  t.ed_date || ' '|| t.ed_time as kikan,
						   t.timezone_code,
						   t.st_date, 
						   t.st_time, 
						   t.ed_date, 
						   t.ed_time,
						   fm.fuken_name,
						   sm.service_name,
						   array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where t.gyoumu_kbn = t.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name,
						   tm.timezone_name,
						   st.soshiki_name
					FROM work_irai_tehai 		wit
					LEFT JOIN work_irai 		wi ON wi.irai_id = wit.irai_id
					LEFT JOIN tehaisaki 		t ON wit.tehai_id = t.tehai_id AND t.eda_no= wit.eda_no
					LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = t.tehaikanri_id
					LEFT JOIN fuken_mst 		fm ON fm.fuken_code = tk.fuken_code
					LEFT JOIN service_mst 		sm ON sm.service_code = tk.service_code
					LEFT JOIN timezone_mst 		tm ON t.timezone_code = tm.timezone_code
					--left join tehaisaki_soshiki ts on ts.tehai_id = t.tehai_id
					--								AND ts.eda_num = t.eda_no
					--								AND ts.disp_flg = '1'
					left join soshiki_mst		st on st.soshiki_id = wit.soshiki_id

					WHERE 	wit.soshiki_id=355 
							AND wit.irai_id=2
					ORDER BY 	wi.kigen,
								wit.irai_id,
								t.tehai_id,
								t.eda_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 10:22:47
SELECT th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(
					th.kikan_naiyou 	||
					th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
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
						  ORDER BY tt.priority), '')  										||
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||
								tt.tousei_no 	|| '' ||
								tt.tel_id
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,
					wit.irai_id,
						   wit.status,
						   wit.eda_no,
						   wit.soshiki_id,
						   wit.tehai_id,
						   tk.kyoten_area,
						   tk.tehaikanri_id,
						   wi.kubun,
						   wi.kigen,
						   th.st_date || ' '|| th.st_time || ' Å` '||  th.ed_date || ' '|| th.ed_time as kikan,
						   th.timezone_code,
						   th.st_date, 
						   th.st_time, 
						   th.ed_date, 
						   th.ed_time,
						   fm.fuken_name,
						   sm.service_name,
						   array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where th.gyoumu_kbn = th.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name,
						   tm.timezone_name,
						   st.soshiki_name
					FROM work_irai_tehai 		wit
					LEFT JOIN work_irai 		wi ON wi.irai_id = wit.irai_id
					LEFT JOIN tehaisaki 		th ON wit.tehai_id = th.tehai_id AND th.eda_no= wit.eda_no
					LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = th.tehaikanri_id
					LEFT JOIN fuken_mst 		fm ON fm.fuken_code = tk.fuken_code
					LEFT JOIN service_mst 		sm ON sm.service_code = tk.service_code
					LEFT JOIN timezone_mst 		tm ON th.timezone_code = tm.timezone_code
					--left join tehaisaki_soshiki ts on ts.tehai_id = th.tehai_id
					--								AND ts.eda_num = th.eda_no
					--								AND ts.disp_flg = '1'
					left join soshiki_mst		st on st.soshiki_id = wit.soshiki_id

					WHERE 	wit.soshiki_id=355 
							AND wit.irai_id=2
					ORDER BY 	wi.kigen,
								wit.irai_id,
								th.tehai_id,
								th.eda_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 10:25:35
SELECT th.gyoumu_kbn 	||
					replace(th.st_date, '/', '') 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(
					th.kikan_naiyou 	||
					th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
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
						  ORDER BY tt.priority), '')  										||
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||
								tt.tousei_no 	|| '' ||
								tt.tel_id
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,
					wit.irai_id,
						   wit.status,
						   wit.eda_no,
						   wit.soshiki_id,
						   wit.tehai_id,
						   tk.kyoten_area,
						   tk.tehaikanri_id,
						   wi.kubun,
						   wi.kigen,
						   th.st_date || ' '|| th.st_time || ' Å` '||  th.ed_date || ' '|| th.ed_time as kikan,
						   th.timezone_code,
						   th.st_date, 
						   th.st_time, 
						   th.ed_date, 
						   th.ed_time,
						   fm.fuken_name,
						   sm.service_name,
						   array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where th.gyoumu_kbn = th.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name,
						   tm.timezone_name,
						   st.soshiki_name
					FROM work_irai_tehai 		wit
					LEFT JOIN work_irai 		wi ON wi.irai_id = wit.irai_id
					LEFT JOIN tehaisaki 		th ON wit.tehai_id = th.tehai_id AND th.eda_no= wit.eda_no
					LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = th.tehaikanri_id
					LEFT JOIN fuken_mst 		fm ON fm.fuken_code = tk.fuken_code
					LEFT JOIN service_mst 		sm ON sm.service_code = tk.service_code
					LEFT JOIN timezone_mst 		tm ON th.timezone_code = tm.timezone_code
					--left join tehaisaki_soshiki ts on ts.tehai_id = th.tehai_id
					--								AND ts.eda_num = th.eda_no
					--								AND ts.disp_flg = '1'
					left join soshiki_mst		st on st.soshiki_id = wit.soshiki_id

					WHERE 	wit.soshiki_id=355 
							AND wit.irai_id=2
					ORDER BY 	wi.kigen,
								wit.irai_id,
								th.tehai_id,
								th.eda_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 10:26:28
SELECT th.gyoumu_kbn 	||
					replace(th.st_date, '/', '') 		||
					replace(th.st_time, ':', '') 		||
					replace(th.ed_date, '/', '') 		||
					replace(th.ed_time, ':', '')       	||
					th.kubun   		||
					md5(
					th.kikan_naiyou 	||
					th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
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
						  ORDER BY tt.priority), '')  										||
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||
								tt.tousei_no 	|| '' ||
								tt.tel_id
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,
					wit.irai_id,
						   wit.status,
						   wit.eda_no,
						   wit.soshiki_id,
						   wit.tehai_id,
						   tk.kyoten_area,
						   tk.tehaikanri_id,
						   wi.kubun,
						   wi.kigen,
						   th.st_date || ' '|| th.st_time || ' Å` '||  th.ed_date || ' '|| th.ed_time as kikan,
						   th.timezone_code,
						   th.st_date, 
						   th.st_time, 
						   th.ed_date, 
						   th.ed_time,
						   fm.fuken_name,
						   sm.service_name,
						   array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where th.gyoumu_kbn = th.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name,
						   tm.timezone_name,
						   st.soshiki_name
					FROM work_irai_tehai 		wit
					LEFT JOIN work_irai 		wi ON wi.irai_id = wit.irai_id
					LEFT JOIN tehaisaki 		th ON wit.tehai_id = th.tehai_id AND th.eda_no= wit.eda_no
					LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = th.tehaikanri_id
					LEFT JOIN fuken_mst 		fm ON fm.fuken_code = tk.fuken_code
					LEFT JOIN service_mst 		sm ON sm.service_code = tk.service_code
					LEFT JOIN timezone_mst 		tm ON th.timezone_code = tm.timezone_code
					--left join tehaisaki_soshiki ts on ts.tehai_id = th.tehai_id
					--								AND ts.eda_num = th.eda_no
					--								AND ts.disp_flg = '1'
					left join soshiki_mst		st on st.soshiki_id = wit.soshiki_id

					WHERE 	wit.soshiki_id=355 
							AND wit.irai_id=2
					ORDER BY 	wi.kigen,
								wit.irai_id,
								th.tehai_id,
								th.eda_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 10:31:47
SELECT 
					th.tehaikanri_id 	||
					th.kubun   			||
					th.gyoumu_kbn   	||
					replace(th.st_date, '/', '') 		||
					replace(th.st_time, ':', '') 		||
					replace(th.ed_date, '/', '') 		||
					replace(th.ed_time, ':', '')       	||
					md5(
					th.kikan_naiyou 	||
					th.syukan_soshiki   ||
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
					wit.irai_id,
						   wit.status,
						   wit.eda_no,
						   wit.soshiki_id,
						   wit.tehai_id,
						   tk.kyoten_area,
						   tk.tehaikanri_id,
						   wi.kubun,
						   wi.kigen,
						   th.st_date || ' '|| th.st_time || ' Å` '||  th.ed_date || ' '|| th.ed_time as kikan,
						   th.timezone_code,
						   th.st_date, 
						   th.st_time, 
						   th.ed_date, 
						   th.ed_time,
						   fm.fuken_name,
						   sm.service_name,
						   array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where th.gyoumu_kbn = th.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name,
						   tm.timezone_name,
						   st.soshiki_name
					FROM work_irai_tehai 		wit
					LEFT JOIN work_irai 		wi ON wi.irai_id = wit.irai_id
					LEFT JOIN tehaisaki 		th ON wit.tehai_id = th.tehai_id AND th.eda_no= wit.eda_no
					LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = th.tehaikanri_id
					LEFT JOIN fuken_mst 		fm ON fm.fuken_code = tk.fuken_code
					LEFT JOIN service_mst 		sm ON sm.service_code = tk.service_code
					LEFT JOIN timezone_mst 		tm ON th.timezone_code = tm.timezone_code
					--left join tehaisaki_soshiki ts on ts.tehai_id = th.tehai_id
					--								AND ts.eda_num = th.eda_no
					--								AND ts.disp_flg = '1'
					left join soshiki_mst		st on st.soshiki_id = wit.soshiki_id

					WHERE 	wit.soshiki_id=355 
							AND wit.irai_id=2
					ORDER BY 	wi.kigen,
								wit.irai_id,
								th.tehai_id,
								th.eda_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 10:36:47
					SELECT 
						th.tehaikanri_id 	||
						th.kubun   			||
						th.gyoumu_kbn   	||
						replace(th.st_date, '/', '') 		||
						replace(th.st_time, ':', '') 		||
						replace(th.ed_date, '/', '') 		||
						replace(th.ed_time, ':', '')       	||
						md5(
						th.kikan_naiyou 	||
						th.syukan_soshiki   ||
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
						wit.irai_id,
						wit.status,
						wit.eda_no,
						wit.soshiki_id,
						wit.tehai_id,
						tk.kyoten_area,
						tk.tehaikanri_id,
						wi.kubun,
						wi.kigen,
						th.st_date || ' '|| th.st_time || ' Å` '||  th.ed_date || ' '|| th.ed_time as kikan,
						th.timezone_code,
						th.st_date, 
						th.st_time, 
						th.ed_date, 
						th.ed_time,
						fm.fuken_name,
						sm.service_name,
						array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where th.gyoumu_kbn = th.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name,
						tm.timezone_name,
						st.soshiki_name
					FROM work_irai_tehai 		wit
					LEFT JOIN work_irai 		wi ON wi.irai_id = wit.irai_id
					LEFT JOIN tehaisaki 		th ON wit.tehai_id = th.tehai_id AND th.eda_no= wit.eda_no
					LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = th.tehaikanri_id
					LEFT JOIN fuken_mst 		fm ON fm.fuken_code = tk.fuken_code
					LEFT JOIN service_mst 		sm ON sm.service_code = tk.service_code
					LEFT JOIN timezone_mst 		tm ON th.timezone_code = tm.timezone_code
					--left join tehaisaki_soshiki ts on ts.tehai_id = th.tehai_id
					--								AND ts.eda_num = th.eda_no
					--								AND ts.disp_flg = '1'
					left join soshiki_mst		st on st.soshiki_id = wit.soshiki_id

					WHERE 	wit.soshiki_id=355 
							AND wit.irai_id=2
					ORDER BY 	wi.kigen,
								wit.irai_id,
								th.kubun,
								th.gyoumu_kbn,
								th.st_date,
								th.st_time,
								th.ed_date,
								th.ed_time,
								th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 10:57:37
SELECT wit.irai_id,
						   wit.status,
						   wit.eda_no,
						   wit.soshiki_id,
						   wit.tehai_id,
						   tk.kyoten_area,
						   tk.tehaikanri_id,
						   wi.kubun,
						   wi.kigen,
						   t.st_date || ' '|| t.st_time || ' Å` '||  t.ed_date || ' '|| t.ed_time as kikan,
						   t.timezone_code,
						   t.st_date, 
						   t.st_time, 
						   t.ed_date, 
						   t.ed_time,
						   fm.fuken_name,
						   sm.service_name,
						   array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where t.gyoumu_kbn = t.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name,
						   tm.timezone_name,
						   st.soshiki_name
					FROM work_irai_tehai 		wit
					LEFT JOIN work_irai 		wi ON wi.irai_id = wit.irai_id
					LEFT JOIN tehaisaki 		t ON wit.tehai_id = t.tehai_id AND t.eda_no= wit.eda_no
					LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = t.tehaikanri_id
					LEFT JOIN fuken_mst 		fm ON fm.fuken_code = tk.fuken_code
					LEFT JOIN service_mst 		sm ON sm.service_code = tk.service_code
					LEFT JOIN timezone_mst 		tm ON t.timezone_code = tm.timezone_code
					--left join tehaisaki_soshiki ts on ts.tehai_id = t.tehai_id
					--								AND ts.eda_num = t.eda_no
					--								AND ts.disp_flg = '1'
					left join soshiki_mst		st on st.soshiki_id = wit.soshiki_id

					WHERE 	wit.soshiki_id=355 
							AND wit.irai_id=2
					ORDER BY 	wi.kigen,
								wit.irai_id,
								t.tehai_id,
								t.eda_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 10:57:48
SELECT wit.irai_id,
						   wit.status,
						   wit.eda_no,
						   wit.soshiki_id,
						   wit.tehai_id,
						   tk.kyoten_area,
						   tk.tehaikanri_id,
						   wi.kubun,
						   wi.kigen,
						   th.st_date || ' '|| th.st_time || ' Å` '||  th.ed_date || ' '|| th.ed_time as kikan,
						   th.timezone_code,
						   th.st_date, 
						   th.st_time, 
						   th.ed_date, 
						   th.ed_time,
						   fm.fuken_name,
						   sm.service_name,
						   array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where th.gyoumu_kbn = th.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name,
						   tm.timezone_name,
						   st.soshiki_name
					FROM work_irai_tehai 		wit
					LEFT JOIN work_irai 		wi ON wi.irai_id = wit.irai_id
					LEFT JOIN tehaisaki 		th ON wit.tehai_id = th.tehai_id AND th.eda_no= wit.eda_no
					LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = th.tehaikanri_id
					LEFT JOIN fuken_mst 		fm ON fm.fuken_code = tk.fuken_code
					LEFT JOIN service_mst 		sm ON sm.service_code = tk.service_code
					LEFT JOIN timezone_mst 		tm ON th.timezone_code = tm.timezone_code
					--left join tehaisaki_soshiki ts on ts.tehai_id = th.tehai_id
					--								AND ts.eda_num = th.eda_no
					--								AND ts.disp_flg = '1'
					left join soshiki_mst		st on st.soshiki_id = wit.soshiki_id

					WHERE 	wit.soshiki_id=355 
							AND wit.irai_id=2
					ORDER BY 	wi.kigen,
								wit.irai_id,
								th.tehai_id,
								th.eda_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 10:57:56
SELECT wit.irai_id,
						   wit.status,
						   wit.eda_no,
						   wit.soshiki_id,
						   wit.tehai_id,
						   tk.kyoten_area,
						   tk.tehaikanri_id,
						   wi.kubun,
						   wi.kigen,
						   th.st_date || ' '|| th.st_time || ' Å` '||  th.ed_date || ' '|| th.ed_time as kikan,
						   th.timezone_code,
						   th.st_date, 
						   th.st_time, 
						   th.ed_date, 
						   th.ed_time,
						   fm.fuken_name,
						   sm.service_name,
						   array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where th.gyoumu_kbn = th.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name,
						   tm.timezone_name,
						   st.soshiki_name
					FROM work_irai_tehai 		wit
					LEFT JOIN work_irai 		wi ON wi.irai_id = wit.irai_id
					LEFT JOIN tehaisaki 		th ON wit.tehai_id = th.tehai_id AND th.eda_no= wit.eda_no
					LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = th.tehaikanri_id
					LEFT JOIN fuken_mst 		fm ON fm.fuken_code = tk.fuken_code
					LEFT JOIN service_mst 		sm ON sm.service_code = tk.service_code
					LEFT JOIN timezone_mst 		tm ON th.timezone_code = tm.timezone_code
					--left join tehaisaki_soshiki ts on ts.tehai_id = th.tehai_id
					--								AND ts.eda_num = th.eda_no
					--								AND ts.disp_flg = '1'
					left join soshiki_mst		st on st.soshiki_id = wit.soshiki_id

					WHERE 	wit.soshiki_id=355 
							AND wit.irai_id=2
					ORDER BY 	wi.kigen,
								wit.irai_id,
								th.tehai_id,
								th.eda_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 10:58:41
					SELECT 
						th.tehaikanri_id 	||
						th.kubun   			||
						th.gyoumu_kbn   	||
						replace(th.st_date, '/', '') 		||
						replace(th.st_time, ':', '') 		||
						replace(th.ed_date, '/', '') 		||
						replace(th.ed_time, ':', '')       	||
						md5(
						th.kikan_naiyou 	||
						th.syukan_soshiki   ||
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
						wit.irai_id,
						wit.status,
						wit.eda_no,
						wit.soshiki_id,
						wit.tehai_id,
						tk.kyoten_area,
						tk.tehaikanri_id,
						wi.kubun,
						wi.kigen,
						th.st_date || ' '|| th.st_time || ' Å` '||  th.ed_date || ' '|| th.ed_time as kikan,
						th.timezone_code,
						th.st_date, 
						th.st_time, 
						th.ed_date, 
						th.ed_time,
						fm.fuken_name,
						sm.service_name,
						array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where th.gyoumu_kbn = th.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name,
						tm.timezone_name,
						st.soshiki_name
					FROM work_irai_tehai 		wit
					LEFT JOIN work_irai 		wi ON wi.irai_id = wit.irai_id
					LEFT JOIN tehaisaki 		th ON wit.tehai_id = th.tehai_id AND th.eda_no= wit.eda_no
					LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = th.tehaikanri_id
					LEFT JOIN fuken_mst 		fm ON fm.fuken_code = tk.fuken_code
					LEFT JOIN service_mst 		sm ON sm.service_code = tk.service_code
					LEFT JOIN timezone_mst 		tm ON th.timezone_code = tm.timezone_code
					--left join tehaisaki_soshiki ts on ts.tehai_id = th.tehai_id
					--								AND ts.eda_num = th.eda_no
					--								AND ts.disp_flg = '1'
					left join soshiki_mst		st on st.soshiki_id = wit.soshiki_id

					WHERE 	wit.soshiki_id=355 
							AND wit.irai_id=2
					ORDER BY 	wi.kigen,
								wit.irai_id,
								th.kubun,
								th.gyoumu_kbn,
								th.st_date,
								th.st_time,
								th.ed_date,
								th.ed_time,
								th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 11:01:53
					SELECT 
						th.tehaikanri_id 	||
						th.kubun   			||
						th.gyoumu_kbn   	||
						replace(th.st_date, '/', '') 		||
						replace(th.st_time, ':', '') 		||
						replace(th.ed_date, '/', '') 		||
						replace(th.ed_time, ':', '')       	||
						md5(
						th.kikan_naiyou 	||
						th.syukan_soshiki   ||
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
						wit.irai_id,
						wit.status,
						wit.eda_no,
						wit.soshiki_id,
						wit.tehai_id,
						tk.kyoten_area,
						tk.tehaikanri_id,
						wi.kubun,
						wi.kigen,
						th.st_date || ' '|| th.st_time || ' Å` '||  th.ed_date || ' '|| th.ed_time as kikan,
						th.timezone_code,
						th.st_date, 
						th.st_time, 
						th.ed_date, 
						th.ed_time,
						fm.fuken_name,
						sm.service_name,
						array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where th.gyoumu_kbn = th.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name,
						tm.timezone_name,
						st.soshiki_name
					FROM work_irai_tehai 		wit
					LEFT JOIN work_irai 		wi ON wi.irai_id = wit.irai_id
					LEFT JOIN tehaisaki 		th ON wit.tehai_id = th.tehai_id AND th.eda_no= wit.eda_no
					LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = th.tehaikanri_id
					LEFT JOIN fuken_mst 		fm ON fm.fuken_code = tk.fuken_code
					LEFT JOIN service_mst 		sm ON sm.service_code = tk.service_code
					LEFT JOIN timezone_mst 		tm ON th.timezone_code = tm.timezone_code
					--left join tehaisaki_soshiki ts on ts.tehai_id = th.tehai_id
					--								AND ts.eda_num = th.eda_no
					--								AND ts.disp_flg = '1'
					left join soshiki_mst		st on st.soshiki_id = wit.soshiki_id

					WHERE 	wit.soshiki_id=355 
							AND wit.irai_id=2
					ORDER BY 	wi.kigen,
								wit.irai_id,
								th.kubun,
								th.gyoumu_kbn,
								th.st_date,
								th.st_time,
								th.ed_date,
								th.ed_time,
								th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 11:02:07
SELECT wit.irai_id,
						   wit.status,
						   wit.eda_no,
						   wit.soshiki_id,
						   wit.tehai_id,
						   tk.kyoten_area,
						   tk.tehaikanri_id,
						   wi.kubun,
						   wi.kigen,
						   th.st_date || ' '|| th.st_time || ' Å` '||  th.ed_date || ' '|| th.ed_time as kikan,
						   th.timezone_code,
						   th.st_date, 
						   th.st_time, 
						   th.ed_date, 
						   th.ed_time,
						   fm.fuken_name,
						   sm.service_name,
						   array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where th.gyoumu_kbn = th.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name,
						   tm.timezone_name,
						   st.soshiki_name
					FROM work_irai_tehai 		wit
					LEFT JOIN work_irai 		wi ON wi.irai_id = wit.irai_id
					LEFT JOIN tehaisaki 		th ON wit.tehai_id = th.tehai_id AND th.eda_no= wit.eda_no
					LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = th.tehaikanri_id
					LEFT JOIN fuken_mst 		fm ON fm.fuken_code = tk.fuken_code
					LEFT JOIN service_mst 		sm ON sm.service_code = tk.service_code
					LEFT JOIN timezone_mst 		tm ON th.timezone_code = tm.timezone_code
					--left join tehaisaki_soshiki ts on ts.tehai_id = th.tehai_id
					--								AND ts.eda_num = th.eda_no
					--								AND ts.disp_flg = '1'
					left join soshiki_mst		st on st.soshiki_id = wit.soshiki_id

					WHERE 	wit.soshiki_id=355 
							AND wit.irai_id=2
					ORDER BY 	wi.kigen,
								wit.irai_id,
								th.tehai_id,
								th.eda_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 15:42:50
select tehai_id, eda_num, soshiki_id, disp_flg, tel_id, fax_id, 
	mail_id, add_date, add_userid, upd_date, upd_userid
from tehaisaki_soshiki
where soshiki_id = 379;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 15:43:22
select tehai_id, eda_num, soshiki_id, disp_flg, tel_id, fax_id, 
	mail_id, add_date, add_userid, upd_date, upd_userid
from tehaisaki_soshiki


where soshiki_id = 669;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 15:49:06
select tehai_id, eda_num, soshiki_id, disp_flg, tel_id, fax_id, 
	mail_id, add_date, add_userid, upd_date, upd_userid
from tehaisaki_soshiki


where soshiki_id = 672;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 15:49:59
select tehai_id, eda_num, soshiki_id, disp_flg, tel_id, fax_id, 
	mail_id, add_date, add_userid, upd_date, upd_userid
from tehaisaki_soshiki


where soshiki_id = 668;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 15:50:13
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki

where syukan_soshiki = 668;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 15:50:24
select tehai_id, eda_no, soshiki_id, tousei_no, tel_id, add_date, 
	add_userid, upd_date, upd_userid
from tehaisaki_tousei

where soshiki_id = 668;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step2 15:50:37
select tehai_id, eda_no, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2, add_date, add_userid, upd_date, 
	upd_userid
from tehaisaki_tanto


where soshiki_id = 668;
--/

