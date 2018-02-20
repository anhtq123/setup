-- psqledit log file
-- date: 2016-11-25

--kosyo2@172.20.0.137:5432.kosyo2_20161101 09:18:48
select tanto_id, kaisya_id, soshiki_id, tanto_name, yakusyoku_code, 
	add_date, add_userid, upd_date, upd_userid
from tanto_mst

;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 09:20:50
select tanto_id, kaisya_id, soshiki_id, tanto_name, yakusyoku_code, 
	add_date, add_userid, upd_date, upd_userid
from tanto_mst
order by length(tanto_name)
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 09:20:53
select tanto_id, kaisya_id, soshiki_id, tanto_name, yakusyoku_code, 
	add_date, add_userid, upd_date, upd_userid
from tanto_mst
order by length(tanto_name) desc
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:24:58
select tehaikanri_id, service_code, block_code, fuken_code, 
	kyoten_area, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisakikanri
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:05:41
SELECT a.tehai_id
				FROM
				  (SELECT tehai_id,
				          eda_no,
				          kubun,
				          gyoumu_kbn,
				          timezone_code,
				          st_date || ' ' || st_time AS startdate,
				          ed_date || ' ' || ed_time AS enddate,
				          st_date,
				          st_time,
				          ed_date,
				          ed_time
				   FROM tehaisaki
				   WHERE tehaikanri_id = 104
				     AND tehai_id = 65
				     AND eda_no = 2) a
				WHERE (kubun = '1'
				       AND (ed_date = '' or ed_date is null)
				       AND (ed_time = '' or ed_time is null)
				       AND
				         (SELECT count(b.tehai_id)
				          FROM tehaisaki b
				          WHERE a.tehai_id = b.tehai_id
				            AND a.timezone_code = b.timezone_code
				            AND a.gyoumu_kbn = b.gyoumu_kbn
				            AND a.eda_no <> b.eda_no) >= 1)
					  OR (kubun = '1'
					      AND enddate > to_char(now(), 'YYYY/MM/DD HH24:MI'))
					  OR (kubun = '2'
					      AND startdate < to_char(now(), 'YYYY/MM/DD HH24:MI')
					      AND enddate > to_char(now(), 'YYYY/MM/DD HH24:MI'));
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:06:19
               SELECT a.tehai_id
				FROM
				  (SELECT tehai_id,
				          eda_no,
				          kubun,
				          gyoumu_kbn,
				          timezone_code,
				          st_date || ' ' || st_time AS startdate,
				          ed_date || ' ' || ed_time AS enddate,
				          st_date,
				          st_time,
				          ed_date,
				          ed_time
				   FROM tehaisaki
				   WHERE tehaikanri_id = 104
				     AND tehai_id = 65
				     AND eda_no = 2) a
				WHERE (kubun = '1'
				       AND (ed_date = '' or ed_date is null)
				       AND (ed_time = '' or ed_time is null)
				       AND
				         (SELECT count(b.tehai_id)
				          FROM tehaisaki b
				          WHERE a.tehai_id = b.tehai_id
				            AND a.timezone_code = b.timezone_code
				            AND a.gyoumu_kbn = b.gyoumu_kbn
				            AND a.eda_no <> b.eda_no) >= 1)
--					  OR (kubun = '1'
--					      AND enddate > to_char(now(), 'YYYY/MM/DD HH24:MI'))
--					  OR (kubun = '2'
--					      AND startdate < to_char(now(), 'YYYY/MM/DD HH24:MI')
--					      AND enddate > to_char(now(), 'YYYY/MM/DD HH24:MI'));
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:06:43
               SELECT a.tehai_id
				FROM
				  (SELECT tehai_id,
				          eda_no,
				          kubun,
				          gyoumu_kbn,
				          timezone_code,
				          st_date || ' ' || st_time AS startdate,
				          ed_date || ' ' || ed_time AS enddate,
				          st_date,
				          st_time,
				          ed_date,
				          ed_time
				   FROM tehaisaki
				   WHERE tehaikanri_id = 104
				     AND tehai_id = 65
				     AND eda_no = 2) a
				WHERE 
