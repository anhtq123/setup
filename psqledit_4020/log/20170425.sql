-- psqledit log file
-- date: 2017-04-25

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:21:20
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       bm.build_name,
				       bm.ryaku_name,
				       bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				       tm.timezone_name,
				       sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm,
					  (SELECT telno
						   FROM soshiki_tel tel
						   WHERE tel.soshiki_id = ths.soshiki_id
						     AND ths.tel_id = tel.tel_id) tel_no,
					  (SELECT faxno
						   FROM soshiki_fax fax
						   WHERE fax.soshiki_id = ths.soshiki_id
						     AND ths.fax_id = fax.fax_id) fax_no
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				JOIN build_mst bm ON bm.build_code = tb.build_code
				JOIN service_mst sm ON tk.service_code = sm.service_code
				JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  AND th.timezone_code = '1'
				  AND th.tehai_id = 3829
				  AND th.eda_no = 1
				  AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:22:21
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       bm.build_name,
				       bm.ryaku_name,
				       bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				       tm.timezone_name,
				       sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm,
					  (SELECT telno
						   FROM soshiki_tel tel
						   WHERE tel.soshiki_id = ths.soshiki_id
						     AND ths.tel_id = tel.tel_id) tel_no,
					  (SELECT faxno
						   FROM soshiki_fax fax
						   WHERE fax.soshiki_id = ths.soshiki_id
						     AND ths.fax_id = fax.fax_id) fax_no
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				JOIN build_mst bm ON bm.build_code = tb.build_code
				JOIN service_mst sm ON tk.service_code = sm.service_code
				JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  --AND th.timezone_code = '1'
				  --AND th.tehai_id = 3829
				  --AND th.eda_no = 1
				  --AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:22:28
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       bm.build_name,
				       bm.ryaku_name,
				       bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				       tm.timezone_name,
				       sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm,
					  (SELECT telno
						   FROM soshiki_tel tel
						   WHERE tel.soshiki_id = ths.soshiki_id
						     AND ths.tel_id = tel.tel_id) tel_no,
					  (SELECT faxno
						   FROM soshiki_fax fax
						   WHERE fax.soshiki_id = ths.soshiki_id
						     AND ths.fax_id = fax.fax_id) fax_no
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				JOIN build_mst bm ON bm.build_code = tb.build_code
				JOIN service_mst sm ON tk.service_code = sm.service_code
				JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  --AND th.timezone_code = '1'
				  AND th.tehai_id = 3829
				  --AND th.eda_no = 1
				  --AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:23:43
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       bm.build_name,
				       bm.ryaku_name,
				       bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				       tm.timezone_name,
				       sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm,
					  (SELECT telno
						   FROM soshiki_tel tel
						   WHERE tel.soshiki_id = ths.soshiki_id
						     AND ths.tel_id = tel.tel_id) tel_no,
					  (SELECT faxno
						   FROM soshiki_fax fax
						   WHERE fax.soshiki_id = ths.soshiki_id
						     AND ths.fax_id = fax.fax_id) fax_no
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				JOIN build_mst bm ON bm.build_code = tb.build_code
				JOIN service_mst sm ON tk.service_code = sm.service_code
				JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  --AND th.timezone_code = '1'
				  --AND th.tehai_id = 3829
				  --AND th.eda_no = 1
				  AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:23:56
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       bm.build_name,
				       bm.ryaku_name,
				       bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				       tm.timezone_name,
				       sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm,
					  (SELECT telno
						   FROM soshiki_tel tel
						   WHERE tel.soshiki_id = ths.soshiki_id
						     AND ths.tel_id = tel.tel_id) tel_no,
					  (SELECT faxno
						   FROM soshiki_fax fax
						   WHERE fax.soshiki_id = ths.soshiki_id
						     AND ths.fax_id = fax.fax_id) fax_no
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				JOIN build_mst bm ON bm.build_code = tb.build_code
				JOIN service_mst sm ON tk.service_code = sm.service_code
				JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  AND th.timezone_code = '1'
				  --AND th.tehai_id = 3829
				  --AND th.eda_no = 1
				  --AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:27:31
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       bm.build_name,
				       bm.ryaku_name,
				       bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				       tm.timezone_name,
				       sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm,
					  (SELECT telno
						   FROM soshiki_tel tel
						   WHERE tel.soshiki_id = ths.soshiki_id
						     AND ths.tel_id = tel.tel_id) tel_no,
					  (SELECT faxno
						   FROM soshiki_fax fax
						   WHERE fax.soshiki_id = ths.soshiki_id
						     AND ths.fax_id = fax.fax_id) fax_no
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				JOIN build_mst bm ON bm.build_code = tb.build_code
				JOIN service_mst sm ON tk.service_code = sm.service_code
				JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  --AND th.timezone_code = '1'
				  --AND th.tehai_id = 3829
				  --AND th.eda_no = 1
				  --AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:27:38
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       bm.build_name,
				       bm.ryaku_name,
				       bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				       tm.timezone_name,
				       sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm,
					  (SELECT telno
						   FROM soshiki_tel tel
						   WHERE tel.soshiki_id = ths.soshiki_id
						     AND ths.tel_id = tel.tel_id) tel_no,
					  (SELECT faxno
						   FROM soshiki_fax fax
						   WHERE fax.soshiki_id = ths.soshiki_id
						     AND ths.fax_id = fax.fax_id) fax_no
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				JOIN build_mst bm ON bm.build_code = tb.build_code
				JOIN service_mst sm ON tk.service_code = sm.service_code
				JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  --AND th.timezone_code = '1'
				  --AND th.tehai_id = 3829
				  --AND th.eda_no = 1
				  --AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:27:48
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       bm.build_name,
				       bm.ryaku_name,
				       bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				       tm.timezone_name,
				       sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm,
					  (SELECT telno
						   FROM soshiki_tel tel
						   WHERE tel.soshiki_id = ths.soshiki_id
						     AND ths.tel_id = tel.tel_id) tel_no,
					  (SELECT faxno
						   FROM soshiki_fax fax
						   WHERE fax.soshiki_id = ths.soshiki_id
						     AND ths.fax_id = fax.fax_id) fax_no
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				JOIN build_mst bm ON bm.build_code = tb.build_code
				JOIN service_mst sm ON tk.service_code = sm.service_code
				JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				 -- AND tb.build_code = '2520100201'
				  --AND th.timezone_code = '1'
				  --AND th.tehai_id = 3829
				  --AND th.eda_no = 1
				  --AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:27:52
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       bm.build_name,
				       bm.ryaku_name,
				       bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				       tm.timezone_name,
				       sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm,
					  (SELECT telno
						   FROM soshiki_tel tel
						   WHERE tel.soshiki_id = ths.soshiki_id
						     AND ths.tel_id = tel.tel_id) tel_no,
					  (SELECT faxno
						   FROM soshiki_fax fax
						   WHERE fax.soshiki_id = ths.soshiki_id
						     AND ths.fax_id = fax.fax_id) fax_no
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				JOIN build_mst bm ON bm.build_code = tb.build_code
				JOIN service_mst sm ON tk.service_code = sm.service_code
				JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  --AND tk.service_code = '04'
				 -- AND tb.build_code = '2520100201'
				  --AND th.timezone_code = '1'
				  --AND th.tehai_id = 3829
				  --AND th.eda_no = 1
				  --AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:28:34
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       bm.build_name,
				       bm.ryaku_name,
				       bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				       tm.timezone_name,
				       sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm,
					  (SELECT telno
						   FROM soshiki_tel tel
						   WHERE tel.soshiki_id = ths.soshiki_id
						     AND ths.tel_id = tel.tel_id) tel_no,
					  (SELECT faxno
						   FROM soshiki_fax fax
						   WHERE fax.soshiki_id = ths.soshiki_id
						     AND ths.fax_id = fax.fax_id) fax_no
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				JOIN build_mst bm ON bm.build_code = tb.build_code
				JOIN service_mst sm ON tk.service_code = sm.service_code
				JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  --AND th.timezone_code = '1'
				  --AND th.tehai_id = 3829
				  --AND th.eda_no = 1
				  --AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:29:03
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehaikanri_id=3803;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:29:09
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=3803;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:29:30
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=3829;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:32:59
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       --bm.build_name,
				      -- bm.ryaku_name,
				       --bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				       tm.timezone_name,
				       sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm,
					  (SELECT telno
						   FROM soshiki_tel tel
						   WHERE tel.soshiki_id = ths.soshiki_id
						     AND ths.tel_id = tel.tel_id) tel_no,
					  (SELECT faxno
						   FROM soshiki_fax fax
						   WHERE fax.soshiki_id = ths.soshiki_id
						     AND ths.fax_id = fax.fax_id) fax_no
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				--JOIN build_mst bm ON bm.build_code = tb.build_code
				JOIN service_mst sm ON tk.service_code = sm.service_code
				JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				    AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  AND th.timezone_code = '1'
				  AND th.tehai_id = 3829
				  AND th.eda_no = 1
				  AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:33:16
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       --bm.build_name,
				      -- bm.ryaku_name,
				       --bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				       tm.timezone_name,
				      -- sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm,
					  (SELECT telno
						   FROM soshiki_tel tel
						   WHERE tel.soshiki_id = ths.soshiki_id
						     AND ths.tel_id = tel.tel_id) tel_no,
					  (SELECT faxno
						   FROM soshiki_fax fax
						   WHERE fax.soshiki_id = ths.soshiki_id
						     AND ths.fax_id = fax.fax_id) fax_no
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				--JOIN build_mst bm ON bm.build_code = tb.build_code
				--JOIN service_mst sm ON tk.service_code = sm.service_code
				JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				    AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  AND th.timezone_code = '1'
				  AND th.tehai_id = 3829
				  AND th.eda_no = 1
				  AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:33:34
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       --bm.build_name,
				      -- bm.ryaku_name,
				       --bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				      -- tm.timezone_name,
				      -- sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm,
					  (SELECT telno
						   FROM soshiki_tel tel
						   WHERE tel.soshiki_id = ths.soshiki_id
						     AND ths.tel_id = tel.tel_id) tel_no,
					  (SELECT faxno
						   FROM soshiki_fax fax
						   WHERE fax.soshiki_id = ths.soshiki_id
						     AND ths.fax_id = fax.fax_id) fax_no
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				--JOIN build_mst bm ON bm.build_code = tb.build_code
				--JOIN service_mst sm ON tk.service_code = sm.service_code
				--JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				    AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  AND th.timezone_code = '1'
				  AND th.tehai_id = 3829
				  AND th.eda_no = 1
				  AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:34:21
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       --bm.build_name,
				      -- bm.ryaku_name,
				       --bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				      -- tm.timezone_name,
				      -- sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm,
				       km.kaisya_name,
				       sh.soshiki_name,
				       sh.zipcode,
				       sh.addr,
				       sh.mail,
				       sh.menbers_net,
				       array_to_string (ARRAY
						                   (SELECT soshiki_name
						                    FROM soshiki_mst
						                    WHERE soshiki_code LIKE left(sh.soshiki_code,2)||'%'
						                      AND length(soshiki_code) <= length(sh.soshiki_code)
						                      AND kaisya_id = sh.kaisya_id
						                      AND soshiki_code = left(sh.soshiki_code, length(soshiki_code))
						                    ORDER BY soshiki_code), '　') soshiki_nm
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				--JOIN build_mst bm ON bm.build_code = tb.build_code
				--JOIN service_mst sm ON tk.service_code = sm.service_code
				--JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				    AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  AND th.timezone_code = '1'
				  AND th.tehai_id = 3829
				  AND th.eda_no = 1
				  AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:35:17
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       --bm.build_name,
				      -- bm.ryaku_name,
				       --bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				      -- tm.timezone_name,
				      -- sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm
				       --km.kaisya_name,
				       --sh.soshiki_name,
				       --sh.zipcode,
				       --sh.addr,
				      -- sh.mail,
				       --sh.menbers_net,
				      
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				--JOIN build_mst bm ON bm.build_code = tb.build_code
				--JOIN service_mst sm ON tk.service_code = sm.service_code
				--JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				    AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				--JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				--JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  AND th.timezone_code = '1'
				  AND th.tehai_id = 3829
				  AND th.eda_no = 1
				  AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:35:40
