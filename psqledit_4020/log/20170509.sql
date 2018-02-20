-- psqledit log file
-- date: 2017-05-09

--postgres@172.20.0.137:5432.kosyo_tool_take 14:18:22
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 14:18:49
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 14:19:40
select *
from rireki_kanri r
left join rireki_syousai s on s.rireki_id = r.rireki_id
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 14:19:59
select *
from rireki_kanri r
left join rireki_syousai s on s.rireki_id = r.rireki_id
order by r.rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 14:33:56
select *
from rireki_kanri r
left join rireki_syousai s on s.rireki_id = r.rireki_id
order by r.rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 14:37:58
select *
from rireki_kanri r
left join rireki_syousai s on s.rireki_id = r.rireki_id
order by r.rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 16:21:01
select tanto_id, kaisya_id, soshiki_id, tanto_name, yakusyoku_code, 
	add_date, add_userid, upd_date, upd_userid
from tanto_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 16:21:57
select tanto_id, kaisya_id, soshiki_id, tanto_name, yakusyoku_code, 
	add_date, add_userid, upd_date, upd_userid
from tanto_mst
where soshiki_id = 527;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 16:22:18
select tanto_id, kaisya_id, soshiki_id, tanto_name, yakusyoku_code, 
	add_date, add_userid, upd_date, upd_userid
from tanto_mst
where soshiki_id = 527 and tanto_name ='èüä‘ìcÅ@çv';
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 16:22:28
select tanto_id
from tanto_mst
where soshiki_id = 527 and tanto_name ='èüä‘ìcÅ@çv';
--/

