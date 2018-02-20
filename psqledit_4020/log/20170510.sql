-- psqledit log file
-- date: 2017-05-10

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:26:37
SELECT soshiki_name
					FROM soshiki_mst
					WHERE soshiki_id=
						(SELECT soshiki_id
						FROM user_mst
						WHERE user_id ='kanri2');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:26:53
SELECT soshiki_name
FROM soshiki_mst
WHERE soshiki_id=
	(SELECT soshiki_id
	FROM user_mst
	WHERE user_id ='kanri2');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:47:05
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:50:25
SELECT soshiki_name
					FROM soshiki_mst
					WHERE soshiki_id=
						(SELECT soshiki_id
						FROM user_mst
						WHERE user_id ='5715015');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:50:38
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:51:05
INSERT INTO rireki_kanri (
				rireki_date,
				gamen_id,
				soshiki_id,
				tanto_id,
				soshiki_name,
				tantou_name,
				tehaikanri_id,
				tehai_id,
				eda_no,
				irai_id,
				userid)
				VALUES(
		       	'2017-05-10 09:48:32',
		       	22,
		       	647,
		       	null,
		       	'宅内担当',
		       	'地村　健二',
		       	null,
		       	null,
		       	null,
		       	null,
				'5715015') ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:51:47
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:53:03
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:53:13
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri
order by rireki_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:53:17
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri
order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:54:01
delete 
from rireki_kanri
where rireki_id in (706,707,708,709);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:54:14
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri
order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:57:57
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri
order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:39:22
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri
order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:40:16
select *
from rireki_kanri r
left join rireki_syousai s on s.rireki_id = r.rireki_id
order by r.rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:40:38
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:41:57
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:45:13
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:45:16
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:02:15
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:07:44
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:09:03
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:09:15
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:15:58
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:17:57
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:19:19
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:19:34
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:20:56
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,
				 rk.userid,
				 rireki_date,
				 soshiki_name,
				 tantou_name,
				 kg.gamen,

				--・履歴詳細情報
				--	通番、変更カラム、変更前内容、変更後内容
				 rs.seq_no,
				 rs.rireki_col,
				 rs.naiyou_mae,
				 rs.naiyou_ato,

				--・手配先管理情報
				--	拠点／エリア
				 tk.kyoten_area,

				--・その他
				--	府県名、サービス名、業務区分名称（履歴管理情報に手配先IDが登録されている場合）
				 fm.fuken_name,
				 fm2.fuken_name as fuken_name_2,
				 tm.timezone_name,
				 array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where t1.gyoumu_kbn = t1.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name


				FROM rireki_kanri 			rk
				LEFT JOIN rireki_syousai 	rs ON rs.rireki_id = rk.rireki_id
				LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = rk.tehaikanri_id
				LEFT JOIN fuken_mst 		fm ON fm.block_code = tk.block_code
												AND fm.fuken_code = tk.fuken_code
				LEFT JOIN tehaisaki 		t1 ON t1.tehai_id = rk.tehai_id and t1.eda_no = rk.eda_no
				LEFT JOIN timezone_mst 		tm ON tm.timezone_code = t1.timezone_code
				LEFT JOIN kinou_gamen 		kg ON kg.gamen_id = rk.gamen_id
                left join  soshiki_tanto_fuken stf on stf.soshiki_id = rk.soshiki_id
                left join fuken_mst fm2 on fm2.fuken_code = stf.fuken_code

				WHERE 1=1
				
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') OR (tk.fuken_code is Null AND fm2.fuken_code IN ('25','26','27','28','29','30')))
				  AND rk.rireki_date >= '2017/05/10 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:23:18
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,
				 rk.userid,
				 rireki_date,
				 soshiki_name,
				 tantou_name,
				 kg.gamen,

				--・履歴詳細情報
				--	通番、変更カラム、変更前内容、変更後内容
				 rs.seq_no,
				 rs.rireki_col,
				 rs.naiyou_mae,
				 rs.naiyou_ato,

				--・手配先管理情報
				--	拠点／エリア
				 tk.kyoten_area,

				--・その他
				--	府県名、サービス名、業務区分名称（履歴管理情報に手配先IDが登録されている場合）
				 fm.fuken_name,
				 --fm2.fuken_name as fuken_name_2,
                 array_to_string(ARRAY(SELECT fm2.fuken_name from fuken_mst fm2 where fm2.fuken_code = stf.fuken_code), '/')  as fuken_name_2,
				 tm.timezone_name,
				 array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where t1.gyoumu_kbn = t1.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name


				FROM rireki_kanri 			rk
				LEFT JOIN rireki_syousai 	rs ON rs.rireki_id = rk.rireki_id
				LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = rk.tehaikanri_id
				LEFT JOIN fuken_mst 		fm ON fm.block_code = tk.block_code
												AND fm.fuken_code = tk.fuken_code
				LEFT JOIN tehaisaki 		t1 ON t1.tehai_id = rk.tehai_id and t1.eda_no = rk.eda_no
				LEFT JOIN timezone_mst 		tm ON tm.timezone_code = t1.timezone_code
				LEFT JOIN kinou_gamen 		kg ON kg.gamen_id = rk.gamen_id
                left join  soshiki_tanto_fuken stf on stf.soshiki_id = rk.soshiki_id
                left join fuken_mst fm2 on fm2.fuken_code = stf.fuken_code

				WHERE 1=1
				
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') OR (tk.fuken_code is Null AND fm2.fuken_code IN ('25','26','27','28','29','30')))
				  AND rk.rireki_date >= '2017/05/10 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:24:07
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,
				 rk.userid,
				 rireki_date,
				 soshiki_name,
				 tantou_name,
				 kg.gamen,

				--・履歴詳細情報
				--	通番、変更カラム、変更前内容、変更後内容
				 rs.seq_no,
				 rs.rireki_col,
				 rs.naiyou_mae,
				 rs.naiyou_ato,

				--・手配先管理情報
				--	拠点／エリア
				 tk.kyoten_area,

				--・その他
				--	府県名、サービス名、業務区分名称（履歴管理情報に手配先IDが登録されている場合）
				 fm.fuken_name,
				 --fm2.fuken_name as fuken_name_2,
                 array_to_string(ARRAY(SELECT fm2.fuken_name from fuken_mst fm2 where fm2.fuken_code = stf.fuken_code  AND fm2.fuken_code IN ('25','26','27','28','29','30')), '/')  as fuken_name_2,
				 tm.timezone_name,
				 array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where t1.gyoumu_kbn = t1.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name


				FROM rireki_kanri 			rk
				LEFT JOIN rireki_syousai 	rs ON rs.rireki_id = rk.rireki_id
				LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = rk.tehaikanri_id
				LEFT JOIN fuken_mst 		fm ON fm.block_code = tk.block_code
												AND fm.fuken_code = tk.fuken_code
				LEFT JOIN tehaisaki 		t1 ON t1.tehai_id = rk.tehai_id and t1.eda_no = rk.eda_no
				LEFT JOIN timezone_mst 		tm ON tm.timezone_code = t1.timezone_code
				LEFT JOIN kinou_gamen 		kg ON kg.gamen_id = rk.gamen_id
                left join  soshiki_tanto_fuken stf on stf.soshiki_id = rk.soshiki_id
                --left join fuken_mst fm2 on fm2.fuken_code = stf.fuken_code

				WHERE 1=1
				
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') OR (tk.fuken_code is Null))
				  AND rk.rireki_date >= '2017/05/10 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:25:13
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,
				 rk.userid,
				 rireki_date,
				 soshiki_name,
				 tantou_name,
				 kg.gamen,

				--・履歴詳細情報
				--	通番、変更カラム、変更前内容、変更後内容
				 rs.seq_no,
				 rs.rireki_col,
				 rs.naiyou_mae,
				 rs.naiyou_ato,

				--・手配先管理情報
				--	拠点／エリア
				 tk.kyoten_area,

				--・その他
				--	府県名、サービス名、業務区分名称（履歴管理情報に手配先IDが登録されている場合）
				 fm.fuken_name,
				 --fm2.fuken_name as fuken_name_2,
                 --array_to_string(ARRAY(SELECT fm2.fuken_name from fuken_mst fm2 where fm2.fuken_code = stf.fuken_code  AND fm2.fuken_code IN ('25','26','27','28','29','30')), '/')  as fuken_name_2,
				 tm.timezone_name,
				 array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where t1.gyoumu_kbn = t1.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name


				FROM rireki_kanri 			rk
				LEFT JOIN rireki_syousai 	rs ON rs.rireki_id = rk.rireki_id
				LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = rk.tehaikanri_id
				LEFT JOIN fuken_mst 		fm ON fm.block_code = tk.block_code
												AND fm.fuken_code = tk.fuken_code
				LEFT JOIN tehaisaki 		t1 ON t1.tehai_id = rk.tehai_id and t1.eda_no = rk.eda_no
				LEFT JOIN timezone_mst 		tm ON tm.timezone_code = t1.timezone_code
				LEFT JOIN kinou_gamen 		kg ON kg.gamen_id = rk.gamen_id
                left join  soshiki_tanto_fuken stf on stf.soshiki_id = rk.soshiki_id
                --left join fuken_mst fm2 on fm2.fuken_code = stf.fuken_code

				WHERE 1=1
				
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') OR (tk.fuken_code is Null))
				  AND rk.rireki_date >= '2017/05/10 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:27:53
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,
				 rk.userid,
				 rireki_date,
				 soshiki_name,
				 tantou_name,
				 kg.gamen,

				--・履歴詳細情報
				--	通番、変更カラム、変更前内容、変更後内容
				 rs.seq_no,
				 rs.rireki_col,
				 rs.naiyou_mae,
				 rs.naiyou_ato,

				--・手配先管理情報
				--	拠点／エリア
				 tk.kyoten_area,

				--・その他
				--	府県名、サービス名、業務区分名称（履歴管理情報に手配先IDが登録されている場合）
				 fm.fuken_name,
				 --fm2.fuken_name as fuken_name_2,
                 array_to_string(ARRAY(SELECT fm2.fuken_name from fuken_mst fm2 where fm2.fuken_code = stf.fuken_code  AND fm2.fuken_code IN ('25','26','27','28','29','30')), ' ')  as fuken_name_2,
				 tm.timezone_name,
				 array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where t1.gyoumu_kbn = t1.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name


				FROM rireki_kanri 			rk
				LEFT JOIN rireki_syousai 	rs ON rs.rireki_id = rk.rireki_id
				LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = rk.tehaikanri_id
				LEFT JOIN fuken_mst 		fm ON fm.block_code = tk.block_code
												AND fm.fuken_code = tk.fuken_code
				LEFT JOIN tehaisaki 		t1 ON t1.tehai_id = rk.tehai_id and t1.eda_no = rk.eda_no
				LEFT JOIN timezone_mst 		tm ON tm.timezone_code = t1.timezone_code
				LEFT JOIN kinou_gamen 		kg ON kg.gamen_id = rk.gamen_id
                left join  soshiki_tanto_fuken stf on stf.soshiki_id = rk.soshiki_id
                --left join fuken_mst fm2 on fm2.fuken_code = stf.fuken_code

				WHERE 1=1
				
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') OR (tk.fuken_code is Null))
				  AND rk.rireki_date >= '2017/05/10 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:29:17
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
                 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where fm2.fuken_code = stf.fuken_code  AND fm2.fuken_code IN ('25','26','27','28','29','30')), ' ')  as fuken_name_2,
				 rk.eda_no,
				 rk.userid,
				 rireki_date,
				 soshiki_name,
				 tantou_name,
				 kg.gamen,

				--・履歴詳細情報
				--	通番、変更カラム、変更前内容、変更後内容
				 rs.seq_no,
				 rs.rireki_col,
				 rs.naiyou_mae,
				 rs.naiyou_ato,

				--・手配先管理情報
				--	拠点／エリア
				 tk.kyoten_area,

				--・その他
				--	府県名、サービス名、業務区分名称（履歴管理情報に手配先IDが登録されている場合）
				 fm.fuken_name,
				 --fm2.fuken_name as fuken_name_2,
                 
				 tm.timezone_name,
				 array_to_string(ARRAY(SELECT gyoumu_name from gyoumukubun t2 where t1.gyoumu_kbn = t1.gyoumu_kbn | t2.gyoumu_kbn), '/') gyoumu_name


				FROM rireki_kanri 			rk
				LEFT JOIN rireki_syousai 	rs ON rs.rireki_id = rk.rireki_id
				LEFT JOIN tehaisakikanri 	tk ON tk.tehaikanri_id = rk.tehaikanri_id
				LEFT JOIN fuken_mst 		fm ON fm.block_code = tk.block_code
												AND fm.fuken_code = tk.fuken_code
				LEFT JOIN tehaisaki 		t1 ON t1.tehai_id = rk.tehai_id and t1.eda_no = rk.eda_no
				LEFT JOIN timezone_mst 		tm ON tm.timezone_code = t1.timezone_code
				LEFT JOIN kinou_gamen 		kg ON kg.gamen_id = rk.gamen_id
                left join  soshiki_tanto_fuken stf on stf.soshiki_id = rk.soshiki_id
                --left join fuken_mst fm2 on fm2.fuken_code = stf.fuken_code

				WHERE 1=1
				
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') OR (tk.fuken_code is Null))
				  AND rk.rireki_date >= '2017/05/10 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