--                       (kubun = '1'
--				       AND (ed_date = '' or ed_date is null)
--				       AND (ed_time = '' or ed_time is null)
--				       AND
--				         (SELECT count(b.tehai_id)
--				          FROM tehaisaki b
--				          WHERE a.tehai_id = b.tehai_id
--				            AND a.timezone_code = b.timezone_code
--				            AND a.gyoumu_kbn = b.gyoumu_kbn
--				            AND a.eda_no <> b.eda_no) >= 1)
--					  OR 
                        (kubun = '1'
					      AND enddate > to_char(now(), 'YYYY/MM/DD HH24:MI'))
					  OR (kubun = '2'
					      AND startdate < to_char(now(), 'YYYY/MM/DD HH24:MI')
					      AND enddate > to_char(now(), 'YYYY/MM/DD HH24:MI'));
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:07:27
               SELECT a.tehai_id
				FROM
				  (SELECT tehai_id,
				          eda_no,
				          kubun,
				          gyoumu_kbn,
				          timezone_code,
				          st_date || ' ' || st_time AS startdate,
				          ed_date || ' ' || ed_time AS enddate,
				          st_date,
				          st_time,
				          ed_date,
				          ed_time
				   FROM tehaisaki
				   WHERE tehaikanri_id = 104
				     AND tehai_id = 65
				     AND eda_no = 2) a
				WHERE 
                       (kubun = '1'
				       AND (ed_date = '' or ed_date is null)
				       AND (ed_time = '' or ed_time is null)
				       AND
				         (SELECT count(b.tehai_id)
				          FROM tehaisaki b
				          WHERE a.tehai_id = b.tehai_id
				            AND a.timezone_code = b.timezone_code
				            AND a.gyoumu_kbn = b.gyoumu_kbn
				            AND a.eda_no <> b.eda_no) = 1)
					  OR 
                        (kubun = '1'
					      AND enddate > to_char(now(), 'YYYY/MM/DD HH24:MI'))
					  OR (kubun = '2'
					      AND startdate < to_char(now(), 'YYYY/MM/DD HH24:MI')
					      AND enddate > to_char(now(), 'YYYY/MM/DD HH24:MI'));
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:09:52
               SELECT a.tehai_id
				FROM
				  (SELECT tehai_id,
				          eda_no,
				          kubun,
				          gyoumu_kbn,
				          timezone_code,
				          st_date || ' ' || st_time AS startdate,
				          ed_date || ' ' || ed_time AS enddate,
				          st_date,
				          st_time,
				          ed_date,
				          ed_time
				   FROM tehaisaki
				   WHERE tehaikanri_id = 104
				     AND tehai_id = 65
				     AND eda_no = 2) a
				WHERE 
                       (kubun = '1'
				       AND (ed_date = '' or ed_date is null)
				       AND (ed_time = '' or ed_time is null)
				       AND
				         (SELECT count(b.tehai_id)
				          FROM tehaisaki b
				          WHERE a.tehai_id = b.tehai_id
				            AND a.timezone_code = b.timezone_code
				            AND a.gyoumu_kbn = b.gyoumu_kbn
				            AND a.eda_no <> b.eda_no) = 1)
--					  OR 
--                        (kubun = '1'
--					      AND enddate > to_char(now(), 'YYYY/MM/DD HH24:MI'))
--					  OR (kubun = '2'
--					      AND startdate < to_char(now(), 'YYYY/MM/DD HH24:MI')
--					      AND enddate > to_char(now(), 'YYYY/MM/DD HH24:MI'));
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:10:55
       SELECT tehai_id,
				          eda_no,
				          kubun,
				          gyoumu_kbn,
				          timezone_code,
				          st_date || ' ' || st_time AS startdate,
				          ed_date || ' ' || ed_time AS enddate,
				          st_date,
				          st_time,
				          ed_date,
				          ed_time
				   FROM tehaisaki
				   WHERE tehaikanri_id = 104
				     AND tehai_id = 65
				     AND eda_no = 2;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:11:54
               SELECT a.tehai_id
				FROM
				  (SELECT tehai_id,
				          eda_no,
				          kubun,
				          gyoumu_kbn,
				          timezone_code,
				          st_date || ' ' || st_time AS startdate,
				          ed_date || ' ' || ed_time AS enddate,
				          st_date,
				          st_time,
				          ed_date,
				          ed_time
				   FROM tehaisaki
				   WHERE tehaikanri_id = 104
				     AND tehai_id = 65
				     AND eda_no = 2) a
				WHERE 
                       (kubun = '1'
				       AND (ed_date = '' or ed_date is null)
				       AND (ed_time = '' or ed_time is null)
				       AND
				         (SELECT count(b.tehai_id)
				          FROM tehaisaki b
				          WHERE a.tehai_id = b.tehai_id
				            AND a.timezone_code = b.timezone_code
				            AND a.gyoumu_kbn = b.gyoumu_kbn
				            AND a.eda_no <> b.eda_no) = 1)
