-- psqledit log file
-- date: 2017-05-11

--postgres@172.20.0.137:5432.kosyo_tool_20170126 08:59:19
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
                 --array_to_string(ARRAY(
                 --                   SELECT fm2.fuken_name 
                 ---                   from fuken_mst fm2 
                 --                   where fm2.fuken_code = stf.fuken_code  AND fm2.fuken_code IN ('25','26','27','28','29','30')), ' ')  as fuken_name_2,
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
                --left join  soshiki_tanto_fuken stf on stf.soshiki_id = rk.soshiki_id
                --left join fuken_mst fm2 on fm2.fuken_code = stf.fuken_code

				WHERE 1=1
				
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') OR (tk.fuken_code is Null))
				  AND rk.rireki_date >= '2017/05/10 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 08:59:41
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
                 --array_to_string(ARRAY(
                 --                   SELECT fm2.fuken_name 
                 ---                   from fuken_mst fm2 
                 --                   where fm2.fuken_code = stf.fuken_code  AND fm2.fuken_code IN ('25','26','27','28','29','30')), ' ')  as fuken_name_2,
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 08:59:51
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
                 --array_to_string(ARRAY(
                 --                   SELECT fm2.fuken_name 
                 ---                   from fuken_mst fm2 
                 --                   where fm2.fuken_code = stf.fuken_code  AND fm2.fuken_code IN ('25','26','27','28','29','30')), ' ')  as fuken_name_2,
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
                --left join  soshiki_tanto_fuken stf on stf.soshiki_id = rk.soshiki_id
                --left join fuken_mst fm2 on fm2.fuken_code = stf.fuken_code

				WHERE 1=1
				
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') OR (tk.fuken_code is Null))
				  AND rk.rireki_date >= '2017/05/10 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:00:30
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:00:35
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:09:32
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:19:44
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:21:48
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ブロック
--2	表示順
--3	組織名
--4	組織担当府県
--5	郵便番号
--6	住所
--7	電話番号
--8	メールアドレス
--9	ＦＡＸ番号
--10	メンバーズネット
--11	委託元組織
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:23:27
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ブロック
--2	表示順
--3	組織名
--4	組織担当府県
--5	郵便番号
--6	住所
--7	電話番号
--8	メールアドレス
--9	ＦＡＸ番号
--10	メンバーズネット
--11	委託元組織
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:35:22
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ブロック
--2	表示順
--3	組織名
--4	組織担当府県
--5	郵便番号
--6	住所
--7	電話番号
--8	メールアドレス
--9	ＦＡＸ番号
--10	メンバーズネット
--11	委託元組織
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:35:45
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ブロック
--2	表示順
--3	組織名
--4	組織担当府県
--5	郵便番号
--6	住所
--7	電話番号
--8	メールアドレス
--9	ＦＡＸ番号
--10	メンバーズネット
--11	委託元組織
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:37:09
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ブロック
--2	表示順
--3	組織名
--4	組織担当府県
--5	郵便番号
--6	住所
--7	電話番号
--8	メールアドレス
--9	ＦＡＸ番号
--10	メンバーズネット
--11	委託元組織
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:37:37
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ブロック
--2	表示順
--3	組織名
--4	組織担当府県
--5	郵便番号
--6	住所
--7	電話番号
--8	メールアドレス
--9	ＦＡＸ番号
--10	メンバーズネット
--11	委託元組織
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:38:26
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:38:35
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ブロック
--2	表示順
--3	組織名
--4	組織担当府県
--5	郵便番号
--6	住所
--7	電話番号
--8	メールアドレス
--9	ＦＡＸ番号
--10	メンバーズネット
--11	委託元組織
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:43:41
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:44:12
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

				WHERE 1=1 AND
				    rk.rireki_id = 723 
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') OR (tk.fuken_code is Null))
				  AND rk.rireki_date >= '2017/05/10 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:48:48
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
                 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
                --left join  soshiki_tanto_fuken stf on stf.soshiki_id = rk.soshiki_id
                --left join fuken_mst fm2 on fm2.fuken_code = stf.fuken_code

				WHERE 1=1 AND
				    rk.rireki_id = 723 
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') OR (tk.fuken_code is Null))
				  AND rk.rireki_date >= '2017/05/10 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:51:00
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id, fm.fuken_name,
                 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
                --left join  soshiki_tanto_fuken stf on stf.soshiki_id = rk.soshiki_id
                --left join fuken_mst fm2 on fm2.fuken_code = stf.fuken_code

				WHERE 1=1 AND
				    rk.rireki_id = 723 
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') OR (tk.fuken_code is Null))
				  AND rk.rireki_date >= '2017/05/10 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:08:44
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ブロック
--2	表示順
--3	組織名
--4	組織担当府県
--5	郵便番号
--6	住所
--7	電話番号
--8	メールアドレス
--9	ＦＡＸ番号
--10	メンバーズネット
--11	委託元組織
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:10:02
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
				 tk.kyoten_area,

				 fm.fuken_name,
				 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') OR (tk.fuken_code is Null ))
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:10:09
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
				 tk.kyoten_area,

				 fm.fuken_name,
				 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') )
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:32:05
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:32:31
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ブロック
--2	表示順
--3	組織名
--4	組織担当府県
--5	郵便番号
--6	住所
--7	電話番号
--8	メールアドレス
--9	ＦＡＸ番号
--10	メンバーズネット
--11	委託元組織
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:46:18
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
				 tk.kyoten_area,

				 fm.fuken_name,
				 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
				  AND (tk.fuken_code IN ('25','26','27','28','29','30')  OR (tk.fuken_code is Null ))
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:49:47
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,rk.soshiki_id,
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
				 tk.kyoten_area,

				 fm.fuken_name,
				 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
				  AND(tk.fuken_code IN ('25','26','27','28','29','30')  
                        OR (tk.fuken_code is Null 
                            AND rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_soshiki)
                            )
                     )
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY    rk.rireki_id DESC, 
                            rk.eda_no DESC