SELECT tk.tehaikanri_id,
				       th.bikou,
				       th.kikan_naiyou,
				       --bm.build_name,
				      -- bm.ryaku_name,
				       --bm.kana_name,
				       (th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
				      -- tm.timezone_name,
				      -- sm.service_name,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn ||'_'|| gyoumu_name
				                          FROM gyoumukubun gb
				                          WHERE gb.service_code = tk.service_code), '/') gkbn_lst,
				       array_to_string(ARRAY
				                         (SELECT gyoumu_kbn
				                          FROM gyoumukubun gb
				                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '/') gkbn_nm
				       --km.kaisya_name,
				       --sh.soshiki_name,
				       --sh.zipcode,
				       --sh.addr,
				      -- sh.mail,
				       --sh.menbers_net,
				      
				FROM tehaisakikanri tk
				JOIN tehaisaki th ON tk.tehaikanri_id = th.tehaikanri_id
				JOIN tehaisaki_build tb ON tk.tehaikanri_id = tb.tehaikanri_id
				--JOIN build_mst bm ON bm.build_code = tb.build_code
				--JOIN service_mst sm ON tk.service_code = sm.service_code
				--JOIN timezone_mst tm ON th.timezone_code = tm.timezone_code
				--JOIN tehaisaki_soshiki ths ON th.tehai_id = ths.tehai_id
				--    AND th.eda_no = ths.eda_num AND ths.disp_flg = '1'
				--JOIN soshiki_mst sh ON ths.soshiki_id = sh.soshiki_id
				--JOIN kaisya_mst km ON km.kaisya_id = sh.kaisya_id
				WHERE tk.tehaikanri_id = 724
				  AND tk.fuken_code = '25'
				  AND tk.service_code = '04'
				  AND tb.build_code = '2520100201'
				  AND th.timezone_code = '1'
				  AND th.tehai_id = 3829
				  AND th.eda_no = 1
				  AND th.gyoumu_kbn = 3072 ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:52:09
select service_code, service_name, tempfile_name, mail, add_date, 
	add_userid, upd_date, upd_userid
from service_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:53:01
select service_code, service_name, tempfile_name, mail, add_date, 
	add_userid, upd_date, upd_userid
from service_mst
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:00:52
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender) values('01', 'ＡＴＭ', '06-4705-6452', '06-6257-8593', '7-10-13-002', '', 	'専用系故障受付担当');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:00:52
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender) values('01', 'ＳＴＭ', '06-4705-6451', '06-6257-8593', '7-10-13-002', '', 	'専用系故障受付担当');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:00:52
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender) values('02', 'イーサ', '06-4705-6457', '06-6257-8608', '7-10-13-001', '', 	'イーサ系故障受付担当');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:00:52
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender) values('02', '光電話・VPNワイド', '06-4705-6459', '06-6257-8608', '7-10-13-001', '', 	'光電話・VPNワイド故障受付担当');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:00:52
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender) values('03', 'ＤＦ／ＦＦ', '06-4705-6471', '06-6262-3853', '7-10-13-002', 'darkhoukoku-neo@west.ntt.co.jp', 	'光アンバンドル故障受付担当');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:00:52
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender) values('04', 'ＳＡ', '06-4705-6471', '06-6262-3853', '7-10-13-002', 'darkhoukoku-neo@west.ntt.co.jp', 	'光アンバンドル故障受付担当');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:00:52
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender) values('05', 'フレッツ一元', '06-4705-6458', '06-6257-8608', '7-10-13-001	', '', 	'フレッツ一元故障受付部門');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:01:05
select service_code, service_item_detail, tel, fax, members_net, mail, 
	source_sender