--					  OR 
--                        (kubun = '1'
--					      AND enddate > to_char(now(), 'YYYY/MM/DD HH24:MI'))
--					  OR (kubun = '2'
--					      AND startdate < to_char(now(), 'YYYY/MM/DD HH24:MI')
--					      AND enddate > to_char(now(), 'YYYY/MM/DD HH24:MI'));
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:14:48
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
 FROM tehaisaki
WHERE tehaikanri_id = 104
 AND tehai_id = 65
 AND eda_no = 2;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:15:04
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun
FROM tehaisaki
WHERE tehaikanri_id = 104
 AND tehai_id = 65
 AND eda_no = 2;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:22:10
             SELECT count(tehai_id)
            FROM tehaisaki 
            WHERE tehaikanri_id = 104
                AND tehai_id = 65;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:24:16
select kubun,ed_date,ed_time,
				          st_date || ' ' || st_time AS startdate,
				          ed_date || ' ' || ed_time AS enddate
FROM tehaisaki
WHERE 
    (kubun = '1' 
        AND (ed_date = '' or ed_date is null)
        AND (ed_time = '' or ed_time is null)
        AND (SELECT count(tehai_id)
            FROM tehaisaki 
            WHERE tehaikanri_id = 104
                AND tehai_id = 65) =1);
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:24:59
select kubun,ed_date,ed_time,
				          st_date || ' ' || st_time AS startdate,
				          ed_date || ' ' || ed_time AS enddate
