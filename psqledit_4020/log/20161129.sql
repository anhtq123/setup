-- psqledit log file
-- date: 2016-11-29

--kosyo2@172.20.0.137:5432.kosyo2_20161101 09:42:27
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_id =377;
--/

--kosyo2@172.20.0.137:5432.kosyo2 09:42:44
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_id =377;
--/

--kosyo2@172.20.0.137:5432.kosyo2 10:46:38
select irai_id, soshiki_id, seq_no, status, status_upd_dt, add_date, 
	add_userid, upd_date, upd_userid
from work_irai_req
where irai_id=132;
--/

--kosyo2@172.20.0.137:5432.kosyo2 10:57:03
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
					AND wi.irai_id = 132  
					ORDER BY wir.seq_no;
--/

--kosyo2@172.20.0.137:5432.kosyo2 11:10:07
select tanto_id, kaisya_id, soshiki_id, tanto_name, yakusyoku_code, 
	add_date, add_userid, upd_date, upd_userid
from tanto_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:10:34
select tanto_id, kaisya_id, soshiki_id, tanto_name, yakusyoku_code, 
	add_date, add_userid, upd_date, upd_userid
from tanto_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:11:12
select tanto_id, kaisya_id, soshiki_id, tanto_name, yakusyoku_code, 
	add_date, add_userid, upd_date, upd_userid
from tanto_mst
where tanto_id = 374;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:11:28
select tanto_id, kaisya_id, soshiki_id, tanto_name, yakusyoku_code, 
	add_date, add_userid, upd_date, upd_userid
from tanto_mst
where tanto_id = 374;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:16:22
select max(rireki_id) max from rireki_kanri;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:26:11
select max(rireki_id) max from rireki_kanri;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:32:14
select max(rireki_id) max from rireki_kanri;
--/

--kosyo2@172.20.0.137:5432.kosyo2 11:38:19
select irai_id, soshiki_id, seq_no, status, status_upd_dt, add_date, 
	add_userid, upd_date, upd_userid
from work_irai_req
where irai_id=132;
--/

--kosyo2@172.20.0.137:5432.kosyo2 11:43:02
SELECT tm.tanto_name,
	   sm.soshiki_name,
	   sm.soshiki_id
FROM tanto_mst tm
LEFT JOIN soshiki_mst sm ON sm.soshiki_id = tm.soshiki_id
WHERE tm.tanto_id=406;
--/

--kosyo2@172.20.0.137:5432.kosyo2 11:46:58
SELECT tm.tanto_name, sm.soshiki_name, sm.soshiki_id FROM tanto_mst tm LEFT JOIN soshiki_mst sm ON sm.soshiki_id = tm.soshiki_id WHERE tm.tanto_id=407 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2 11:54:39
SELECT tm.tanto_name, sm.soshiki_name, sm.soshiki_id FROM tanto_mst tm LEFT JOIN soshiki_mst sm ON sm.soshiki_id = tm.soshiki_id WHERE tm.tanto_id=407 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2 11:54:39
SELECT tm.tanto_name, sm.soshiki_name, sm.soshiki_id FROM tanto_mst tm LEFT JOIN soshiki_mst sm ON sm.soshiki_id = tm.soshiki_id WHERE tm.tanto_id=407 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2 12:59:29
SELECT tm.tanto_name, sm.soshiki_name, sm.soshiki_id FROM tanto_mst tm LEFT JOIN soshiki_mst sm ON sm.soshiki_id = tm.soshiki_id WHERE tm.tanto_id=413;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:00:10
SELECT tm.tanto_name, sm.soshiki_name, sm.soshiki_id FROM tanto_mst tm LEFT JOIN soshiki_mst sm ON sm.soshiki_id = tm.soshiki_id WHERE tm.tanto_id=413;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:35:51
				SELECT 	wi.irai_id, 
						wi.title, 
						wi.kigen, 
						wi.irai_houhou, 
						wi.status, 
						wi.status_upd_dt,
						wi.add_date,
						sm1.soshiki_name as iraimoto,
						sm.soshiki_id,
						sm.iraisaki,
						sm.status AS iraisaki_status,
						sm.seq_no,
						inum.irai_su,
						st.kanryou_su
				FROM work_irai 				wi
				LEFT JOIN soshiki_mst		sm1  ON sm1.soshiki_id = wi.soshiki_id
				--LEFT JOIN work_irai_req		wir ON wir.irai_id = wi.irai_id
				LEFT JOIN 
				  (			
				  WITH summary AS (
					SELECT irai_id,
						   s.soshiki_name AS iraisaki,
						   s.soshiki_id,
						   r.seq_no,
						   r.status, 
							   ROW_NUMBER() OVER(PARTITION BY irai_id
													 ORDER BY seq_no) AS rk
					  FROM work_irai_req r
					  LEFT JOIN soshiki_mst s ON r.soshiki_id=s.soshiki_id )
					SELECT s.*
					  FROM summary s
					 WHERE s.rk = 1) sm ON sm.irai_id = wi.irai_id
				LEFT JOIN
					(SELECT req.irai_id,
							count(req.irai_id) AS irai_su
					 FROM work_irai_req req
					 GROUP BY req.irai_id) inum ON wi.irai_id = inum.irai_id
				LEFT JOIN
					(SELECT req.irai_id,
							count(req.status) AS kanryou_su
					 FROM work_irai_req req
					 WHERE req.status >= 12
					 GROUP BY req.irai_id) st ON wi.irai_id = st.irai_id
 
				WHERE 1=1  
				ORDER BY wi.kigen , 
						wi.irai_id ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:38:54