;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:51:16
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,rk.soshiki_id,
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
				 tk.kyoten_area,

				 fm.fuken_name,
				 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
				  AND(tk.fuken_code IN ('25','26','27','28','29','30')  
                        OR (tk.fuken_code is Null 
                            AND (rk.soshiki_id IN (select distinct syukan_soshiki from tehaisaki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_soshiki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_tousei)
                                )
                            )
                     )
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY    rk.rireki_id DESC, 
                            rk.eda_no DESC



;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:10:10
				SELECT distinct
					rk.rireki_id,
					rk.eda_no,
					rk.userid,
					rireki_date,
					soshiki_name,
					tantou_name,
					kg.gamen,
					rs.seq_no,
					rs.rireki_col,
					rs.naiyou_mae,
					rs.naiyou_ato,
					tk.kyoten_area,
					fm.fuken_name,
					-- array_to_string(ARRAY(
					--                    SELECT fm2.fuken_name 
					--                    from fuken_mst fm2 
					--                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
					--                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
					--                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
				  AND (tk.fuken_code IN ('25','26','27','28','29','30') 
					OR (	tk.fuken_code is Null 
							AND (rk.soshiki_id IN
								 (SELECT DISTINCT syukan_soshiki
								  FROM tehaisaki)
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_soshiki)
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_tousei) ) 				  
						))
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:10:41
				SELECT distinct
					rk.rireki_id,
					rk.eda_no,
					rk.userid,
					rireki_date,
					soshiki_name,
					tantou_name,
					kg.gamen,
					rs.seq_no,
					rs.rireki_col,
					rs.naiyou_mae,
					rs.naiyou_ato,
					tk.kyoten_area,
					fm.fuken_name,
					-- array_to_string(ARRAY(
					--                    SELECT fm2.fuken_name 
					--                    from fuken_mst fm2 
					--                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
					--                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
					--                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
					AND tk.block_code = '01'
					AND (tk.fuken_code = '25'
						OR (	tk.fuken_code is Null 
							AND (rk.soshiki_id IN
								 (SELECT DISTINCT syukan_soshiki
								  FROM tehaisaki)
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_soshiki)
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_tousei) ) 				  
							)
						)
					
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:11:16
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,rk.soshiki_id,tk.fuken_code,
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
				 tk.kyoten_area,

				 fm.fuken_name,
				 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
				  AND(tk.fuken_code IN ('25','26','27','28','29','30')  
                        OR (tk.fuken_code is Null 
                            AND (rk.soshiki_id IN (select distinct syukan_soshiki from tehaisaki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_soshiki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_tousei)
                                )
                            )
                     )
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY    rk.rireki_id DESC, 
                            rk.eda_no DESC



