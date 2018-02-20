-- psqledit log file
-- date: 2017-06-16

--postgres@172.20.0.137:5432.kosyo_tool_take 09:42:27
select kaisya_id, kaisya_name, kaisya_kubun, disp_no, add_date, 
	add_userid, upd_date, upd_userid
from kaisya_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 09:46:13
SELECT DISTINCT x.kaisya_id,
                x.kaisya_kubun,
                x.disp_no,
                x.kaisya_name
FROM
  (SELECT DISTINCT k.kaisya_id,
                   k.kaisya_kubun,
                   k.disp_no,
                   k.kaisya_name
   FROM kaisya_mst k
   WHERE 1=1
   ORDER BY k.kaisya_kubun,
            k.disp_no,
            k.kaisya_name) x
LEFT JOIN user_mst u ON x.kaisya_id = u.kaisya_id
WHERE u.user_useauthority = '4';
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 09:46:39
SELECT DISTINCT x.kaisya_id,
                x.kaisya_kubun,
                x.disp_no,
                x.kaisya_name
FROM
  (SELECT DISTINCT k.kaisya_id,
                   k.kaisya_kubun,
                   k.disp_no,
                   k.kaisya_name
   FROM kaisya_mst k
   WHERE 1=1
   ) x
LEFT JOIN user_mst u ON x.kaisya_id = u.kaisya_id
WHERE u.user_useauthority = '4'
ORDER BY x.kaisya_kubun,
            x.disp_no,
            x.kaisya_name;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 09:50:53
SELECT DISTINCT x.kaisya_id, x.kaisya_kubun, x.disp_no, x.kaisya_name FROM ( SELECT DISTINCT k.kaisya_id, k.kaisya_kubun, k.disp_no, k.kaisya_name FROM kaisya_mst k WHERE 1=1 ) x LEFT JOIN user_mst u ON x.kaisya_id = u.kaisya_id WHERE u.user_useauthority = '4' ORDER BY x.kaisya_kubun, x.disp_no, x.kaisya_name;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 09:50:54
SELECT DISTINCT x.kaisya_id, x.kaisya_kubun, x.disp_no, x.kaisya_name FROM ( SELECT DISTINCT k.kaisya_id, k.kaisya_kubun, k.disp_no, k.kaisya_name FROM kaisya_mst k WHERE 1=1 ) x LEFT JOIN user_mst u ON x.kaisya_id = u.kaisya_id WHERE u.user_useauthority = '4' ORDER BY x.kaisya_kubun, x.disp_no, x.kaisya_name;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 09:50:54
SELECT DISTINCT x.kaisya_id, x.kaisya_kubun, x.disp_no, x.kaisya_name FROM ( SELECT DISTINCT k.kaisya_id, k.kaisya_kubun, k.disp_no, k.kaisya_name FROM kaisya_mst k WHERE 1=1 ) x LEFT JOIN user_mst u ON x.kaisya_id = u.kaisya_id WHERE u.user_useauthority = '4' ORDER BY x.kaisya_kubun, x.disp_no, x.kaisya_name;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 09:50:54
SELECT DISTINCT x.kaisya_id, x.kaisya_kubun, x.disp_no, x.kaisya_name FROM ( SELECT DISTINCT k.kaisya_id, k.kaisya_kubun, k.disp_no, k.kaisya_name FROM kaisya_mst k WHERE 1=1 ) x LEFT JOIN user_mst u ON x.kaisya_id = u.kaisya_id WHERE u.user_useauthority = '4' ORDER BY x.kaisya_kubun, x.disp_no, x.kaisya_name;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 09:50:55
SELECT DISTINCT x.kaisya_id, x.kaisya_kubun, x.disp_no, x.kaisya_name FROM ( SELECT DISTINCT k.kaisya_id, k.kaisya_kubun, k.disp_no, k.kaisya_name FROM kaisya_mst k WHERE 1=1 ) x LEFT JOIN user_mst u ON x.kaisya_id = u.kaisya_id WHERE u.user_useauthority = '4' ORDER BY x.kaisya_kubun, x.disp_no, x.kaisya_name;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 09:50:55
SELECT DISTINCT x.kaisya_id, x.kaisya_kubun, x.disp_no, x.kaisya_name FROM ( SELECT DISTINCT k.kaisya_id, k.kaisya_kubun, k.disp_no, k.kaisya_name FROM kaisya_mst k WHERE 1=1 ) x LEFT JOIN user_mst u ON x.kaisya_id = u.kaisya_id WHERE u.user_useauthority = '4' ORDER BY x.kaisya_kubun, x.disp_no, x.kaisya_name;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 09:50:56
SELECT DISTINCT x.kaisya_id, x.kaisya_kubun, x.disp_no, x.kaisya_name FROM ( SELECT DISTINCT k.kaisya_id, k.kaisya_kubun, k.disp_no, k.kaisya_name FROM kaisya_mst k WHERE 1=1 ) x LEFT JOIN user_mst u ON x.kaisya_id = u.kaisya_id WHERE u.user_useauthority = '4' ORDER BY x.kaisya_kubun, x.disp_no, x.kaisya_name;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 09:50:56
SELECT DISTINCT x.kaisya_id, x.kaisya_kubun, x.disp_no, x.kaisya_name FROM ( SELECT DISTINCT k.kaisya_id, k.kaisya_kubun, k.disp_no, k.kaisya_name FROM kaisya_mst k WHERE 1=1 ) x LEFT JOIN user_mst u ON x.kaisya_id = u.kaisya_id WHERE u.user_useauthority = '4' ORDER BY x.kaisya_kubun, x.disp_no, x.kaisya_name;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 09:50:56
SELECT DISTINCT x.kaisya_id, x.kaisya_kubun, x.disp_no, x.kaisya_name FROM ( SELECT DISTINCT k.kaisya_id, k.kaisya_kubun, k.disp_no, k.kaisya_name FROM kaisya_mst k WHERE 1=1 ) x LEFT JOIN user_mst u ON x.kaisya_id = u.kaisya_id WHERE u.user_useauthority = '4' ORDER BY x.kaisya_kubun, x.disp_no, x.kaisya_name;
--/

--postgres@172.20.0.137:5432.kosyo_tool_take 13:31:15
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170616 13:34:23
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170616 13:34:57
update user_mst
set user_password='c6922b6ba9e0939583f973bc1682493351ad4fe8'
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170616 13:44:02
select kaisya_id, soshiki_id, block_code, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_tanto_block
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170616 13:47:59
select kaisya_id, soshiki_id, block_code, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_tanto_block
;
--/