SELECT km.kaisya_name || '　' || (CASE
     WHEN length(soshiki_code) > 1 THEN
            (SELECT soshiki_name
             FROM soshiki_mst b
             WHERE b.soshiki_code = substring(sm1.soshiki_code,1,2)
               AND b.kaisya_id = sm1.kaisya_id)
     ELSE ''
 END) || '　' || CASE
                    WHEN length(soshiki_code) > 3 THEN
                           (SELECT soshiki_name
                            FROM soshiki_mst b
                            WHERE b.soshiki_code = substring(sm1.soshiki_code,1,4)
                              AND b.kaisya_id = sm1.kaisya_id)
                    ELSE ''
                END || '　' || CASE
                                  WHEN length(soshiki_code) > 5 THEN
                                         (SELECT soshiki_name
                                          FROM soshiki_mst b
                                          WHERE b.soshiki_code = substring(sm1.soshiki_code,1,6)
                                            AND b.kaisya_id = sm1.kaisya_id)
                                  ELSE ''
                              END || '　' || CASE
                                                WHEN length(soshiki_code) > 7 THEN
                                                       (SELECT soshiki_name
                                                        FROM soshiki_mst b
                                                        WHERE b.soshiki_code = substring(sm1.soshiki_code,1,8)
                                                          AND b.kaisya_id = sm1.kaisya_id)
                                                ELSE ''
                                            END || '　' || CASE
                                                              WHEN length(soshiki_code) > 9 THEN
                                                                     (SELECT soshiki_name
                                                                      FROM soshiki_mst b
                                                                      WHERE b.soshiki_code = substring(sm1.soshiki_code,1,10)
                                                                        AND b.kaisya_id = sm1.kaisya_id)
                                                              ELSE ''
                                                          END AS soshiki_name
FROM soshiki_mst sm1
LEFT JOIN kaisya_mst km ON km.kaisya_id = sm1.kaisya_id
WHERE soshiki_id=369;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:40:09
				SELECT 	wi.irai_id, 
						wi.title, 
						wi.kigen, 
						wi.irai_houhou, 
						wi.status, 
						wi.status_upd_dt,
						wi.add_date,
						km.kaisya_name || '　' || (CASE
     WHEN length(soshiki_code) > 1 THEN
            (SELECT soshiki_name
             FROM soshiki_mst b
             WHERE b.soshiki_code = substring(sm1.soshiki_code,1,2)
               AND b.kaisya_id = sm1.kaisya_id)
     ELSE ''
 END) || '　' || CASE
                    WHEN length(soshiki_code) > 3 THEN
                           (SELECT soshiki_name
                            FROM soshiki_mst b
                            WHERE b.soshiki_code = substring(sm1.soshiki_code,1,4)
                              AND b.kaisya_id = sm1.kaisya_id)
                    ELSE ''
                END || '　' || CASE
                                  WHEN length(soshiki_code) > 5 THEN
                                         (SELECT soshiki_name
                                          FROM soshiki_mst b
                                          WHERE b.soshiki_code = substring(sm1.soshiki_code,1,6)
                                            AND b.kaisya_id = sm1.kaisya_id)
                                  ELSE ''
                              END || '　' || CASE
                                                WHEN length(soshiki_code) > 7 THEN
                                                       (SELECT soshiki_name
                                                        FROM soshiki_mst b
                                                        WHERE b.soshiki_code = substring(sm1.soshiki_code,1,8)
                                                          AND b.kaisya_id = sm1.kaisya_id)
                                                ELSE ''
                                            END || '　' || CASE
                                                              WHEN length(soshiki_code) > 9 THEN
                                                                     (SELECT soshiki_name
                                                                      FROM soshiki_mst b
                                                                      WHERE b.soshiki_code = substring(sm1.soshiki_code,1,10)
                                                                        AND b.kaisya_id = sm1.kaisya_id)
                                                              ELSE ''
                                                          END AS iraimoto,
						sm.soshiki_id,
						sm.iraisaki,
						sm.status AS iraisaki_status,
						sm.seq_no,
						inum.irai_su,
						st.kanryou_su
				FROM work_irai 				wi
				LEFT JOIN soshiki_mst		sm1  ON sm1.soshiki_id = wi.soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = sm1.kaisya_id

				LEFT JOIN 
				  (			
				  WITH summary AS (
					SELECT irai_id,
						   s.soshiki_name AS iraisaki,
						   s.soshiki_id,
						   r.seq_no,
						   r.status, 
							   ROW_NUMBER() OVER(PARTITION BY irai_id
													 ORDER BY seq_no) AS rk
					  FROM work_irai_req r
					  LEFT JOIN soshiki_mst s ON r.soshiki_id=s.soshiki_id )
					SELECT s.*
					  FROM summary s
					 WHERE s.rk = 1) sm ON sm.irai_id = wi.irai_id
				LEFT JOIN
					(SELECT req.irai_id,
							count(req.irai_id) AS irai_su
					 FROM work_irai_req req
					 GROUP BY req.irai_id) inum ON wi.irai_id = inum.irai_id
				LEFT JOIN
					(SELECT req.irai_id,
							count(req.status) AS kanryou_su
					 FROM work_irai_req req
					 WHERE req.status >= 12
					 GROUP BY req.irai_id) st ON wi.irai_id = st.irai_id
 
				WHERE 1=1  
				ORDER BY wi.kigen , 
						wi.irai_id ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:41:54