;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:13:12
SELECT DISTINCT soshiki_id
 FROM tehaisaki_soshiki
where soshiki_id=658;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:13:50
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,rk.soshiki_id,tk.fuken_code,
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
				 tk.kyoten_area,

				 fm.fuken_name,
				 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
				  AND(tk.fuken_code IN ('25')  
                        OR (tk.fuken_code is Null 
                            AND (rk.soshiki_id IN (select distinct syukan_soshiki from tehaisaki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_soshiki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_tousei)
                                )
                            )
                     )
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY    rk.rireki_id DESC, 
                            rk.eda_no DESC



;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:14:18
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,rk.soshiki_id,tk.fuken_code,
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
				 tk.kyoten_area,

				 fm.fuken_name,
				 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
				  AND(tk.fuken_code IN ('25','26','27','28','29','30')  
                        OR (tk.fuken_code is Null 
                            AND (rk.soshiki_id IN (select distinct syukan_soshiki from tehaisaki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_soshiki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_tousei)
                                )
                            )
                     )
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY    rk.rireki_id DESC, 
                            rk.eda_no DESC



;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:15:01
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,rk.soshiki_id,
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
				 tk.kyoten_area,

				 fm.fuken_name,
				 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
				  AND(tk.fuken_code IN ('25','26','27','28','29','30')  
                        OR (tk.fuken_code is Null 
                            AND (rk.soshiki_id IN (select distinct syukan_soshiki from tehaisaki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_soshiki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_tousei)
                                )
                            )
                     )
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY    rk.rireki_id DESC, 
                            rk.eda_no DESC



;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:16:29
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,rk.soshiki_id,
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
				 tk.kyoten_area,

				 fm.fuken_name,
				 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
				  AND(tk.fuken_code IN ('25','26','27','28','29','30')  
                        OR (tk.fuken_code is Null 
                            AND (rk.soshiki_id IN (select distinct syukan_soshiki from tehaisaki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_soshiki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_tousei)
                                )
                            )
                     )
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY    rk.rireki_id DESC, 
                            rk.eda_no DESC



;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:16:41
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,rk.soshiki_id,
				 rk.userid,tk.fuken_code,
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
				 tk.kyoten_area,

				 fm.fuken_name,
				 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
				  AND(tk.fuken_code IN ('25','26','27','28','29','30')  
                        OR (tk.fuken_code is Null 
                            AND (rk.soshiki_id IN (select distinct syukan_soshiki from tehaisaki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_soshiki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_tousei)
                                )
                            )
                     )
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY    rk.rireki_id DESC, 
                            rk.eda_no DESC