from service_detail;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:36:55
delete 
from service_detail
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:37:49
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender,service_item_id) values('01', 'ＡＴＭ', '06-4705-6452', '06-6257-8593', '7-10-13-002', '', 	'専用系故障受付担当',1);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:37:49
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender,service_item_id) values('01', 'ＳＴＭ', '06-4705-6451', '06-6257-8593', '7-10-13-002', '', 	'専用系故障受付担当',2);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:37:49
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender,service_item_id) values('02', 'イーサ', '06-4705-6457', '06-6257-8608', '7-10-13-001', '', 	'イーサ系故障受付担当',3);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:37:49
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender,service_item_id) values('02', '光電話・VPNワイド', '06-4705-6459', '06-6257-8608', '7-10-13-001', '', 	'光電話・VPNワイド故障受付担当',4);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:37:49
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender,service_item_id) values('03', 'ＤＦ／ＦＦ', '06-4705-6471', '06-6262-3853', '7-10-13-002', 'darkhoukoku-neo@west.ntt.co.jp', 	'光アンバンドル故障受付担当',5);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:37:49
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender,service_item_id) values('04', 'ＳＡ', '06-4705-6471', '06-6262-3853', '7-10-13-002', 'darkhoukoku-neo@west.ntt.co.jp', 	'光アンバンドル故障受付担当',6);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:37:49
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender,service_item_id) values('05', 'フレッツ一元', '06-4705-6458', '06-6257-8608', '7-10-13-001	', '', 	'フレッツ一元故障受付部門',7);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:37:57
select service_code, service_item_detail, tel, fax, members_net, mail, 
	source_sender