SELECT km.kaisya_name || '　' || (CASE
     WHEN length(soshiki_code) > 1 THEN
            (SELECT soshiki_name
             FROM soshiki_mst b
             WHERE b.soshiki_code = substring(s.soshiki_code,1,2)
               AND b.kaisya_id = s.kaisya_id)
     ELSE ''
 END) || '　' || CASE
                    WHEN length(soshiki_code) > 3 THEN
                           (SELECT soshiki_name
                            FROM soshiki_mst b
                            WHERE b.soshiki_code = substring(s.soshiki_code,1,4)
                              AND b.kaisya_id = s.kaisya_id)
                    ELSE ''
                END || '　' || CASE
                                  WHEN length(soshiki_code) > 5 THEN
                                         (SELECT soshiki_name
                                          FROM soshiki_mst b
                                          WHERE b.soshiki_code = substring(s.soshiki_code,1,6)
                                            AND b.kaisya_id = s.kaisya_id)
                                  ELSE ''
                              END || '　' || CASE
                                                WHEN length(soshiki_code) > 7 THEN
                                                       (SELECT soshiki_name
                                                        FROM soshiki_mst b
                                                        WHERE b.soshiki_code = substring(s.soshiki_code,1,8)
                                                          AND b.kaisya_id = s.kaisya_id)
                                                ELSE ''
                                            END || '　' || CASE
                                                              WHEN length(soshiki_code) > 9 THEN
                                                                     (SELECT soshiki_name
                                                                      FROM soshiki_mst b
                                                                      WHERE b.soshiki_code = substring(s.soshiki_code,1,10)
                                                                        AND b.kaisya_id = s.kaisya_id)
                                                              ELSE ''
                                                          END AS soshiki_name
FROM soshiki_mst s
LEFT JOIN kaisya_mst km ON km.kaisya_id = s.kaisya_id
WHERE soshiki_id=369;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:42:31
				SELECT 	wi.irai_id, 
						wi.title, 
						wi.kigen, 
						wi.irai_houhou, 
						wi.status, 
						wi.status_upd_dt,
						wi.add_date,
						km.kaisya_name || '　' || (CASE
     WHEN length(soshiki_code) > 1 THEN
            (SELECT soshiki_name
             FROM soshiki_mst b
             WHERE b.soshiki_code = substring(sm1.soshiki_code,1,2)
               AND b.kaisya_id = sm1.kaisya_id)
     ELSE ''
 END) || '　' || CASE
                    WHEN length(soshiki_code) > 3 THEN
                           (SELECT soshiki_name
                            FROM soshiki_mst b
                            WHERE b.soshiki_code = substring(sm1.soshiki_code,1,4)
                              AND b.kaisya_id = sm1.kaisya_id)
                    ELSE ''
                END || '　' || CASE
                                  WHEN length(soshiki_code) > 5 THEN
                                         (SELECT soshiki_name
                                          FROM soshiki_mst b
                                          WHERE b.soshiki_code = substring(sm1.soshiki_code,1,6)
                                            AND b.kaisya_id = sm1.kaisya_id)
                                  ELSE ''
                              END || '　' || CASE
                                                WHEN length(soshiki_code) > 7 THEN
                                                       (SELECT soshiki_name
                                                        FROM soshiki_mst b
                                                        WHERE b.soshiki_code = substring(sm1.soshiki_code,1,8)
                                                          AND b.kaisya_id = sm1.kaisya_id)
                                                ELSE ''
                                            END || '　' || CASE
                                                              WHEN length(soshiki_code) > 9 THEN
                                                                     (SELECT soshiki_name
                                                                      FROM soshiki_mst b
                                                                      WHERE b.soshiki_code = substring(sm1.soshiki_code,1,10)
                                                                        AND b.kaisya_id = sm1.kaisya_id)
                                                              ELSE ''
                                                          END AS iraimoto,
						sm.soshiki_id,
						sm.iraisaki,
						sm.status AS iraisaki_status,
						sm.seq_no,
						inum.irai_su,
						st.kanryou_su
				FROM work_irai 				wi
				LEFT JOIN soshiki_mst		sm1  ON sm1.soshiki_id = wi.soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = sm1.kaisya_id

				LEFT JOIN 
				  (			
				  WITH summary AS (
					SELECT irai_id,
						   km.kaisya_name || '　' || (CASE
     WHEN length(soshiki_code) > 1 THEN
            (SELECT soshiki_name
             FROM soshiki_mst b
             WHERE b.soshiki_code = substring(s.soshiki_code,1,2)
               AND b.kaisya_id = s.kaisya_id)
     ELSE ''
 END) || '　' || CASE
                    WHEN length(soshiki_code) > 3 THEN
                           (SELECT soshiki_name
                            FROM soshiki_mst b
                            WHERE b.soshiki_code = substring(s.soshiki_code,1,4)
                              AND b.kaisya_id = s.kaisya_id)
                    ELSE ''
                END || '　' || CASE
                                  WHEN length(soshiki_code) > 5 THEN
                                         (SELECT soshiki_name
                                          FROM soshiki_mst b
                                          WHERE b.soshiki_code = substring(s.soshiki_code,1,6)
                                            AND b.kaisya_id = s.kaisya_id)
                                  ELSE ''
                              END || '　' || CASE
                                                WHEN length(soshiki_code) > 7 THEN
                                                       (SELECT soshiki_name
                                                        FROM soshiki_mst b
                                                        WHERE b.soshiki_code = substring(s.soshiki_code,1,8)
                                                          AND b.kaisya_id = s.kaisya_id)
                                                ELSE ''
                                            END || '　' || CASE
                                                              WHEN length(soshiki_code) > 9 THEN
                                                                     (SELECT soshiki_name
                                                                      FROM soshiki_mst b
                                                                      WHERE b.soshiki_code = substring(s.soshiki_code,1,10)
                                                                        AND b.kaisya_id = s.kaisya_id)
                                                              ELSE ''
                                                          END AS  iraisaki,
						   s.soshiki_id,
						   r.seq_no,
						   r.status, 
							   ROW_NUMBER() OVER(PARTITION BY irai_id
													 ORDER BY seq_no) AS rk
					  FROM work_irai_req r
					  LEFT JOIN soshiki_mst s ON r.soshiki_id=s.soshiki_id 
                      LEFT JOIN kaisya_mst km ON km.kaisya_id = s.kaisya_id)
					SELECT s.*
					  FROM summary s
					 WHERE s.rk = 1) sm ON sm.irai_id = wi.irai_id
				LEFT JOIN
					(SELECT req.irai_id,
							count(req.irai_id) AS irai_su
					 FROM work_irai_req req
					 GROUP BY req.irai_id) inum ON wi.irai_id = inum.irai_id
				LEFT JOIN
					(SELECT req.irai_id,
							count(req.status) AS kanryou_su
					 FROM work_irai_req req
					 WHERE req.status >= 12
					 GROUP BY req.irai_id) st ON wi.irai_id = st.irai_id
 
				WHERE 1=1  
				ORDER BY wi.kigen , 
						wi.irai_id ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:49:36