FROM tehaisaki
WHERE 
    (kubun = '1' 
        AND (ed_date = '' or ed_date is null)
        AND (ed_time = '' or ed_time is null)
        AND (SELECT count(tehai_id)
            FROM tehaisaki 
            WHERE tehaikanri_id = 104
                AND tehai_id = 65) =1)
    OR 
        (kubun = '1'
	      AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'))
    OR (kubun = '2'
        AND  (st_date || ' ' || st_time) < to_char(now(), 'YYYY/MM/DD HH24:MI')
        AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'));
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:25:21
       SELECT tehai_id,
				          eda_no,
				          kubun,
				          gyoumu_kbn,
				          timezone_code,
				          st_date || ' ' || st_time AS startdate,
				          ed_date || ' ' || ed_time AS enddate,
				          st_date,
				          st_time,
				          ed_date,
				          ed_time
				   FROM tehaisaki
				   WHERE tehaikanri_id = 104
				     AND tehai_id = 65;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:25:30
select kubun,ed_date,ed_time
FROM tehaisaki
WHERE 
    (kubun = '1' 
        AND (ed_date = '' or ed_date is null)
        AND (ed_time = '' or ed_time is null)
        AND (SELECT count(tehai_id)
            FROM tehaisaki 
            WHERE tehaikanri_id = 104
                AND tehai_id = 65) =1)
    OR 
        (kubun = '1'
	      AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'))
    OR (kubun = '2'
        AND  (st_date || ' ' || st_time) < to_char(now(), 'YYYY/MM/DD HH24:MI')
        AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'));
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:25:36
select kubun,ed_date,ed_time
FROM tehaisaki
WHERE 
    (kubun = '1' 
        AND (ed_date = '' or ed_date is null)
        AND (ed_time = '' or ed_time is null)
        AND (SELECT count(tehai_id)
            FROM tehaisaki 
            WHERE tehaikanri_id = 104
                AND tehai_id = 65) =1)
    OR 
        (kubun = '1'
	      AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'))
    OR (kubun = '2'
        AND  (st_date || ' ' || st_time) < to_char(now(), 'YYYY/MM/DD HH24:MI')
        AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'));
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:25:39
select kubun
FROM tehaisaki
WHERE 
    (kubun = '1' 
        AND (ed_date = '' or ed_date is null)
        AND (ed_time = '' or ed_time is null)
        AND (SELECT count(tehai_id)
            FROM tehaisaki 
            WHERE tehaikanri_id = 104
                AND tehai_id = 65) =1)
    OR 
        (kubun = '1'
	      AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'))
    OR (kubun = '2'
        AND  (st_date || ' ' || st_time) < to_char(now(), 'YYYY/MM/DD HH24:MI')
        AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'));
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:25:55
select tehai_id
FROM tehaisaki
WHERE 
    (kubun = '1' 
        AND (ed_date = '' or ed_date is null)
        AND (ed_time = '' or ed_time is null)
        AND (SELECT count(tehai_id)
            FROM tehaisaki 
            WHERE tehaikanri_id = 104
                AND tehai_id = 65) =1)
    OR 
        (kubun = '1'
	      AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'))
    OR (kubun = '2'
        AND  (st_date || ' ' || st_time) < to_char(now(), 'YYYY/MM/DD HH24:MI')
        AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'));
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:26:03
select tehai_id
FROM tehaisaki
WHERE 
    (kubun = '1' 
        AND (ed_date = '' or ed_date is null)
        AND (ed_time = '' or ed_time is null)
        AND (SELECT count(tehai_id)
            FROM tehaisaki 
            WHERE tehaikanri_id = 104
                AND tehai_id = 65) =1);
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:27:02
select tehai_id
FROM tehaisaki
WHERE 
    (kubun = '1' 
        AND (ed_date = '' or ed_date is null)
        AND (ed_time = '' or ed_time is null)
        AND (SELECT count(tehai_id)
            FROM tehaisaki 
            WHERE tehaikanri_id = 104
                AND tehai_id = 65) =1)
    OR 
        (kubun = '1'
          AND tehaikanri_id = 104
          AND tehai_id = 65
          AND eda_no = 2
	      AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'))
    OR (kubun = '2'
          AND tehaikanri_id = 104
          AND tehai_id = 65
          AND eda_no = 2
        AND  (st_date || ' ' || st_time) < to_char(now(), 'YYYY/MM/DD HH24:MI')
        AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'));
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:27:06
select tehai_id
FROM tehaisaki
WHERE 
    (kubun = '1' 
        AND (ed_date = '' or ed_date is null)
        AND (ed_time = '' or ed_time is null)
        AND (SELECT count(tehai_id)
            FROM tehaisaki 
            WHERE tehaikanri_id = 104
                AND tehai_id = 65) =1)
    OR 
        (kubun = '1'
          AND tehaikanri_id = 104
          AND tehai_id = 65
          AND eda_no = 2
	      AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'))
    OR (kubun = '2'
          AND tehaikanri_id = 104
          AND tehai_id = 65
          AND eda_no = 2
        AND  (st_date || ' ' || st_time) < to_char(now(), 'YYYY/MM/DD HH24:MI')
        AND (ed_date || ' ' || ed_time) > to_char(now(), 'YYYY/MM/DD HH24:MI'));
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:34:02
               SELECT a.tehai_id
				FROM
				  (SELECT tehai_id,
				          eda_no,
				          kubun,
				          gyoumu_kbn,
				          timezone_code,
				          st_date || ' ' || st_time AS startdate,
				          ed_date || ' ' || ed_time AS enddate,
				          st_date,
				          st_time,
				          ed_date,
				          ed_time
				   FROM tehaisaki
				   WHERE tehaikanri_id = 104
				     AND tehai_id = 65
				     AND eda_no = 2) a
				WHERE 
                       (kubun = '1'
				       AND (ed_date = '' or ed_date is null)
				       AND (ed_time = '' or ed_time is null)
				       AND
				         (SELECT count(b.tehai_id)
				          FROM tehaisaki b
				          WHERE a.tehai_id = b.tehai_id
				            AND a.timezone_code = b.timezone_code
				            AND a.gyoumu_kbn = b.gyoumu_kbn
				            AND a.eda_no <> b.eda_no) = 1)
					;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:35:05
               SELECT a.tehai_id
				FROM
				  (SELECT tehai_id,
				          eda_no,
				          kubun,
				          gyoumu_kbn,
				          timezone_code,
				          st_date || ' ' || st_time AS startdate,
				          ed_date || ' ' || ed_time AS enddate,
				          st_date,
				          st_time,
				          ed_date,
				          ed_time
				   FROM tehaisaki
				   WHERE tehaikanri_id = 104
				     AND tehai_id = 65
				     AND eda_no = 2) a
				WHERE 
                       (kubun = '1'
				       AND (ed_date = '' or ed_date is null)
				       AND (ed_time = '' or ed_time is null)
				       AND
				         (SELECT count(b.tehai_id)
				          FROM tehaisaki b
				          WHERE a.tehai_id = b.tehai_id
				            AND a.timezone_code = b.timezone_code
				            AND a.gyoumu_kbn = b.gyoumu_kbn
				            AND a.eda_no <> b.eda_no) = 0)
					;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:23:46
select irai_id, soshiki_id, seq_no, status, status_upd_dt, add_date, 
	add_userid, upd_date, upd_userid
from work_irai_req
where irai_id=160;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:24:04
select irai_id, title, naiyou, upd_naiyou, kigen, soshiki_id, 
	irai_houhou, service_code, timezone_code, kubun, send_houhou, 
	send_date, send_time, status, status_upd_dt, add_date, add_userid, 
	upd_date, upd_userid
from work_irai
where irai_id=160;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:24:17
select irai_id, title, status, status_upd_dt, add_date, add_userid, 
	upd_date, upd_userid
from work_irai
where irai_id=160;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:27:51
	SELECT 	wi.irai_id, 
							wi.title, 
							wi.kigen, 
							wi.irai_houhou, 
							wi.status, 
							wi.status_upd_dt,
							wi.add_date,
							sm1.soshiki_name as iraimoto,
							sm2.soshiki_name as iraisaki,
							sm2.soshiki_id,
						    wir.status AS iraisaki_status,
						    wir.seq_no,
							inum.irai_su,
							st.kanryou_su
					FROM work_irai 				wi
					LEFT JOIN soshiki_mst		sm1  ON sm1.soshiki_id = wi.soshiki_id
					LEFT JOIN work_irai_req		wir ON wir.irai_id = wi.irai_id
					LEFT JOIN soshiki_mst		sm2  ON sm2.soshiki_id = wir.soshiki_id
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
					AND wi.irai_id = 160  
					ORDER BY wir.seq_no;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 17:27:10
select distinct a.kaisya_id, a.soshiki_id, a.soshiki_code
,
CASE WHEN length(soshiki_code) > 1 then substring(soshiki_code,1,2) else '' end as level_1
,
CASE WHEN length(soshiki_code) > 3 then substring(soshiki_code,1,4) else '' end as level_2
,
CASE WHEN length(soshiki_code) > 5 then substring(soshiki_code,1,6) else '' end as level_3
,
CASE WHEN length(soshiki_code) > 7 then substring(soshiki_code,1,8) else '' end as level_4
,
CASE WHEN length(soshiki_code) > 9 then substring(soshiki_code,1,10) else '' end as level_5


from
soshiki_mst a;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 17:28:37
select distinct a.kaisya_id, a.soshiki_id, a.soshiki_code
,
CASE WHEN length(soshiki_code) > 1 then substring(soshiki_code,1,2) else '' end as level_1
,
CASE WHEN length(soshiki_code) > 3 then substring(soshiki_code,1,4) else '' end as level_2
,
CASE WHEN length(soshiki_code) > 5 then substring(soshiki_code,1,6) else '' end as level_3
,
CASE WHEN length(soshiki_code) > 7 then substring(soshiki_code,1,8) else '' end as level_4
,
CASE WHEN length(soshiki_code) > 9 then substring(soshiki_code,1,10) else '' end as level_5


from soshiki_mst a
where soshiki_id=279;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 17:29:24
select distinct a.kaisya_id, a.soshiki_id, a.soshiki_code
,
CASE WHEN length(soshiki_code) > 1 then substring(a.soshiki_code,1,2) else '' end as level_1
,
CASE WHEN length(soshiki_code) > 3 then substring(a.soshiki_code,1,4) else '' end as level_2
,
CASE WHEN length(soshiki_code) > 5 then substring(a.soshiki_code,1,6) else '' end as level_3
,
CASE WHEN length(soshiki_code) > 7 then substring(a.soshiki_code,1,8) else '' end as level_4
,
CASE WHEN length(soshiki_code) > 9 then substring(a.soshiki_code,1,10) else '' end as level_5


from soshiki_mst a
where soshiki_id=279;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 17:30:24
select distinct a.kaisya_id, a.soshiki_id, a.soshiki_code
,
CASE WHEN length(soshiki_code) > 1 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,2) and b.kaisya_id = a.kaisya_id) else '' end as level_1
,
CASE WHEN length(soshiki_code) > 3 then substring(a.soshiki_code,1,4) else '' end as level_2
,
CASE WHEN length(soshiki_code) > 5 then substring(a.soshiki_code,1,6) else '' end as level_3
,
CASE WHEN length(soshiki_code) > 7 then substring(a.soshiki_code,1,8) else '' end as level_4
,
CASE WHEN length(soshiki_code) > 9 then substring(a.soshiki_code,1,10) else '' end as level_5


from soshiki_mst a
where soshiki_id=279;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 17:31:01
select distinct a.kaisya_id, a.soshiki_id, a.soshiki_code
,
CASE WHEN length(soshiki_code) > 1 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,2) and b.kaisya_id = a.kaisya_id) else '' end as level_1
,
CASE WHEN length(soshiki_code) > 3 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,4) and b.kaisya_id = a.kaisya_id) else '' end as level_2
,
CASE WHEN length(soshiki_code) > 5 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,6) and b.kaisya_id = a.kaisya_id) else '' end as level_3
,
CASE WHEN length(soshiki_code) > 7 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,8) and b.kaisya_id = a.kaisya_id) else '' end as level_4
,
CASE WHEN length(soshiki_code) > 9 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,10) and b.kaisya_id = a.kaisya_id) else '' end as level_5


from soshiki_mst a
where soshiki_id=279;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 17:31:49
select 

CASE WHEN length(soshiki_code) > 1 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,2) and b.kaisya_id = a.kaisya_id) else '' end as level_1
,
CASE WHEN length(soshiki_code) > 3 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,4) and b.kaisya_id = a.kaisya_id) else '' end as level_2
,
CASE WHEN length(soshiki_code) > 5 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,6) and b.kaisya_id = a.kaisya_id) else '' end as level_3
,
CASE WHEN length(soshiki_code) > 7 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,8) and b.kaisya_id = a.kaisya_id) else '' end as level_4
,
CASE WHEN length(soshiki_code) > 9 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,10) and b.kaisya_id = a.kaisya_id) else '' end as level_5


