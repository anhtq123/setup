-- psqledit log file
-- date: 2017-05-15

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:49:47
select tehai_id, eda_no, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2, add_date, add_userid, upd_date, 
	upd_userid
from tehaisaki_tanto
where tehai_id = 540;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:50:04
select tehai_id, eda_no, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2, add_date, add_userid, upd_date, 
	upd_userid
from tehaisaki_tanto
where tehai_id = 540 AND eda_no = 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:10:07
SELECT count(tehai_id) kensuu
				FROM tehaisaki_tanto
				WHERE tehai_id = 540
					AND eda_no = 18;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:09:32
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn,
					   tk.st_date || ' ' || tk.st_time as start_time,
					   case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '25'
				  AND th.service_code = '04'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2520100201'  
				ORDER BY
					tk.kubun DESC,
					tk.st_date DESC,
					tk.st_time,
					tk.ed_date,
					tk.ed_time,
					tk.gyoumu_kbn
					;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:10:52
SELECT th.tehaikanri_id,
					   tk.tehai_id,
					   tk.eda_no,
				       th.fuken_code,
				       th.service_code,
				       tb.build_code,
				       tk.timezone_code,
				       tk.kubun,
				       tk.gyoumu_kbn,
					   tk.st_date || ' ' || tk.st_time as start_time,
					   case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
				FROM tehaisakikanri th
				JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
				JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
				WHERE th.fuken_code = '25'
				  AND th.service_code = '04'
				  AND tk.timezone_code = '1'
				  AND tb.build_code = '2520100201'  
				ORDER BY
					tk.kubun DESC,
					tk.st_date DESC,
					tk.st_time,
					tk.ed_date,
					tk.ed_time,
					tk.gyoumu_kbn
					;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:16:04
SELECT th.tehaikanri_id,row_number() OVER () as rnum,
	   tk.tehai_id,
	   tk.eda_no,
       th.fuken_code,
       th.service_code,
       tb.build_code,
       tk.timezone_code,
       tk.kubun,
       tk.gyoumu_kbn,
	   tk.st_date || ' ' || tk.st_time as start_time,
	   case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
FROM tehaisakikanri th
JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
WHERE th.fuken_code = '25'
  AND th.service_code = '04'
  AND tk.timezone_code = '1'
  AND tb.build_code = '2520100201'  
ORDER BY
	tk.kubun DESC,
	tk.st_date DESC,
	tk.st_time,
	tk.ed_date,
	tk.ed_time,
	tk.gyoumu_kbn
					;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:16:45
SELECT th.tehaikanri_id,
       row_number() OVER () as rnum,
	   tk.tehai_id,
	   tk.eda_no,
       th.fuken_code,
       th.service_code,
       tb.build_code,
       tk.timezone_code,
       tk.kubun,
       tk.gyoumu_kbn,
	   tk.st_date || ' ' || tk.st_time as start_time,
	   case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
FROM tehaisakikanri th
JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
WHERE th.fuken_code = '25'
  AND th.service_code = '04'
  AND tk.timezone_code = '1'
  AND tb.build_code = '2520100201'  
ORDER BY
	tk.kubun DESC,
	tk.st_date DESC,
	tk.st_time,
	tk.ed_date,
	tk.ed_time,
	tk.gyoumu_kbn
					;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:17:46
SELECT th.tehaikanri_id,
       row_number() OVER (order by tehai_id nulls last) as rnum,
	   tk.tehai_id,
	   tk.eda_no,
       th.fuken_code,
       th.service_code,
       tb.build_code,
       tk.timezone_code,
       tk.kubun,
       tk.gyoumu_kbn,
	   tk.st_date || ' ' || tk.st_time as start_time,
	   case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
FROM tehaisakikanri th
JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
WHERE th.fuken_code = '25'
  AND th.service_code = '04'
  AND tk.timezone_code = '1'
  AND tb.build_code = '2520100201'  
ORDER BY
	tk.kubun DESC,
	tk.st_date DESC,
	tk.st_time,
	tk.ed_date,
	tk.ed_time,
	tk.gyoumu_kbn
					;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:19:03
SELECT th.tehaikanri_id,
       row_number() OVER () as rnum,
	   tk.tehai_id,
	   tk.eda_no,
       th.fuken_code,
       th.service_code,
       tb.build_code,
       tk.timezone_code,
       tk.kubun,
       tk.gyoumu_kbn,
	   tk.st_date || ' ' || tk.st_time as start_time,
	   case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
FROM tehaisakikanri th
JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
WHERE th.fuken_code = '25'
  AND th.service_code = '04'
  AND tk.timezone_code = '1'
  AND tb.build_code = '2520100201'  
ORDER BY
	tk.kubun DESC,
	tk.st_date DESC,
	tk.st_time,
	tk.ed_date,
	tk.ed_time,
	tk.gyoumu_kbn
					;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:19:10
SELECT th.tehaikanri_id,
       row_number() OVER () as index,
	   tk.tehai_id,
	   tk.eda_no,
       th.fuken_code,
       th.service_code,
       tb.build_code,
       tk.timezone_code,
       tk.kubun,
       tk.gyoumu_kbn,
	   tk.st_date || ' ' || tk.st_time as start_time,
	   case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
FROM tehaisakikanri th
JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
WHERE th.fuken_code = '25'
  AND th.service_code = '04'
  AND tk.timezone_code = '1'
  AND tb.build_code = '2520100201'  
ORDER BY
	tk.kubun DESC,
	tk.st_date DESC,
	tk.st_time,
	tk.ed_date,
	tk.ed_time,
	tk.gyoumu_kbn
					;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:46:27
SELECT th.tehaikanri_id,
       row_number() OVER () as index,
	   tk.tehai_id,
	   tk.eda_no,
       th.fuken_code,
       th.service_code,
       tb.build_code,
       tk.timezone_code,
       tk.kubun,
       tk.gyoumu_kbn,
	   tk.st_date || ' ' || tk.st_time as start_time,
	   case when tk.ed_date != '' then (tk.ed_date || ' ' || tk.ed_time) else '3' end as end_time
FROM tehaisakikanri th
JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
WHERE th.fuken_code = '25'
  AND th.service_code = '04'
  AND tk.timezone_code = '1'
  AND tb.build_code = '2520100201'  
ORDER BY
	tk.kubun DESC,
	tk.st_date DESC,
	tk.st_time,
	tk.ed_date,
	tk.ed_time,
	tk.gyoumu_kbn
					;
--/