;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:17:02
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,rk.soshiki_id,
				 rk.userid,tk.fuken_code,
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
				 tk.kyoten_area,

				 fm.fuken_name,
				 array_to_string(ARRAY(
                                    SELECT fm2.fuken_name 
                                    from fuken_mst fm2 
                                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
                                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
                                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
				  AND(tk.fuken_code IN ('25')  
                        OR (tk.fuken_code is Null 
                            AND (rk.soshiki_id IN (select distinct syukan_soshiki from tehaisaki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_soshiki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_tousei)
                                )
                            )
                     )
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY    rk.rireki_id DESC, 
                            rk.eda_no DESC



;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:17:15
SELECT distinct

				--・履歴管理情報
				--	更新日付、更新担当者組織名、更新担当者氏名
				 rk.rireki_id,
				 rk.eda_no,rk.soshiki_id,
				 rk.userid,tk.fuken_code,
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
				 tk.kyoten_area,

				 fm.fuken_name,

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
				WHERE 1=1
				
				  AND(tk.fuken_code IN ('25')  
                        OR (tk.fuken_code is Null 
                            AND (rk.soshiki_id IN (select distinct syukan_soshiki from tehaisaki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_soshiki) OR
                                rk.soshiki_id IN (select distinct soshiki_id from tehaisaki_tousei)
                                )
                            )
                     )
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY    rk.rireki_id DESC, 
                            rk.eda_no DESC



;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:17:44
				SELECT distinct
					rk.rireki_id,
					rk.eda_no,
					rk.userid,
					rireki_date,
					soshiki_name,
					tantou_name,
					kg.gamen,
					rs.seq_no,
					rs.rireki_col,
					rs.naiyou_mae,
					rs.naiyou_ato,
					tk.kyoten_area,
					fm.fuken_name,
					-- array_to_string(ARRAY(
					--                    SELECT fm2.fuken_name 
					--                    from fuken_mst fm2 
					--                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
					--                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
					--                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
					--AND tk.block_code = '01'
					AND (tk.fuken_code = '25'
						OR (	tk.fuken_code is Null 
							AND (rk.soshiki_id IN
								 (SELECT DISTINCT syukan_soshiki
								  FROM tehaisaki)
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_soshiki)
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_tousei) ) 				  
							)
						)
					
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:25:35
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:33:38
				SELECT distinct
					rk.rireki_id,
					rk.eda_no,
					rk.userid,
					rireki_date,
					soshiki_name,
					tantou_name,
					kg.gamen,
					rs.seq_no,
					rs.rireki_col,
					rs.naiyou_mae,
					rs.naiyou_ato,
					tk.kyoten_area,
					fm.fuken_name,
					-- array_to_string(ARRAY(
					--                    SELECT fm2.fuken_name 
					--                    from fuken_mst fm2 
					--                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
					--                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
					--                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
					--AND tk.block_code = '01'
					AND (tk.fuken_code = '25'
						OR (	tk.fuken_code is Null 
							AND (rk.soshiki_id IN
								 (SELECT DISTINCT syukan_soshiki
								  FROM tehaisaki)
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_soshiki ts
                                  left join tehaisaki t on t.tehai_id = ts.tehai_id and t.eda_no = ts.eda_num
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25'  
                                  )
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_tousei) ) 				  
							)
						)
					
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:35:14
				SELECT distinct
					rk.rireki_id,
					rk.eda_no,
					rk.userid,
					rireki_date,
					soshiki_name,
					tantou_name,
					kg.gamen,
					rs.seq_no,
					rs.rireki_col,
					rs.naiyou_mae,
					rs.naiyou_ato,
					tk.kyoten_area,
					fm.fuken_name,
					-- array_to_string(ARRAY(
					--                    SELECT fm2.fuken_name 
					--                    from fuken_mst fm2 
					--                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
					--                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
					--                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
					--AND tk.block_code = '01'
					AND (tk.fuken_code = '25'
						OR (	tk.fuken_code is Null 
							AND (rk.soshiki_id IN
								 (SELECT DISTINCT syukan_soshiki
								  FROM tehaisaki t
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25' )
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_soshiki ts
                                  left join tehaisaki t on t.tehai_id = ts.tehai_id and t.eda_no = ts.eda_num
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25'  
                                  )
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_tousei ts
                                  left join tehaisaki t on t.tehai_id = ts.tehai_id and t.eda_no = ts.eda_no
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25') ) 				  
							)
						)
					
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:35:43
select kaisya_id, kaisya_name, kaisya_kubun, disp_no, add_date, 
	add_userid, upd_date, upd_userid
from kaisya_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:44:08
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:50:35
				SELECT distinct
					rk.rireki_id,
					rk.eda_no,
					rk.userid,
					rireki_date,
					soshiki_name,
					tantou_name,
					kg.gamen,
					rs.seq_no,
					rs.rireki_col,
					rs.naiyou_mae,
					rs.naiyou_ato,
					tk.kyoten_area,
					fm.fuken_name,
					-- array_to_string(ARRAY(
					--                    SELECT fm2.fuken_name 
					--                    from fuken_mst fm2 
					--                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
					--                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
					--                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
					--AND tk.block_code = '01'
					AND (tk.fuken_code = '25'
						OR (	tk.fuken_code is Null 
							AND (rk.soshiki_id IN
								 (SELECT DISTINCT syukan_soshiki
								  FROM tehaisaki t
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25' )
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_soshiki ts
                                  left join tehaisaki t on t.tehai_id = ts.tehai_id and t.eda_no = ts.eda_num
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25'  
                                  )
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_tousei ts
                                  left join tehaisaki t on t.tehai_id = ts.tehai_id and t.eda_no = ts.eda_no
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25') 
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT itaku_soshiki_id
								  FROM itakumoto_soshiki ts
                                  left join soshiki_tanto_fuken stf on stf.soshiki_id = ts.soshiki_id
                                  where tk.fuken_code = '25')) 				  
							)
						)
					
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:51:02
				SELECT distinct
					rk.rireki_id,
					rk.eda_no,
					rk.userid,
					rireki_date,
					soshiki_name,
					tantou_name,
					kg.gamen,
					rs.seq_no,
					rs.rireki_col,
					rs.naiyou_mae,
					rs.naiyou_ato,
					tk.kyoten_area,
					fm.fuken_name,
					-- array_to_string(ARRAY(
					--                    SELECT fm2.fuken_name 
					--                    from fuken_mst fm2 
					--                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
					--                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
					--                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
					--AND tk.block_code = '01'
					AND (tk.fuken_code = '25'
						OR (	tk.fuken_code is Null 
							AND (rk.soshiki_id IN
								 (SELECT DISTINCT syukan_soshiki
								  FROM tehaisaki t
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25' )
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_soshiki ts
                                  left join tehaisaki t on t.tehai_id = ts.tehai_id and t.eda_no = ts.eda_num
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25'  
                                  )
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_tousei ts
                                  left join tehaisaki t on t.tehai_id = ts.tehai_id and t.eda_no = ts.eda_no
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25') 
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT itaku_soshiki_id
								  FROM itakumoto_soshiki ts
                                  left join soshiki_tanto_fuken stf on stf.soshiki_id = ts.soshiki_id
                                  --where tk.fuken_code = '25'
                                 )) 				  
							)
						)
					
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:53:10
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ブロック
--2	表示順
--3	組織名
--4	組織担当府県
--5	郵便番号
--6	住所
--7	電話番号
--8	メールアドレス
--9	ＦＡＸ番号
--10	メンバーズネット
--11	委託元組織
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:53:24
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:53:50
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki
where soshiki_id =662;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:54:07
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id
from itakumoto_soshiki
where soshiki_id =662;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:56:28
SELECT DISTINCT soshiki_id
								  FROM itakumoto_soshiki ts
where soshiki_id =662;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:56:49
				SELECT distinct
					rk.rireki_id,
					rk.eda_no,
					rk.userid,
					rireki_date,
					soshiki_name,
					tantou_name,
					kg.gamen,
					rs.seq_no,
					rs.rireki_col,
					rs.naiyou_mae,
					rs.naiyou_ato,
					tk.kyoten_area,
					fm.fuken_name,
					-- array_to_string(ARRAY(
					--                    SELECT fm2.fuken_name 
					--                    from fuken_mst fm2 
					--                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
					--                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
					--                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
					--AND tk.block_code = '01'
					AND (tk.fuken_code = '25'
						OR (	tk.fuken_code is Null 
							AND (rk.soshiki_id IN
								 (SELECT DISTINCT syukan_soshiki
								  FROM tehaisaki t
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25' )
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_soshiki ts
                                  left join tehaisaki t on t.tehai_id = ts.tehai_id and t.eda_no = ts.eda_num
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25'  
                                  )
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_tousei ts
                                  left join tehaisaki t on t.tehai_id = ts.tehai_id and t.eda_no = ts.eda_no
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25') 
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM itakumoto_soshiki
                                  --left join soshiki_tanto_fuken stf on stf.soshiki_id = ts.soshiki_id
                                  --where tk.fuken_code = '25'
                                 )) 				  
							)
						)
					
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:13:23
				SELECT distinct
					rk.rireki_id,
					rk.eda_no,
					rk.userid,
					rireki_date,
					soshiki_name,
					tantou_name,
					kg.gamen,
					rs.seq_no,
					rs.rireki_col,
					rs.naiyou_mae,
					rs.naiyou_ato,
					tk.kyoten_area,
					fm.fuken_name,
					-- array_to_string(ARRAY(
					--                    SELECT fm2.fuken_name 
					--                    from fuken_mst fm2 
					--                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
					--                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
					--                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
					--AND tk.block_code = '01'
					AND (tk.fuken_code = '25'
						OR (	tk.fuken_code is Null 
							AND (rk.soshiki_id IN
								 (SELECT DISTINCT syukan_soshiki
								  FROM tehaisaki t
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25' )
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_soshiki ts
                                  left join tehaisaki t on t.tehai_id = ts.tehai_id and t.eda_no = ts.eda_num
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25'  
                                  )
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_tousei ts
                                  left join tehaisaki t on t.tehai_id = ts.tehai_id and t.eda_no = ts.eda_no
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25') 
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT ts.soshiki_id
								  FROM itakumoto_soshiki ts
                                  left join soshiki_tanto_fuken stf on stf.soshiki_id = ts.itaku_soshiki_id
                                  where stf.fuken_code = '25'
                                 )) 				  
							)
						)
					
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:14:50
				SELECT distinct
					rk.rireki_id,
					rk.eda_no,
					rk.userid,
					rireki_date,
					soshiki_name,
					tantou_name,
					kg.gamen,
					rs.seq_no,
					rs.rireki_col,
					rs.naiyou_mae,
					rs.naiyou_ato,
					tk.kyoten_area,
					fm.fuken_name,
					-- array_to_string(ARRAY(
					--                    SELECT fm2.fuken_name 
					--                    from fuken_mst fm2 
					--                    where   fm2.fuken_code IN ('25','26','27','28','29','30')  AND 
					--                            fm2.fuken_code IN (SELECT fuken_code FROM soshiki_tanto_fuken stf WHERE stf.soshiki_id = rk.soshiki_id)
					--                ), ' ')  as fuken_name_2,
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
				WHERE 1=1
				
					--AND tk.block_code = '01'
					AND (tk.fuken_code = '25'
						OR (	tk.fuken_code is Null 
							AND (rk.soshiki_id IN
								 (SELECT DISTINCT syukan_soshiki
								  FROM tehaisaki t
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25' )
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_soshiki ts
                                  left join tehaisaki t on t.tehai_id = ts.tehai_id and t.eda_no = ts.eda_num
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25'  
                                  )
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT soshiki_id
								  FROM tehaisaki_tousei ts
                                  left join tehaisaki t on t.tehai_id = ts.tehai_id and t.eda_no = ts.eda_no
                                  left join tehaisakikanri tk on tk.tehaikanri_id = t.tehaikanri_id
                                  where tk.fuken_code = '25') 
							   OR rk.soshiki_id IN
								 (SELECT DISTINCT ts.soshiki_id
								  FROM itakumoto_soshiki ts
                                  left join soshiki_tanto_fuken stf on stf.soshiki_id = ts.itaku_soshiki_id
                                  where stf.fuken_code = '25'
                                 )) 				  
							)
						)
					
				  AND rk.rireki_date >= '2017/05/11 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:39:16
truncate rireki_kanri;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:39:26
truncate rireki_syousai;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:05:51
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:05:57
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ブロック
--2	表示順
--3	組織名
--4	組織担当府県
--5	郵便番号
--6	住所
--7	電話番号
--8	メールアドレス
--9	ＦＡＸ番号
--10	メンバーズネット
--11	委託元組織
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:10:00
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ブロック
--2	表示順
--3	組織名
--4	組織担当府県
--5	郵便番号
--6	住所
--7	電話番号
--8	メールアドレス
--9	ＦＡＸ番号
--10	メンバーズネット
--11	委託元組織
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:28:37
truncate rireki_kanri,rireki_syousai;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:30:42
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ブロック
--2	表示順
--3	組織名
--4	組織担当府県
--5	郵便番号
--6	住所
--7	電話番号
--8	メールアドレス
--9	ＦＡＸ番号
--10	メンバーズネット
--11	委託元組織
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:30:45
truncate rireki_kanri,rireki_syousai;
--/

