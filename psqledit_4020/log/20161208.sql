-- psqledit log file
-- date: 2016-12-08

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:42:26
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=111;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:18:45
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:36:49
select tehaikanri_id, tehai_id, eda_no
from tehaisaki
where tehaikanri_id=80
    AND tehai_id=35
    AND eda_no=1;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:37:31
select tehaikanri_id, tehai_id, eda_no
from tehaisaki
where tehaikanri_id=80
    AND tehai_id=35
    AND eda_no=1;
--/

--kosyo2@172.20.0.137:5432.kosyo2 16:12:47
select tehaikanri_id, tehai_id, eda_no
from tehaisaki
where tehaikanri_id=80
    AND tehai_id=35
    AND eda_no=1;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:13:37
select tehaikanri_id, tehai_id, eda_no
from tehaisaki
where tehaikanri_id=80
    AND tehai_id=35
    AND eda_no=1;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161116 16:13:50
select tehaikanri_id, tehai_id, eda_no
from tehaisaki
where tehaikanri_id=80
    AND tehai_id=35
    AND eda_no=1;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:13:55
select tehaikanri_id, tehai_id, eda_no
from tehaisaki
where tehaikanri_id=80
    AND tehai_id=35
    AND eda_no=1;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:21:38
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
						   wi.timezone_code,
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
					LEFT JOIN timezone_mst 		tm ON wi.timezone_code = tm.timezone_code
					--left join tehaisaki_soshiki ts on ts.tehai_id = t.tehai_id
					--								AND ts.eda_num = t.eda_no
					--								AND ts.disp_flg = '1'
					left join soshiki_mst		st on st.soshiki_id = wit.soshiki_id

					WHERE 	wit.soshiki_id=154 
							AND wit.irai_id=157
					ORDER BY 	wi.kigen,
								wit.irai_id,
								t.tehai_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:27:19
SELECT tehaikanri_id,
						   tehai_id,
						   eda_no
					FROM tehaisaki
					WHERE tehaikanri_id= 80
					  AND tehai_id=35
					  AND eda_no=1;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:28:05
SELECT tehaikanri_id,
						   tehai_id,
						   eda_no
					FROM tehaisaki
					WHERE tehaikanri_id= 80
					  AND tehai_id=35
					  AND eda_no=1;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:50:02
SELECT tehaikanri_id,
						   tehai_id,
						   eda_no
					FROM tehaisaki
					WHERE tehaikanri_id= 125
					  AND tehai_id=111
					  AND eda_no=1;
--/

--kosyo2@172.20.0.137:5432.kosyo2 16:50:21
SELECT tehaikanri_id,
						   tehai_id,
						   eda_no
					FROM tehaisaki
					WHERE tehaikanri_id= 125
					  AND tehai_id=111
					  AND eda_no=1;
--/