from service_detail
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:38:12
select service_code, service_item_detail, tel, fax, members_net, mail, 
	source_sender, service_item_id
from service_detail
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:53:19
select service_code, service_item_detail, tel, fax, members_net, mail, source_sender, service_item_id
from service_detail
order by service_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:56:35
SELECT sd.service_code,
       sd.service_item_detail,
       sd.tel,
       sd.fax,
       sd.members_net,
       sd.mail,
       sd.source_sender,
       sd.service_item_id
FROM service_detail sd
LEFT JOIN service_mst sm ON  sm.service_code = sd.service_code
ORDER BY sd.service_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:56:56
SELECT sm.service_name,
       sd.service_code,
       sd.service_item_detail,
       sd.tel,
       sd.fax,
       sd.members_net,
       sd.mail,
       sd.source_sender,
       sd.service_item_id
FROM service_detail sd
LEFT JOIN service_mst sm ON  sm.service_code = sd.service_code
ORDER BY sd.service_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:06:57
select service_code, service_item_detail, tel, fax, members_net, mail, 
	source_sender, service_item_id, add_date, add_userid, upd_date, 
	upd_userid
from service_detail
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:16:31
select service_code, service_item_detail, tel, fax, members_net, mail, 
	source_sender, service_item_id, add_date, add_userid, upd_date, 
	upd_userid