SELECT km.kaisya_name || '　' || (CASE
     WHEN length(soshiki_code) > 1 THEN
            (SELECT soshiki_name
             FROM soshiki_mst b
             WHERE b.soshiki_code = substring(sm2.soshiki_code,1,2)
               AND b.kaisya_id = sm2.kaisya_id)
     ELSE ''
 END) || '　' || CASE
                    WHEN length(soshiki_code) > 3 THEN
                           (SELECT soshiki_name
                            FROM soshiki_mst b
                            WHERE b.soshiki_code = substring(sm2.soshiki_code,1,4)
                              AND b.kaisya_id = sm2.kaisya_id)
                    ELSE ''
                END || '　' || CASE
                                  WHEN length(soshiki_code) > 5 THEN
                                         (SELECT soshiki_name
                                          FROM soshiki_mst b
                                          WHERE b.soshiki_code = substring(sm2.soshiki_code,1,6)
                                            AND b.kaisya_id = sm2.kaisya_id)
                                  ELSE ''
                              END || '　' || CASE
                                                WHEN length(soshiki_code) > 7 THEN
                                                       (SELECT soshiki_name
                                                        FROM soshiki_mst b
                                                        WHERE b.soshiki_code = substring(sm2.soshiki_code,1,8)
                                                          AND b.kaisya_id = sm2.kaisya_id)
                                                ELSE ''
                                            END || '　' || CASE
                                                              WHEN length(soshiki_code) > 9 THEN
                                                                     (SELECT soshiki_name
                                                                      FROM soshiki_mst b
                                                                      WHERE b.soshiki_code = substring(sm2.soshiki_code,1,10)
                                                                        AND b.kaisya_id = sm2.kaisya_id)
                                                              ELSE ''
                                                          END AS soshiki_name
FROM soshiki_mst sm2
LEFT JOIN kaisya_mst km ON km.kaisya_id = sm2.kaisya_id
WHERE soshiki_id=369;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:57:08
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
						AND wi.irai_houhou = '1' 
					ORDER BY wi.kigen, 
						wi.irai_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:57:58
SELECT km.kaisya_name || '　' || (CASE
     WHEN length(soshiki_code) > 1 THEN
            (SELECT soshiki_name
             FROM soshiki_mst b
             WHERE b.soshiki_code = substring(sm2.soshiki_code,1,2)
               AND b.kaisya_id = sm2.kaisya_id)
     ELSE ''
 END) || '　' || CASE
                    WHEN length(soshiki_code) > 3 THEN
                           (SELECT soshiki_name
                            FROM soshiki_mst b
                            WHERE b.soshiki_code = substring(sm2.soshiki_code,1,4)
                              AND b.kaisya_id = sm2.kaisya_id)
                    ELSE ''
                END || '　' || CASE
                                  WHEN length(soshiki_code) > 5 THEN
                                         (SELECT soshiki_name
                                          FROM soshiki_mst b
                                          WHERE b.soshiki_code = substring(sm2.soshiki_code,1,6)
                                            AND b.kaisya_id = sm2.kaisya_id)
                                  ELSE ''
                              END || '　' || CASE
                                                WHEN length(soshiki_code) > 7 THEN
                                                       (SELECT soshiki_name
                                                        FROM soshiki_mst b
                                                        WHERE b.soshiki_code = substring(sm2.soshiki_code,1,8)
                                                          AND b.kaisya_id = sm2.kaisya_id)
                                                ELSE ''
                                            END || '　' || CASE
                                                              WHEN length(soshiki_code) > 9 THEN
                                                                     (SELECT soshiki_name
                                                                      FROM soshiki_mst b
                                                                      WHERE b.soshiki_code = substring(sm2.soshiki_code,1,10)
                                                                        AND b.kaisya_id = sm2.kaisya_id)
                                                              ELSE ''
                                                          END AS soshiki_name
