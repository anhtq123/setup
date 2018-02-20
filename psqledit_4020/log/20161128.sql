-- psqledit log file
-- date: 2016-11-28

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:41:07
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=36;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:41:11
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=36;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:41:18
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:41:31
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
--where tehai_id=36
order by tehaikanri_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:41:35
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
--where tehai_id=36
order by tehaikanri_id desc;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:51:09
SELECT th.tehaikanri_id,
       tk.tehai_id,
       tk.eda_no,
       th.fuken_code,
       th.service_code,
       tb.build_code,
       tk.timezone_code,
       tk.tehai_id,
       tk.kubun,
       tk.gyoumu_kbn,
       tk.st_date || ' ' || tk.st_time AS start_time,
       CASE
           WHEN tk.ed_date != '' THEN (tk.ed_date || ' ' || tk.ed_time)
           ELSE '3'
       END AS end_time
FROM tehaisakikanri th
JOIN tehaisaki tk ON th.tehaikanri_id = tk.tehaikanri_id
JOIN tehaisaki_build tb ON th.tehaikanri_id = tb.tehaikanri_id
WHERE th.fuken_code = '34'
  AND th.service_code = '01'
  AND tk.timezone_code = '1'
  AND tb.build_code = '3410100101' AND((tk.kubun = '2'
                                        AND (tk.st_date || ' ' || tk.st_time|| ':00') <= '2016/11/28 15:49:59'
                                        AND (tk.ed_date || ' ' || tk.ed_time|| ':00') >= '2016/11/28 15:49:59')
                                       OR (tk.kubun = '1'
                                           AND (tk.st_date|| ' ' || tk.st_time || ':00') <= '2016/11/28 15:49:59'
                                           AND (tk.ed_date = ''
                                                OR (tk.ed_date != ''
                                                    AND (tk.ed_date || ' '|| tk.ed_time || ':00') >= '2016/11/28 15:49:59'))))
ORDER BY end_time DESC,
         start_time,
         tk.kubun DESC,
         tk.tehai_id,
         tk.eda_no,
         tk.gyoumu_kbn;
--/