from service_detail
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:17:53
select service_code, service_item_detail, tel, fax, members_net, mail, 
	source_sender, service_item_id, add_date, add_userid, upd_date, 
	upd_userid
from service_detail
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:18:52
select service_code, service_item_detail, tel, fax, members_net, mail, 
	source_sender, service_item_id, add_date, add_userid, upd_date, 
	upd_userid
from service_detail
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:28:16
create sequence service_item_id_seq;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:28:16
alter table service_detail alter service_item_id set default nextval('service_item_id_seq');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:28:16
Select setval('service_item_id_seq', 2000051 );
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:32:11
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender) values('01', 'ＡＴＭ08', '06-4705-6452', '06-6257-8593', '7-10-13-002', '', 	'専用系故障受付担当');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:32:26
SELECT sm.service_name,
       sd.service_code,
       sd.service_item_detail,
       sd.tel,
       sd.fax,
       sd.members_net,
       sd.mail,
       sd.source_sender,
       sd.service_item_id
FROM service_detail sd
LEFT JOIN service_mst sm ON  sm.service_code = sd.service_code
ORDER BY sd.service_code
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:43:15
DELETE from service_detail 
				WHERE service_item_id = 2000053;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:56:33
Select setval('service_item_id_seq', 10 );
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:56:39
SELECT sm.service_name,
       sd.service_code,
       sd.service_item_detail,
       sd.tel,
       sd.fax,
       sd.members_net,
       sd.mail,
       sd.source_sender,
       sd.service_item_id
FROM service_detail sd
LEFT JOIN service_mst sm ON  sm.service_code = sd.service_code
ORDER BY sd.service_code
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:56:52
SELECT sd.service_item_id,sm.service_name,
       sd.service_code,
       sd.service_item_detail,
       sd.tel,
       sd.fax,
       sd.members_net,
       sd.mail,
       sd.source_sender
       
FROM service_detail sd
LEFT JOIN service_mst sm ON  sm.service_code = sd.service_code
ORDER BY sd.service_code
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:57:15
insert into service_detail(service_code, service_item_detail, tel, fax, members_net, mail, source_sender) values('02', 'イーサ', '06-4705-6457', '06-6257-8608', '7-10-13-001', '', 	'イーサ系故障受付担当');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:57:20
SELECT sd.service_item_id,sm.service_name,
       sd.service_code,
       sd.service_item_detail,
       sd.tel,
       sd.fax,
       sd.members_net,
       sd.mail,
       sd.source_sender
       
FROM service_detail sd
LEFT JOIN service_mst sm ON  sm.service_code = sd.service_code
ORDER BY sd.service_code
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:59:59
SELECT service_item_id service_item_detail FROM service_detail WHERE service_code = '04' ORDER BY service_item_id ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 15:00:05
SELECT service_item_id, service_item_detail FROM service_detail WHERE service_code = '04' ORDER BY service_item_id ;
--/