FROM soshiki_mst sm2
LEFT JOIN kaisya_mst km ON km.kaisya_id = sm2.kaisya_id
WHERE soshiki_id=369;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:58:07
SELECT km2.kaisya_name || '　' || (CASE
     WHEN length(soshiki_code) > 1 THEN
            (SELECT soshiki_name
             FROM soshiki_mst b
             WHERE b.soshiki_code = substring(sm2.soshiki_code,1,2)
               AND b.kaisya_id = sm2.kaisya_id)
     ELSE ''
 END) || '　' || CASE
                    WHEN length(soshiki_code) > 3 THEN
                           (SELECT soshiki_name
                            FROM soshiki_mst b
                            WHERE b.soshiki_code = substring(sm2.soshiki_code,1,4)
                              AND b.kaisya_id = sm2.kaisya_id)
                    ELSE ''
                END || '　' || CASE
                                  WHEN length(soshiki_code) > 5 THEN
                                         (SELECT soshiki_name
                                          FROM soshiki_mst b
                                          WHERE b.soshiki_code = substring(sm2.soshiki_code,1,6)
                                            AND b.kaisya_id = sm2.kaisya_id)
                                  ELSE ''
                              END || '　' || CASE
                                                WHEN length(soshiki_code) > 7 THEN
                                                       (SELECT soshiki_name
                                                        FROM soshiki_mst b
                                                        WHERE b.soshiki_code = substring(sm2.soshiki_code,1,8)
                                                          AND b.kaisya_id = sm2.kaisya_id)
                                                ELSE ''
                                            END || '　' || CASE
                                                              WHEN length(soshiki_code) > 9 THEN
                                                                     (SELECT soshiki_name
                                                                      FROM soshiki_mst b
                                                                      WHERE b.soshiki_code = substring(sm2.soshiki_code,1,10)
                                                                        AND b.kaisya_id = sm2.kaisya_id)
                                                              ELSE ''
                                                          END AS soshiki_name