from soshiki_mst a
where soshiki_id=279;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 17:32:16
select 

(CASE WHEN length(soshiki_code) > 1 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,2) and b.kaisya_id = a.kaisya_id) else '' end) ||

CASE WHEN length(soshiki_code) > 3 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,4) and b.kaisya_id = a.kaisya_id) else '' end as level_2
,
CASE WHEN length(soshiki_code) > 5 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,6) and b.kaisya_id = a.kaisya_id) else '' end as level_3
,
CASE WHEN length(soshiki_code) > 7 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,8) and b.kaisya_id = a.kaisya_id) else '' end as level_4
,
CASE WHEN length(soshiki_code) > 9 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,10) and b.kaisya_id = a.kaisya_id) else '' end as level_5


from soshiki_mst a
where soshiki_id=279;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 17:33:20
select 

(CASE WHEN length(soshiki_code) > 1 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,2) and b.kaisya_id = a.kaisya_id) else '' end) || '　' ||

CASE WHEN length(soshiki_code) > 3 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,4) and b.kaisya_id = a.kaisya_id) else '' end   || '　' ||

CASE WHEN length(soshiki_code) > 5 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,6) and b.kaisya_id = a.kaisya_id) else '' end  || '　' ||

CASE WHEN length(soshiki_code) > 7 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,8) and b.kaisya_id = a.kaisya_id) else '' end  || '　' ||

CASE WHEN length(soshiki_code) > 9 then (select soshiki_name from soshiki_mst b where b.soshiki_code = substring(a.soshiki_code,1,10) and b.kaisya_id = a.kaisya_id) else '' end as soshiki_name


from soshiki_mst a
where soshiki_id=279;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:20:11
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=68;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:20:48
update tehaisaki
set ed_date ='', ed_time=''
where tehaikanri_id=107 and tehai_id=68 and eda_no=2;
--/

--kosyo2@172.20.0.137:5432.kosyo2 18:40:04
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=34;
--/

--kosyo2@172.20.0.137:5432.kosyo2 18:45:12
UPDATE tehaisaki
SET ed_date ='',
					ed_time=''
				WHERE tehaikanri_id=89
					  AND tehai_id=46
					  AND eda_no=1;
--/

--kosyo2@172.20.0.137:5432.kosyo2 18:46:00
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=34;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:46:08
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=34;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:46:24
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=34;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:46:44
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=46;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:47:09
UPDATE tehaisaki
SET ed_date ='',
					ed_time=''
				WHERE tehaikanri_id=89
					  AND tehai_id=46
					  AND eda_no=1;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161116 18:50:49
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=36;
--/

