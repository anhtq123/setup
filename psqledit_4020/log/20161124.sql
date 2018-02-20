-- psqledit log file
-- date: 2016-11-24

--kosyo2@172.20.0.137:5432.kosyo2 09:24:26
select mail_id, kubun, name, naiyou
from mail_template_mst
 ;
--/

--kosyo2@172.20.0.137:5432.kosyo2 09:28:34
SELECT array_to_string(ARRAY
                         (SELECT DISTINCT kb
                          FROM unnest(
							(SELECT string_to_array(
							  (SELECT (array_to_string(ARRAY
								 (SELECT array_to_string(ARRAY
								   (SELECT (lpad(''||gb.gyoumu_kbn, 5, '0')) || '_' || gyoumu_name
									FROM gyoumukubun gb
									WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm
								  FROM tehaisaki th
								  WHERE th.tehaikanri_id = t.tehaikanri_id), 'Å^'))),'Å^'))) AS kb
                          ORDER BY kb),'Å^') AS gyou_kbn
				FROM tehaisakikanri t;
--/

--kosyo2@172.20.0.137:5432.kosyo2 09:32:37
SELECT DISTINCT
					t.tehaikanri_id,
					s.service_code,
					s.service_name,
					f.fuken_name,
					t.kyoten_area,
					t.bikou,
					array_to_string(ARRAY
                         (SELECT DISTINCT kb
                          FROM unnest(
							(SELECT string_to_array(
							  (SELECT (array_to_string(ARRAY
								 (SELECT array_to_string(ARRAY
								   (SELECT (lpad(''||gb.gyoumu_kbn, 5, '0')) || '_' || gyoumu_name
									FROM gyoumukubun gb
									WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm
								  FROM tehaisaki th
								  WHERE th.tehaikanri_id = t.tehaikanri_id), 'Å^'))),'Å^'))) AS kb
                          ORDER BY kb),'Å^') AS gyou_kbn
				FROM tehaisakikanri t
				JOIN service_mst s ON t.service_code = s.service_code
				JOIN fuken_mst f ON t.fuken_code = f.fuken_code 
				LEFT JOIN tehaisaki th ON th.tehaikanri_id = t.tehaikanri_id
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num 
				LEFT JOIN soshiki_mst sm1 ON sm1.soshiki_id = th.syukan_soshiki
				LEFT JOIN soshiki_mst sm2 ON sm2.soshiki_id = ts.soshiki_id 
				WHERE 1=1 
						AND (th.syukan_soshiki IN
							(SELECT soshiki_id
							 FROM soshiki_mst
							 WHERE soshiki_code LIKE
							 (SELECT soshiki_code
							  FROM soshiki_mst
							  WHERE soshiki_id = 2)||'%'  )
						OR ts.soshiki_id IN
							(SELECT soshiki_id
							 FROM soshiki_mst
							 WHERE soshiki_code LIKE
							 (SELECT soshiki_code
							  FROM soshiki_mst
							  WHERE soshiki_id = 2)||'%'  )) AND (th.syukan_soshiki IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,375,376,377,378,49,50,51,63,64,52,65,53,54,55,56,57,58,59,60,61,62,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92)
						OR ts.soshiki_id IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,375,376,377,378,49,50,51,63,64,52,65,53,54,55,56,57,58,59,60,61,62,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92)
						OR ts.soshiki_id IS null
					) 
					AND t.service_code = '01'
					AND t.fuken_code = '27'
					ORDER BY t.tehaikanri_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2 10:00:52
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 10:01:14
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_code ='02'
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 10:01:22
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_code ='01'
;
--/

--kosyo2@172.20.0.137:5432.kosyo2 10:01:34
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_code ='0101'
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:38:07
select kaisya_id, soshiki_id, fuken_code, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_tanto_fuken
where fuken_code='40'
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:39:23
select stf.kaisya_id, stf.soshiki_id, sm.soshiki_code, sm.soshiki_name, stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
where fuken_code='40'
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:55:53
select stf.kaisya_id, km.kaisya_kubun, stf.soshiki_id, sm.soshiki_code, sm.soshiki_name, stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where fuken_code='40'
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:09:39
select block_code, fuken_code, build_code, build_kubun, build_name, 
	ryaku_name, kana_name, admin_code, add_date, add_userid, upd_date, 
	upd_userid, build_tel, build_fax
from build_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:09:52
select distinct build_kubun
from build_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:28:48
select stf.kaisya_id, km.kaisya_kubun, stf.soshiki_id, sm.soshiki_code, sm.soshiki_name, stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where --fuken_code='40'
stf.soshiki_id='372';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:29:28
select stf.kaisya_id, km.kaisya_kubun, stf.soshiki_id, sm.soshiki_code, sm.soshiki_name, stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where 
    fuken_code='40'
    --stf.soshiki_id='372';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:30:03
select stf.kaisya_id, km.kaisya_kubun, stf.soshiki_id, sm.soshiki_code, sm.soshiki_name, stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where 
    --fuken_code='40'
    --stf.soshiki_id='369'
    stf.soshiki_id='370'
    --stf.soshiki_id='371'
    --stf.soshiki_id='372';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:30:35
select stf.kaisya_id, km.kaisya_kubun, stf.soshiki_id, sm.soshiki_code, sm.soshiki_name, stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where 
    --fuken_code='40'
    stf.soshiki_id='369'
    --stf.soshiki_id='370'
    --stf.soshiki_id='371'
    --stf.soshiki_id='372';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:30:53
select stf.kaisya_id, km.kaisya_kubun, stf.soshiki_id, sm.soshiki_code, sm.soshiki_name, stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where 
    --fuken_code='40'
    stf.soshiki_id='369'
    --stf.soshiki_id='370'
    --stf.soshiki_id='371'
    --stf.soshiki_id='372'
order by stf.fuken_code    ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:31:10
select stf.kaisya_id, km.kaisya_kubun, stf.soshiki_id, sm.soshiki_code, sm.soshiki_name, stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where 
    fuken_code='40'
    --stf.soshiki_id='369'
    --stf.soshiki_id='370'
    --stf.soshiki_id='371'
    --stf.soshiki_id='372'
order by stf.fuken_code    ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:32:06
select stf.kaisya_id, km.kaisya_kubun, stf.soshiki_id, sm.soshiki_code, sm.soshiki_name, stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where 
    --fuken_code='40'
    --stf.soshiki_id='369'
    --stf.soshiki_id='370'
    --stf.soshiki_id='371'
    --stf.soshiki_id='372'
    fuken_code in (
    '369',
    '370',
    '371',
    '372'
    )
order by stf.fuken_code    ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:32:33
select stf.kaisya_id, km.kaisya_kubun, stf.soshiki_id, sm.soshiki_code, sm.soshiki_name, stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where 
    --fuken_code='40'
    --stf.soshiki_id='369'
    --stf.soshiki_id='370'
    --stf.soshiki_id='371'
    --stf.soshiki_id='372'
    stf.fuken_code in (
    '369',
    '370',
    '371',
    '372'
    )
order by stf.fuken_code    ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:33:11
select block_code, fuken_code, fuken_name, add_date, add_userid, 
	upd_date, upd_userid
from fuken_mst
where 
fuken_code in (
    '369',
    '370',
    '371',
    '372'
    );
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:33:44
select block_code, fuken_code, fuken_name, add_date, add_userid, 
	upd_date, upd_userid
from fuken_mst;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:34:07
select stf.kaisya_id, km.kaisya_kubun, stf.soshiki_id, sm.soshiki_code, sm.soshiki_name, stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where 
    --fuken_code='40'
    --stf.soshiki_id='369'
    --stf.soshiki_id='370'
    --stf.soshiki_id='371'
    --stf.soshiki_id='372'
    stf.soshiki_id in (
    '369',
    '370',
    '371',
    '372'
    )
order by stf.fuken_code    ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:36:48
select block_code, fuken_code, fuken_name, add_date, add_userid, 
	upd_date, upd_userid
from fuken_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:37:06
select block_code, fuken_code, fuken_name, add_date, add_userid, 
	upd_date, upd_userid
from fuken_mst
order by fuken_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:43:13
select distinct stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where 
    --fuken_code='40'
    --stf.soshiki_id='369'
    --stf.soshiki_id='370'
    --stf.soshiki_id='371'
    --stf.soshiki_id='372'
    stf.soshiki_id in (
    '369',
    '370',
    '371',
    '372'
    )
order by stf.fuken_code    ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:43:24
select distinct stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where 
    --fuken_code='40'
    --stf.soshiki_id='369'
    stf.soshiki_id='370'
    --stf.soshiki_id='371'
    --stf.soshiki_id='372'
--    stf.soshiki_id in (
--    '369',
--    '370',
--    '371',
--    '372'
--    )
order by stf.fuken_code    ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:43:33
select distinct stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where 
    --fuken_code='40'
    --stf.soshiki_id='369'
    --stf.soshiki_id='370'
    stf.soshiki_id='371'
    --stf.soshiki_id='372'
--    stf.soshiki_id in (
--    '369',
--    '370',
--    '371',
--    '372'
--    )
order by stf.fuken_code    ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:43:41
select distinct stf.fuken_code
from soshiki_tanto_fuken stf
left join soshiki_mst sm on sm.soshiki_id = stf.soshiki_id
left join kaisya_mst km on km.kaisya_id = sm.kaisya_id
where 
    --fuken_code='40'
    --stf.soshiki_id='369'
    --stf.soshiki_id='370'
    --stf.soshiki_id='371'
    stf.soshiki_id='372'
--    stf.soshiki_id in (
--    '369',
--    '370',
--    '371',
--    '372'
--    )
order by stf.fuken_code    ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:21:02
select tehaikanri_id, service_code, block_code, fuken_code, 
	kyoten_area, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisakikanri
where 
tehaikanri_id in (71,74,78,82);
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:21:17
delete
from tehaisakikanri
where 
tehaikanri_id in (71,74,78,82);
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:22:10
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki

where 
tehaikanri_id in (71,74,78,82);
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:22:39
delete
from tehaisaki
where 
tehaikanri_id in (71,74,78,82);
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:23:25
delete
from tehaisaki_soshiki
where 
tehai_id in (33,
24,
1,
25);
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:27:08
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
					AND sm.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
					--AND sm.kaisya_id = 1 
					AND wi.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
					--AND wi.kaisya_id = 1  
				ORDER BY wi.kigen, 
						wi.irai_id DESC;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:30:38
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
					AND sm.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
					--AND sm.kaisya_id = 1 
					AND wi.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
					--AND wi.kaisya_id = 1  
				ORDER BY wi.kigen, 
						wi.irai_id DESC;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:30:39
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
					AND sm.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
					--AND sm.kaisya_id = 1 
					AND wi.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
					--AND wi.kaisya_id = 1  
				ORDER BY wi.kigen, 
						wi.irai_id DESC;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:30:39
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
					AND sm.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
					--AND sm.kaisya_id = 1 
					AND wi.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
					--AND wi.kaisya_id = 1  
				ORDER BY wi.kigen, 
						wi.irai_id DESC;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:30:40
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
					AND sm.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
					--AND sm.kaisya_id = 1 
					AND wi.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
					--AND wi.kaisya_id = 1  
				ORDER BY wi.kigen, 
						wi.irai_id DESC;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:30:40
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
					AND sm.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
					--AND sm.kaisya_id = 1 
					AND wi.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
					--AND wi.kaisya_id = 1  
				ORDER BY wi.kigen, 
						wi.irai_id DESC;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 17:30:00
select kaisya_id, soshiki_id, block_code, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_tanto_block
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 17:30:41
select kaisya_id, soshiki_id, block_code, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_tanto_block
where soshiki_id =267;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 17:31:04
select kaisya_id, soshiki_id, fuken_code, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_tanto_fuken
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 17:31:12
select kaisya_id, soshiki_id, fuken_code, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_tanto_fuken
where soshiki_id =267;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:08:34
				SELECT DISTINCT
					t.tehaikanri_id,
					s.service_code,
					s.service_name,
					f.fuken_name,
					t.kyoten_area,
					t.bikou,
					array_to_string(ARRAY
                         (SELECT DISTINCT kb
                          FROM unnest(
							(SELECT string_to_array(
							  (SELECT (array_to_string(ARRAY
								 (SELECT array_to_string(ARRAY
								   (SELECT (lpad(''||gb.gyoumu_kbn, 5, '0')) || '_' || gyoumu_name
									FROM gyoumukubun gb
									WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm
								  FROM tehaisaki th
								  WHERE th.tehaikanri_id = t.tehaikanri_id), 'Å^'))),'Å^'))) AS kb
                          ORDER BY kb),'Å^') AS gyou_kbn
				FROM tehaisakikanri t
				JOIN service_mst s ON t.service_code = s.service_code
				JOIN block_mst bm ON bm.block_code = t.block_code
				JOIN fuken_mst f ON t.fuken_code = f.fuken_code 
				LEFT JOIN tehaisaki th ON th.tehaikanri_id = t.tehaikanri_id
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num 
				LEFT JOIN soshiki_mst sm1 ON sm1.soshiki_id = th.syukan_soshiki
				LEFT JOIN soshiki_mst sm2 ON sm2.soshiki_id = ts.soshiki_id 
				WHERE 1=1 AND bm.block_code IN ('06')  AND (th.syukan_soshiki IN
							(SELECT shm.soshiki_id
							 FROM soshiki_mst shm
						 		WHERE shm.soshiki_code LIKE '0604' || '%' AND shm.kaisya_id = 1 )
						OR ts.soshiki_id IN
							(SELECT shm.soshiki_id
							 FROM soshiki_mst shm
								WHERE shm.soshiki_code LIKE '0604' || '%' AND shm.kaisya_id = 1 )
						OR ts.soshiki_id IS null) AND (th.syukan_soshiki IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
							OR ts.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
							OR ts.soshiki_id IS null
						)  AND t.service_code = '01'  AND t.block_code = '06'  AND t.fuken_code = '40'  ORDER BY t.tehaikanri_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:10:03
				SELECT DISTINCT
					t.tehaikanri_id,
					s.service_code,
					s.service_name,
					f.fuken_name,
					t.kyoten_area,
					t.bikou,
					array_to_string(ARRAY
                         (SELECT DISTINCT kb
                          FROM unnest(
							(SELECT string_to_array(
							  (SELECT (array_to_string(ARRAY
								 (SELECT array_to_string(ARRAY
								   (SELECT (lpad(''||gb.gyoumu_kbn, 5, '0')) || '_' || gyoumu_name
									FROM gyoumukubun gb
									WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm
								  FROM tehaisaki th
								  WHERE th.tehaikanri_id = t.tehaikanri_id), 'Å^'))),'Å^'))) AS kb
                          ORDER BY kb),'Å^') AS gyou_kbn
				FROM tehaisakikanri t
				JOIN service_mst s ON t.service_code = s.service_code
				JOIN block_mst bm ON bm.block_code = t.block_code
				JOIN fuken_mst f ON t.fuken_code = f.fuken_code 
				LEFT JOIN tehaisaki th ON th.tehaikanri_id = t.tehaikanri_id
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num 
				LEFT JOIN soshiki_mst sm1 ON sm1.soshiki_id = th.syukan_soshiki
				LEFT JOIN soshiki_mst sm2 ON sm2.soshiki_id = ts.soshiki_id 
				WHERE 1=1 
				    AND bm.block_code IN ('06')  
				    AND (th.syukan_soshiki IN
							(SELECT shm.soshiki_id
							 FROM soshiki_mst shm
						 		WHERE shm.soshiki_code LIKE '0604' || '%' AND shm.kaisya_id = 1 )
						OR ts.soshiki_id IN
							(SELECT shm.soshiki_id
							 FROM soshiki_mst shm
								WHERE shm.soshiki_code LIKE '0604' || '%' AND shm.kaisya_id = 1 )
						OR ts.soshiki_id IS null) 
				    AND (th.syukan_soshiki IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
							OR ts.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
							OR ts.soshiki_id IS null
						)  
				    AND t.service_code = '01'  
                    AND t.block_code = '06'  
                    AND t.fuken_code = '40'  
                ORDER BY t.tehaikanri_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:11:16
select kaisya_id, soshiki_id, fuken_code, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_tanto_fuken
where soshiki_id=291
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:11:36
select fuken_code
from soshiki_tanto_fuken
where soshiki_id=291
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:12:15
				SELECT DISTINCT
					t.tehaikanri_id,
					s.service_code,
					s.service_name,
					f.fuken_name,
					t.kyoten_area,
					t.bikou,
					array_to_string(ARRAY
                         (SELECT DISTINCT kb
                          FROM unnest(
							(SELECT string_to_array(
							  (SELECT (array_to_string(ARRAY
								 (SELECT array_to_string(ARRAY
								   (SELECT (lpad(''||gb.gyoumu_kbn, 5, '0')) || '_' || gyoumu_name
									FROM gyoumukubun gb
									WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm
								  FROM tehaisaki th
								  WHERE th.tehaikanri_id = t.tehaikanri_id), 'Å^'))),'Å^'))) AS kb
                          ORDER BY kb),'Å^') AS gyou_kbn
				FROM tehaisakikanri t
				JOIN service_mst s ON t.service_code = s.service_code
				JOIN block_mst bm ON bm.block_code = t.block_code
				JOIN fuken_mst f ON t.fuken_code = f.fuken_code 
				LEFT JOIN tehaisaki th ON th.tehaikanri_id = t.tehaikanri_id
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num 
				LEFT JOIN soshiki_mst sm1 ON sm1.soshiki_id = th.syukan_soshiki
				LEFT JOIN soshiki_mst sm2 ON sm2.soshiki_id = ts.soshiki_id 
				WHERE 1=1 
				    AND bm.block_code IN ('06')  
				    AND (th.syukan_soshiki IN
							(SELECT shm.soshiki_id
							 FROM soshiki_mst shm
						 		WHERE shm.soshiki_code LIKE '0604' || '%' AND shm.kaisya_id = 1 )
						OR ts.soshiki_id IN
							(SELECT shm.soshiki_id
							 FROM soshiki_mst shm
								WHERE shm.soshiki_code LIKE '0604' || '%' AND shm.kaisya_id = 1 )
						OR ts.soshiki_id IS null) 
				    AND (th.syukan_soshiki IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
							OR ts.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
							OR ts.soshiki_id IS null
						)  
				    AND t.service_code = '01'  
                    AND t.block_code = '06'  
                    AND t.fuken_code = '40'  
                    AND t.fuken_code = (select fuken_code
                                        from soshiki_tanto_fuken
                                        where soshiki_id=291)
                ORDER BY t.tehaikanri_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:13:09
				SELECT DISTINCT
					t.tehaikanri_id,
					s.service_code,
					s.service_name,
					f.fuken_name,
					t.kyoten_area,
					t.bikou,
					array_to_string(ARRAY
                         (SELECT DISTINCT kb
                          FROM unnest(
							(SELECT string_to_array(
							  (SELECT (array_to_string(ARRAY
								 (SELECT array_to_string(ARRAY
								   (SELECT (lpad(''||gb.gyoumu_kbn, 5, '0')) || '_' || gyoumu_name
									FROM gyoumukubun gb
									WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm
								  FROM tehaisaki th
								  WHERE th.tehaikanri_id = t.tehaikanri_id), 'Å^'))),'Å^'))) AS kb
                          ORDER BY kb),'Å^') AS gyou_kbn
				FROM tehaisakikanri t
				JOIN service_mst s ON t.service_code = s.service_code
				JOIN block_mst bm ON bm.block_code = t.block_code
				JOIN fuken_mst f ON t.fuken_code = f.fuken_code 
				LEFT JOIN tehaisaki th ON th.tehaikanri_id = t.tehaikanri_id
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num 
				LEFT JOIN soshiki_mst sm1 ON sm1.soshiki_id = th.syukan_soshiki
				LEFT JOIN soshiki_mst sm2 ON sm2.soshiki_id = ts.soshiki_id 
				WHERE 1=1 
				    AND bm.block_code IN ('06')  
				    AND (th.syukan_soshiki IN
							(SELECT shm.soshiki_id
							 FROM soshiki_mst shm
						 		WHERE shm.soshiki_code LIKE '0604' || '%' AND shm.kaisya_id = 1 )
						OR ts.soshiki_id IN
							(SELECT shm.soshiki_id
							 FROM soshiki_mst shm
								WHERE shm.soshiki_code LIKE '0604' || '%' AND shm.kaisya_id = 1 )
						OR ts.soshiki_id IS null) 
				    AND (th.syukan_soshiki IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
							OR ts.soshiki_id IN (258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343)
							OR ts.soshiki_id IS null
						)  
				    AND t.service_code = '01'  
                    AND t.block_code = '06'  
                    AND t.fuken_code = '40'  
                    AND t.fuken_code = (select fuken_code
                                        from soshiki_tanto_fuken
                                        where soshiki_id=259)
                ORDER BY t.tehaikanri_id;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:26:31
                                        select fuken_code
                                        from soshiki_tanto_fuken
                                        where soshiki_id=259;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 18:26:49
                                        select fuken_code
                                        from soshiki_tanto_fuken
                                        where soshiki_id=258;
--/

