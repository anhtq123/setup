-- psqledit log file
-- date: 2017-05-12

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:13:52
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ƒuƒƒbƒN
--2	•\Ž¦‡
--3	‘gD–¼
--4	‘gD’S“–•{Œ§
--5	—X•Ö”Ô†
--6	ZŠ
--7	“d˜b”Ô†
--8	ƒ[ƒ‹ƒAƒhƒŒƒX
--9	‚e‚`‚w”Ô†
--10	ƒƒ“ƒo[ƒYƒlƒbƒg
--11	ˆÏ‘õŒ³‘gD
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:14:04
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:15:05
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:16:15
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:16:24
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
order by soshiki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:23:04
select rireki_id, seq_no, rireki_col, naiyou_mae, naiyou_ato
from rireki_syousai
order by rireki_id desc,seq_no

--1	ƒuƒƒbƒN
--2	•\Ž¦‡
--3	‘gD–¼
--4	‘gD’S“–•{Œ§
--5	—X•Ö”Ô†
--6	ZŠ
--7	“d˜b”Ô†
--8	ƒ[ƒ‹ƒAƒhƒŒƒX
--9	‚e‚`‚w”Ô†
--10	ƒƒ“ƒo[ƒYƒlƒbƒg
--11	ˆÏ‘õŒ³‘gD
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:23:33
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:33:54
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:41:15
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:55:59
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:04:04
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:04:53
update rireki_kanri
set soshiki_id=null
where rireki_id=789;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:04:58
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:06:11
update rireki_kanri
set soshiki_name='ƒAƒCƒ“‚R'
where rireki_id=790;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:06:15
select rireki_id, rireki_date, gamen_id, soshiki_name, tantou_name, 
	tehaikanri_id, tehai_id, eda_no, irai_id, userid, tanto_id, soshiki_id
from rireki_kanri r

order by rireki_id desc
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:17:13
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:24:07
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
				
					AND (tk.fuken_code = '25'
						OR (	tk.fuken_code is Null 
							AND ((rk.soshiki_id IN
								   (SELECT DISTINCT syukan_soshiki
									FROM tehaisaki t
									LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
									WHERE tk.fuken_code = '25' )
								 OR rk.soshiki_id IN
								   (SELECT DISTINCT soshiki_id
									FROM tehaisaki_soshiki ts
									LEFT JOIN tehaisaki t ON t.tehai_id = ts.tehai_id
										AND t.eda_no = ts.eda_num
									LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
									WHERE tk.fuken_code = '25' )
								 OR rk.soshiki_id IN
								   (SELECT DISTINCT soshiki_id
									FROM tehaisaki_tousei ts
									LEFT JOIN tehaisaki t ON t.tehai_id = ts.tehai_id
										AND t.eda_no = ts.eda_no
									LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
									WHERE tk.fuken_code = '25')
								 OR rk.soshiki_id IN
								   (SELECT DISTINCT ts.soshiki_id
									FROM itakumoto_soshiki ts
									LEFT JOIN soshiki_tanto_fuken stf ON stf.soshiki_id = ts.itaku_soshiki_id
									WHERE stf.fuken_code = '25' )
								)
                              OR(
                                rk.tanto_id  IN (
                                    select tm.tanto_id 
                                    from tanto_mst tm
                                    left join soshiki_tanto_fuken sm on sm.soshiki_id = tm.soshiki_id
                                    WHERE sm.fuken_code = '25')
                                )
							)
						))
					
				  AND rk.rireki_date >= '2017/05/12 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:29:49
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
				
					AND (tk.fuken_code = '25'
						OR (	tk.fuken_code is Null 
							AND ((rk.soshiki_id IN
								   (SELECT DISTINCT syukan_soshiki
									FROM tehaisaki t
									LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
									WHERE tk.fuken_code = '25' )
								 OR rk.soshiki_id IN
								   (SELECT DISTINCT soshiki_id
									FROM tehaisaki_soshiki ts
									LEFT JOIN tehaisaki t ON t.tehai_id = ts.tehai_id
										AND t.eda_no = ts.eda_num
									LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
									WHERE tk.fuken_code = '25' )
								 OR rk.soshiki_id IN
								   (SELECT DISTINCT soshiki_id
									FROM tehaisaki_tousei ts
									LEFT JOIN tehaisaki t ON t.tehai_id = ts.tehai_id
										AND t.eda_no = ts.eda_no
									LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
									WHERE tk.fuken_code = '25')
								 OR rk.soshiki_id IN
								   (SELECT DISTINCT ts.soshiki_id
									FROM itakumoto_soshiki ts
									LEFT JOIN soshiki_tanto_fuken stf ON stf.soshiki_id = ts.itaku_soshiki_id
									WHERE stf.fuken_code = '25' )
								)
                              OR(
                                rk.tanto_id  IN (
                                    select tt.tanto_id 
                                    from tehaisaki_tanto tt
                                    left join tanto_mst tm on tm.tanto_id = tt.tanto_id
                                    left join soshiki_tanto_fuken sm on sm.soshiki_id = tm.soshiki_id
                                    WHERE sm.fuken_code = '25')
                                )
							)
						))
					
				  AND rk.rireki_date >= '2017/05/12 00:00:00'
				ORDER BY rk.rireki_id DESC, rk.eda_no DESC;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:15:43
select tehaikanri_id, service_code, block_code, fuken_code, 
	kyoten_area, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisakikanri
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:54:49
select fm.fuken_name, bm.fuken_code, bm.build_code, bm.build_kubun, bm.build_name, bm.ryaku_name, bm.kana_name
from tehaisaki_build tb
left join build_mst bm on bm.build_code = tb.build_code
left join fuken_mst fm on fm.fuken_code = bm.fuken_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:55:03
select fm.fuken_name, bm.fuken_code, bm.build_code, bm.build_kubun, bm.build_name, bm.ryaku_name, bm.kana_name
from tehaisaki_build tb
left join build_mst bm on bm.build_code = tb.build_code
left join fuken_mst fm on fm.fuken_code = bm.fuken_code
where tb.tehaikanri_id=1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:55:36
select fm.fuken_name, bm.fuken_code, bm.build_code, bm.build_kubun, bm.build_name, bm.ryaku_name, bm.kana_name
from tehaisaki_build tb
left join build_mst bm on bm.build_code = tb.build_code
left join fuken_mst fm on fm.fuken_code = bm.fuken_code
where tb.tehaikanri_id=1
order by tb.build_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:55:48
select fm.fuken_name, bm.fuken_code, bm.build_code, bm.build_name, bm.ryaku_name, bm.kana_name
from tehaisaki_build tb
left join build_mst bm on bm.build_code = tb.build_code
left join fuken_mst fm on fm.fuken_code = bm.fuken_code
where tb.tehaikanri_id=1
order by tb.build_code;
--/