FROM soshiki_mst sm2
LEFT JOIN kaisya_mst km2 ON km2.kaisya_id = sm2.kaisya_id
WHERE soshiki_id=369;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:58:52
SELECT km2.kaisya_name || '　' || (CASE
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
                                                          END AS soshiki_name
FROM soshiki_mst sm2
LEFT JOIN kaisya_mst km2 ON km2.kaisya_id = sm2.kaisya_id
WHERE soshiki_id=369;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:59:31
					SELECT 	wi.irai_id, 
							wi.title, 
							wi.kigen, 
							wi.irai_houhou, 
							wi.status, 
							wi.status_upd_dt,
							wi.add_date,
							sm1.soshiki_name as iraimoto,
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
					LEFT JOIN work_irai_req		wir ON wir.irai_id = wi.irai_id
					LEFT JOIN soshiki_mst		sm2  ON sm2.soshiki_id = wir.soshiki_id
                    LEFT JOIN kaisya_mst km2 ON km2.kaisya_id = sm2.kaisya_id
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

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:01:13
SELECT km1.kaisya_name || '　' || (CASE
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
                                                          END AS soshiki_name
FROM soshiki_mst sm1
LEFT JOIN kaisya_mst km1 ON km1.kaisya_id = sm1.kaisya_id
WHERE soshiki_id=369;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:14:03
SELECT km.kaisya_name || '　' || (CASE
     WHEN length(sm.soshiki_code) > 1 THEN
            (SELECT soshiki_name
             FROM soshiki_mst b
             WHERE b.soshiki_code = substring(sm.soshiki_code,1,2)
               AND b.kaisya_id = sm.kaisya_id)
     ELSE ''
 END) || '　' || CASE
                    WHEN length(sm.soshiki_code) > 3 THEN
                           (SELECT soshiki_name
                            FROM soshiki_mst b
                            WHERE b.soshiki_code = substring(sm.soshiki_code,1,4)
                              AND b.kaisya_id = sm.kaisya_id)
                    ELSE ''
                END || '　' || CASE
                                  WHEN length(sm.soshiki_code) > 5 THEN
                                         (SELECT soshiki_name
                                          FROM soshiki_mst b
                                          WHERE b.soshiki_code = substring(sm.soshiki_code,1,6)
                                            AND b.kaisya_id = sm.kaisya_id)
                                  ELSE ''
                              END || '　' || CASE
                                                WHEN length(sm.soshiki_code) > 7 THEN
                                                       (SELECT soshiki_name
                                                        FROM soshiki_mst b
                                                        WHERE b.soshiki_code = substring(sm.soshiki_code,1,8)
                                                          AND b.kaisya_id = sm.kaisya_id)
                                                ELSE ''
                                            END || '　' || CASE
                                                              WHEN length(sm.soshiki_code) > 9 THEN
                                                                     (SELECT soshiki_name
                                                                      FROM soshiki_mst b
                                                                      WHERE b.soshiki_code = substring(sm.soshiki_code,1,10)
                                                                        AND b.kaisya_id = sm.kaisya_id)
                                                              ELSE ''
                                                          END AS soshiki_name
FROM soshiki_mst sm
LEFT JOIN kaisya_mst km ON km.kaisya_id = sm.kaisya_id
WHERE soshiki_id=369;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:26:14
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:33:09
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:33:24
	SELECT km.kaisya_name || '　' || (CASE
										 WHEN length(sm.soshiki_code) > 1 THEN
												(SELECT soshiki_name
												 FROM soshiki_mst b
												 WHERE b.soshiki_code = substring(sm.soshiki_code,1,2)
												   AND b.kaisya_id = sm.kaisya_id)
										 ELSE ''
									 END) || '　' || CASE
														WHEN length(sm.soshiki_code) > 3 THEN
															   (SELECT soshiki_name
																FROM soshiki_mst b
																WHERE b.soshiki_code = substring(sm.soshiki_code,1,4)
																  AND b.kaisya_id = sm.kaisya_id)
														ELSE ''
													END || '　' || CASE
																	  WHEN length(sm.soshiki_code) > 5 THEN
																			 (SELECT soshiki_name
																			  FROM soshiki_mst b
																			  WHERE b.soshiki_code = substring(sm.soshiki_code,1,6)
																				AND b.kaisya_id = sm.kaisya_id)
																	  ELSE ''
																  END || '　' || CASE
																					WHEN length(sm.soshiki_code) > 7 THEN
																						   (SELECT soshiki_name
																							FROM soshiki_mst b
																							WHERE b.soshiki_code = substring(sm.soshiki_code,1,8)
																							  AND b.kaisya_id = sm.kaisya_id)
																					ELSE ''
																				END || '　' || CASE
																								  WHEN length(sm.soshiki_code) > 9 THEN
																										 (SELECT soshiki_name
																										  FROM soshiki_mst b
																										  WHERE b.soshiki_code = substring(sm.soshiki_code,1,10)
																											AND b.kaisya_id = sm.kaisya_id)
																								  ELSE ''
																							  END AS iraimoto_soshiki_nm,
										   wi.title AS irai_title,
										   wi.naiyou AS irai_naiyo,
										   wi.upd_naiyou as irai_naiyo_henko,
										   CASE WHEN wi.service_code = '00' then 'すべて' else 
											CASE WHEN wi.service_code = '01' then '専用系' else 
											 CASE WHEN wi.service_code = '02' then 'イーサ系' else 
												CASE WHEN wi.service_code = '03' then 'ＤＦ／ＦＦ' else 
													CASE WHEN wi.service_code = '04' then 'ＳＡ' else 'フレッツ系' 
													end 
												end  
											 end 
											end 
										  end as service_nm,
										   CASE WHEN wi.kubun = '1' then '通常' else '期間限定' end as tehai_kubun_nm,
										   wi.kigen
									FROM work_irai wi
									LEFT JOIN soshiki_mst sm ON sm.soshiki_id = wi.soshiki_id
									LEFT JOIN kaisya_mst  km ON km.kaisya_id = sm.kaisya_id
									WHERE irai_id=162;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:36:09
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:36:10
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:36:10
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:36:10
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:36:10
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:36:11
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:36:15
	SELECT km.kaisya_name || '　' || (CASE
										 WHEN length(sm.soshiki_code) > 1 THEN
												(SELECT soshiki_name
												 FROM soshiki_mst b
												 WHERE b.soshiki_code = substring(sm.soshiki_code,1,2)
												   AND b.kaisya_id = sm.kaisya_id)
										 ELSE ''
									 END) || '　' || CASE
														WHEN length(sm.soshiki_code) > 3 THEN
															   (SELECT soshiki_name
																FROM soshiki_mst b
																WHERE b.soshiki_code = substring(sm.soshiki_code,1,4)
																  AND b.kaisya_id = sm.kaisya_id)
														ELSE ''
													END || '　' || CASE
																	  WHEN length(sm.soshiki_code) > 5 THEN
																			 (SELECT soshiki_name
																			  FROM soshiki_mst b
																			  WHERE b.soshiki_code = substring(sm.soshiki_code,1,6)
																				AND b.kaisya_id = sm.kaisya_id)
																	  ELSE ''
																  END || '　' || CASE
																					WHEN length(sm.soshiki_code) > 7 THEN
																						   (SELECT soshiki_name
																							FROM soshiki_mst b
																							WHERE b.soshiki_code = substring(sm.soshiki_code,1,8)
																							  AND b.kaisya_id = sm.kaisya_id)
																					ELSE ''
																				END || '　' || CASE
																								  WHEN length(sm.soshiki_code) > 9 THEN
																										 (SELECT soshiki_name
																										  FROM soshiki_mst b
																										  WHERE b.soshiki_code = substring(sm.soshiki_code,1,10)
																											AND b.kaisya_id = sm.kaisya_id)
																								  ELSE ''
																							  END AS iraimoto_soshiki_nm,
										   wi.title AS irai_title,
										   wi.naiyou AS irai_naiyo,
										   wi.upd_naiyou as irai_naiyo_henko,
										   CASE WHEN wi.service_code = '00' then 'すべて' else 
											CASE WHEN wi.service_code = '01' then '専用系' else 
											 CASE WHEN wi.service_code = '02' then 'イーサ系' else 
												CASE WHEN wi.service_code = '03' then 'ＤＦ／ＦＦ' else 
													CASE WHEN wi.service_code = '04' then 'ＳＡ' else 'フレッツ系' 
													end 
												end  
											 end 
											end 
										  end as service_nm,
										   CASE WHEN wi.kubun = '1' then '通常' else '期間限定' end as tehai_kubun_nm,
										   wi.kigen
									FROM work_irai wi
									LEFT JOIN soshiki_mst sm ON sm.soshiki_id = wi.soshiki_id
									LEFT JOIN kaisya_mst  km ON km.kaisya_id = sm.kaisya_id
									WHERE irai_id=162;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:36:15
	SELECT km.kaisya_name || '　' || (CASE
										 WHEN length(sm.soshiki_code) > 1 THEN
												(SELECT soshiki_name
												 FROM soshiki_mst b
												 WHERE b.soshiki_code = substring(sm.soshiki_code,1,2)
												   AND b.kaisya_id = sm.kaisya_id)
										 ELSE ''
									 END) || '　' || CASE
														WHEN length(sm.soshiki_code) > 3 THEN
															   (SELECT soshiki_name
																FROM soshiki_mst b
																WHERE b.soshiki_code = substring(sm.soshiki_code,1,4)
																  AND b.kaisya_id = sm.kaisya_id)
														ELSE ''
													END || '　' || CASE
																	  WHEN length(sm.soshiki_code) > 5 THEN
																			 (SELECT soshiki_name
																			  FROM soshiki_mst b
																			  WHERE b.soshiki_code = substring(sm.soshiki_code,1,6)
																				AND b.kaisya_id = sm.kaisya_id)
																	  ELSE ''
																  END || '　' || CASE
																					WHEN length(sm.soshiki_code) > 7 THEN
																						   (SELECT soshiki_name
																							FROM soshiki_mst b
																							WHERE b.soshiki_code = substring(sm.soshiki_code,1,8)
																							  AND b.kaisya_id = sm.kaisya_id)
																					ELSE ''
																				END || '　' || CASE
																								  WHEN length(sm.soshiki_code) > 9 THEN
																										 (SELECT soshiki_name
																										  FROM soshiki_mst b
																										  WHERE b.soshiki_code = substring(sm.soshiki_code,1,10)
																											AND b.kaisya_id = sm.kaisya_id)
																								  ELSE ''
																							  END AS iraimoto_soshiki_nm,
										   wi.title AS irai_title,
										   wi.naiyou AS irai_naiyo,
										   wi.upd_naiyou as irai_naiyo_henko,
										   CASE WHEN wi.service_code = '00' then 'すべて' else 
											CASE WHEN wi.service_code = '01' then '専用系' else 
											 CASE WHEN wi.service_code = '02' then 'イーサ系' else 
												CASE WHEN wi.service_code = '03' then 'ＤＦ／ＦＦ' else 
													CASE WHEN wi.service_code = '04' then 'ＳＡ' else 'フレッツ系' 
													end 
												end  
											 end 
											end 
										  end as service_nm,
										   CASE WHEN wi.kubun = '1' then '通常' else '期間限定' end as tehai_kubun_nm,
										   wi.kigen
									FROM work_irai wi
									LEFT JOIN soshiki_mst sm ON sm.soshiki_id = wi.soshiki_id
									LEFT JOIN kaisya_mst  km ON km.kaisya_id = sm.kaisya_id
									WHERE irai_id=162;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:36:15
	SELECT km.kaisya_name || '　' || (CASE
										 WHEN length(sm.soshiki_code) > 1 THEN
												(SELECT soshiki_name
												 FROM soshiki_mst b
												 WHERE b.soshiki_code = substring(sm.soshiki_code,1,2)
												   AND b.kaisya_id = sm.kaisya_id)
										 ELSE ''
									 END) || '　' || CASE
														WHEN length(sm.soshiki_code) > 3 THEN
															   (SELECT soshiki_name
																FROM soshiki_mst b
																WHERE b.soshiki_code = substring(sm.soshiki_code,1,4)
																  AND b.kaisya_id = sm.kaisya_id)
														ELSE ''
													END || '　' || CASE
																	  WHEN length(sm.soshiki_code) > 5 THEN
																			 (SELECT soshiki_name
																			  FROM soshiki_mst b
																			  WHERE b.soshiki_code = substring(sm.soshiki_code,1,6)
																				AND b.kaisya_id = sm.kaisya_id)
																	  ELSE ''
																  END || '　' || CASE
																					WHEN length(sm.soshiki_code) > 7 THEN
																						   (SELECT soshiki_name
																							FROM soshiki_mst b
																							WHERE b.soshiki_code = substring(sm.soshiki_code,1,8)
																							  AND b.kaisya_id = sm.kaisya_id)
																					ELSE ''
																				END || '　' || CASE
																								  WHEN length(sm.soshiki_code) > 9 THEN
																										 (SELECT soshiki_name
																										  FROM soshiki_mst b
																										  WHERE b.soshiki_code = substring(sm.soshiki_code,1,10)
																											AND b.kaisya_id = sm.kaisya_id)
																								  ELSE ''
																							  END AS iraimoto_soshiki_nm,
										   wi.title AS irai_title,
										   wi.naiyou AS irai_naiyo,
										   wi.upd_naiyou as irai_naiyo_henko,
										   CASE WHEN wi.service_code = '00' then 'すべて' else 
											CASE WHEN wi.service_code = '01' then '専用系' else 
											 CASE WHEN wi.service_code = '02' then 'イーサ系' else 
												CASE WHEN wi.service_code = '03' then 'ＤＦ／ＦＦ' else 
													CASE WHEN wi.service_code = '04' then 'ＳＡ' else 'フレッツ系' 
													end 
												end  
											 end 
											end 
										  end as service_nm,
										   CASE WHEN wi.kubun = '1' then '通常' else '期間限定' end as tehai_kubun_nm,
										   wi.kigen
									FROM work_irai wi
									LEFT JOIN soshiki_mst sm ON sm.soshiki_id = wi.soshiki_id
									LEFT JOIN kaisya_mst  km ON km.kaisya_id = sm.kaisya_id
									WHERE irai_id=162;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:36:16
	SELECT km.kaisya_name || '　' || (CASE
										 WHEN length(sm.soshiki_code) > 1 THEN
												(SELECT soshiki_name
												 FROM soshiki_mst b
												 WHERE b.soshiki_code = substring(sm.soshiki_code,1,2)
												   AND b.kaisya_id = sm.kaisya_id)
										 ELSE ''
									 END) || '　' || CASE
														WHEN length(sm.soshiki_code) > 3 THEN
															   (SELECT soshiki_name
																FROM soshiki_mst b
																WHERE b.soshiki_code = substring(sm.soshiki_code,1,4)
																  AND b.kaisya_id = sm.kaisya_id)
														ELSE ''
													END || '　' || CASE
																	  WHEN length(sm.soshiki_code) > 5 THEN
																			 (SELECT soshiki_name
																			  FROM soshiki_mst b
																			  WHERE b.soshiki_code = substring(sm.soshiki_code,1,6)
																				AND b.kaisya_id = sm.kaisya_id)
																	  ELSE ''
																  END || '　' || CASE
																					WHEN length(sm.soshiki_code) > 7 THEN
																						   (SELECT soshiki_name
																							FROM soshiki_mst b
																							WHERE b.soshiki_code = substring(sm.soshiki_code,1,8)
																							  AND b.kaisya_id = sm.kaisya_id)
																					ELSE ''
																				END || '　' || CASE
																								  WHEN length(sm.soshiki_code) > 9 THEN
																										 (SELECT soshiki_name
																										  FROM soshiki_mst b
																										  WHERE b.soshiki_code = substring(sm.soshiki_code,1,10)
																											AND b.kaisya_id = sm.kaisya_id)
																								  ELSE ''
																							  END AS iraimoto_soshiki_nm,
										   wi.title AS irai_title,
										   wi.naiyou AS irai_naiyo,
										   wi.upd_naiyou as irai_naiyo_henko,
										   CASE WHEN wi.service_code = '00' then 'すべて' else 
											CASE WHEN wi.service_code = '01' then '専用系' else 
											 CASE WHEN wi.service_code = '02' then 'イーサ系' else 
												CASE WHEN wi.service_code = '03' then 'ＤＦ／ＦＦ' else 
													CASE WHEN wi.service_code = '04' then 'ＳＡ' else 'フレッツ系' 
													end 
												end  
											 end 
											end 
										  end as service_nm,
										   CASE WHEN wi.kubun = '1' then '通常' else '期間限定' end as tehai_kubun_nm,
										   wi.kigen
									FROM work_irai wi
									LEFT JOIN soshiki_mst sm ON sm.soshiki_id = wi.soshiki_id
									LEFT JOIN kaisya_mst  km ON km.kaisya_id = sm.kaisya_id
									WHERE irai_id=162;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:36:16
	SELECT km.kaisya_name || '　' || (CASE
										 WHEN length(sm.soshiki_code) > 1 THEN
												(SELECT soshiki_name
												 FROM soshiki_mst b
												 WHERE b.soshiki_code = substring(sm.soshiki_code,1,2)
												   AND b.kaisya_id = sm.kaisya_id)
										 ELSE ''
									 END) || '　' || CASE
														WHEN length(sm.soshiki_code) > 3 THEN
															   (SELECT soshiki_name
																FROM soshiki_mst b
																WHERE b.soshiki_code = substring(sm.soshiki_code,1,4)
																  AND b.kaisya_id = sm.kaisya_id)
														ELSE ''
													END || '　' || CASE
																	  WHEN length(sm.soshiki_code) > 5 THEN
																			 (SELECT soshiki_name
																			  FROM soshiki_mst b
																			  WHERE b.soshiki_code = substring(sm.soshiki_code,1,6)
																				AND b.kaisya_id = sm.kaisya_id)
																	  ELSE ''
																  END || '　' || CASE
																					WHEN length(sm.soshiki_code) > 7 THEN
																						   (SELECT soshiki_name
																							FROM soshiki_mst b
																							WHERE b.soshiki_code = substring(sm.soshiki_code,1,8)
																							  AND b.kaisya_id = sm.kaisya_id)
																					ELSE ''
																				END || '　' || CASE
																								  WHEN length(sm.soshiki_code) > 9 THEN
																										 (SELECT soshiki_name
																										  FROM soshiki_mst b
																										  WHERE b.soshiki_code = substring(sm.soshiki_code,1,10)
																											AND b.kaisya_id = sm.kaisya_id)
																								  ELSE ''
																							  END AS iraimoto_soshiki_nm,
										   wi.title AS irai_title,
										   wi.naiyou AS irai_naiyo,
										   wi.upd_naiyou as irai_naiyo_henko,
										   CASE WHEN wi.service_code = '00' then 'すべて' else 
											CASE WHEN wi.service_code = '01' then '専用系' else 
											 CASE WHEN wi.service_code = '02' then 'イーサ系' else 
												CASE WHEN wi.service_code = '03' then 'ＤＦ／ＦＦ' else 
													CASE WHEN wi.service_code = '04' then 'ＳＡ' else 'フレッツ系' 
													end 
												end  
											 end 
											end 
										  end as service_nm,
										   CASE WHEN wi.kubun = '1' then '通常' else '期間限定' end as tehai_kubun_nm,
										   wi.kigen
									FROM work_irai wi
									LEFT JOIN soshiki_mst sm ON sm.soshiki_id = wi.soshiki_id
									LEFT JOIN kaisya_mst  km ON km.kaisya_id = sm.kaisya_id
									WHERE irai_id=162;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:37:41
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 14:40:24
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:40:35
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:48:59
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:49:00
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:49:02
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:49:04
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:49:05
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:49:05
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:49:05
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:49:05
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:52:24
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:52:24
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:52:25
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:52:25
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:52:25
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:52:25
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:52:55
select irai_id, title, naiyou, upd_naiyou, kigen, soshiki_id, 
	irai_houhou, service_code, timezone_code, kubun, send_houhou, 
	send_date, send_time, status, status_upd_dt, add_date, add_userid, 
	upd_date, upd_userid
from work_irai
where irai_id=115;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:56:30
select irai_id, scheduler_date
from mail_scheduler;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 14:56:37
select irai_id, scheduler_date
from mail_scheduler;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:04:15
select irai_id, scheduler_date
from mail_scheduler
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:08:12
select irai_id, scheduler_date
from mail_scheduler
;
--/

