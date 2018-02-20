-- psqledit log file
-- date: 2017-01-10

--kosyo2@172.20.0.137:5432.kosyo2 11:49:39
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=132;
--/

--kosyo2@172.20.0.137:5432.kosyo2 11:50:04
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=114;
--/

--kosyo2@172.20.0.137:5432.kosyo2 11:54:47
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=114;
--/

--kosyo2@172.20.0.137:5432.kosyo2 12:59:53
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=114;
--/

--kosyo2@172.20.0.137:5432.kosyo2 13:03:12
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.tehai_id,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					 ORDER BY 	end_time desc,
							start_time,
							tk.kubun DESC,
							tk.tehai_id,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 13:06:48
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.tehai_id,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					 ORDER BY 	tehai_id,end_time desc,
							start_time,
							tk.kubun DESC,
							tk.tehai_id,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 13:07:12
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.tehai_id,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					 ORDER BY 	end_time desc,
							start_time,
							tk.kubun DESC,
							tk.tehai_id,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 13:12:25
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					 ORDER BY 	end_time desc,
							start_time,
							tk.kubun DESC,
							tk.tehai_id,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 13:12:55
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					 ORDER BY 	end_time desc,
							start_time,
							
							tk.tehai_id,
tk.kubun DESC,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 13:13:18
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					 ORDER BY 	end_time desc,
							
							tk.tehai_id,start_time,
                            tk.kubun DESC,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 13:33:25
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					 ORDER BY 	tk.tehai_id,end_time desc,
							start_time,
							
                            tk.kubun DESC,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 13:42:01
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:05:16
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					 ORDER BY 	
                            tk.tehai_id,
                            end_time desc,
							start_time,
							
                            tk.kubun DESC,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:05:20
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					 ORDER BY 	
                            
                            end_time desc,
							start_time,
							tk.tehai_id,
                            tk.kubun DESC,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:09:58
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					 ORDER BY 	
                            
                            end_time desc,
							start_time,
							tk.tehai_id,
                            tk.kubun DESC,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:10:00
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					 ORDER BY 	
                            tk.tehai_id,
                            end_time desc,
							start_time,
							
                            tk.kubun DESC,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:23:31
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					 ORDER BY 	
                            tk.tehai_id,
                            end_time desc,
							start_time,
							
                            tk.kubun DESC,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:23:39
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					 ORDER BY 	
                            tk.tehai_id,
                            end_time desc,
							start_time,
							
                            tk.kubun DESC,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:27:30
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/10 14:25'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/10 14:25')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/10 14:25'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/10 14:25') ))
					)
					 ORDER BY 	tk.tehai_id,
							end_time desc,
							start_time,
							tk.kubun DESC,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:27:35
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/10 14:25'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/10 14:25')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/10 14:25'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/10 14:25') ))
					)
					 ORDER BY 	tk.tehai_id,
							end_time desc,
							start_time,
							tk.kubun DESC,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:32:09
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1014:30'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1014:30')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1014:30'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1014:30') ))
					)
					 ORDER BY 	tk.tehai_id,
							end_time desc,
							start_time,
							tk.kubun DESC,
							tk.eda_no,
							tk.gyoumu_kbn
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:06:37
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					ORDER BY 
							tk.gyoumu_kbn,
							tk.kubun ,
							start_time,
							end_time DESC,
							tk.tehai_id,
							tk.eda_no;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:06:56
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					ORDER BY tk.tehai_id,
							tk.gyoumu_kbn,
							tk.kubun ,
							start_time,
							end_time DESC,
							
							tk.eda_no;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:07:27
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn
					   ,tk.st_date || ' ' || tk.st_time as start_time
					   ,case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '23'
				  AND th.service_code = '01'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2310100101'  AND(
					(tk.kubun = '2'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (tk.ed_date || tk.ed_time) >= '2017/01/1013:01')
					OR
					(tk.kubun = '1'
					   AND (tk.st_date || tk.st_time) <= '2017/01/1013:01'
					   AND (
							tk.ed_date = '' OR
							(tk.ed_date != '' and (tk.ed_date || tk.ed_time) >= '2017/01/1013:01') ))
					)
					ORDER BY --tk.tehai_id,
							tk.gyoumu_kbn,
							tk.kubun ,
							start_time,
							end_time DESC,
							tk.tehai_id,
							tk.eda_no;
--/

