-- psqledit log file
-- date: 2017-04-18

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:18:20
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_id=299;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:25:18
select soshiki_id, kaisya_id, soshiki_code, level, disp_no, 
	soshiki_name, menbers_net, zipcode, addr, mail, add_date, add_userid, 
	upd_date, upd_userid
from soshiki_mst
where soshiki_id=199;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:27:29
SELECT distinct 
    th.kubun   || '' || 
    th.gyoumu_kbn   || '' || 
    th.st_date || '' || 
    th.st_time || 
    th.ed_date || '' || 
    th.ed_time   || '' || 
    th.syukan_soshiki   || '' || 
    ts.soshiki_id  || '' || 
    array_to_string(ARRAY
        (SELECT tt.tanto_id || '' ||  
                tt.priority || '' || 
                tt.shikibetu1 || '' ||  
                tt.tel_id1 || '' ||  
                tt.shikibetu2 || '' || 
                tt.tel_id2
          FROM tehaisaki_tanto tt
          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no
          ORDER BY tt.priority), '')  || '' ||  
    array_to_string(ARRAY
        (SELECT tt.soshiki_id || '' ||  
                tt.tousei_no || '' || 
                tt.tel_id 
          FROM tehaisaki_tousei tt
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no), '') thkey,
		       	
th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then 'í èÌ' when th.kubun = '2' then 'ä˙ä‘å¿íË' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || 'Å@' || th.st_time || 'Å@Å`Å@' || th.ed_date || 'Å@' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), 'ÅA') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm,
                array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), 'Å^') tehaiTosei,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                tk.service_code,
                (select 1) editable 
                FROM tehaisaki th
                left join tehaisakikanri tk on tk.tehaikanri_id = th.tehaikanri_id
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 4 

                ORDER BY    thkey,
                            th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:29:06
SELECT distinct 
    th.kubun   || '' || 
    th.gyoumu_kbn   || '' || 
    th.st_date || '' || 
    th.st_time || 
    th.ed_date || '' || 
    th.ed_time   || '' || 
    th.syukan_soshiki   || '' || 
    ts.soshiki_id  || '' || 
    array_to_string(ARRAY
        (SELECT tt.tanto_id || '' ||  
                tt.priority || '' || 
                tt.shikibetu1 || '' ||  
                tt.tel_id1 || '' ||  
                tt.shikibetu2 || '' || 
                tt.tel_id2
          FROM tehaisaki_tanto tt
          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no
          ORDER BY tt.priority), '')  || '' ||  
    array_to_string(ARRAY
        (SELECT tt.soshiki_id || '' ||  
                tt.tousei_no || '' || 
                tt.tel_id 
          FROM tehaisaki_tousei tt
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no), '') thkey,
		       	
th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then 'í èÌ' when th.kubun = '2' then 'ä˙ä‘å¿íË' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || 'Å@' || th.st_time || 'Å@Å`Å@' || th.ed_date || 'Å@' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), 'ÅA') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm,
                array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), 'Å^') tehaiTosei,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                tk.service_code,
                (select 1) editable 
                FROM tehaisaki th
                left join tehaisakikanri tk on tk.tehaikanri_id = th.tehaikanri_id
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 4 

                ORDER BY    thkey,
                            th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:32:31
select tehai_id, eda_num, soshiki_id, disp_flg, tel_id, fax_id, 
	add_date, add_userid, upd_date, upd_userid
from tehaisaki_soshiki
where tehai_id=541;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:38:49
SELECT distinct 
    th.kubun   || '' || 
    th.gyoumu_kbn   || '' || 
    th.st_date || '' || 
    th.st_time || 
    th.ed_date || '' || 
    th.ed_time   || '' || 
    th.syukan_soshiki   || '' || 
    ts.soshiki_id  || '' || 
    array_to_string(ARRAY
        (SELECT tt.tanto_id || '' ||  
                tt.priority || '' || 
                tt.shikibetu1 || '' ||  
                tt.tel_id1 || '' ||  
                tt.shikibetu2 || '' || 
                tt.tel_id2
          FROM tehaisaki_tanto tt
          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no
          ORDER BY tt.priority), '')  || '' ||  
    array_to_string(ARRAY
        (SELECT tt.soshiki_id || '' ||  
                tt.tousei_no || '' || 
                tt.tel_id 
          FROM tehaisaki_tousei tt
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no), '') thkey,
		       	
th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then 'í èÌ' when th.kubun = '2' then 'ä˙ä‘å¿íË' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || 'Å@' || th.st_time || 'Å@Å`Å@' || th.ed_date || 'Å@' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), 'ÅA') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm,
                array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), 'Å^') tehaitosei,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                tk.service_code,
                (select 1) editable 
                FROM tehaisaki th
                left join tehaisakikanri tk on tk.tehaikanri_id = th.tehaikanri_id
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 4 

                ORDER BY    thkey,
                            th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:41:37
SELECT distinct 
    th.kubun   || '' || 
    th.gyoumu_kbn   || '' || 
    th.st_date || '' || 
    th.st_time || 
    th.ed_date || '' || 
    th.ed_time   || '' || 
    th.syukan_soshiki   || '' || 
    ts.soshiki_id  || '' || 
    array_to_string(ARRAY
        (SELECT tt.tanto_id || '' ||  
                tt.priority || '' || 
                tt.shikibetu1 || '' ||  
                tt.tel_id1 || '' ||  
                tt.shikibetu2 || '' || 
                tt.tel_id2
          FROM tehaisaki_tanto tt
          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no
          ORDER BY tt.priority), '')  || '' ||  
    array_to_string(ARRAY
        (SELECT tt.soshiki_id || '' ||  
                tt.tousei_no || '' || 
                tt.tel_id 
          FROM tehaisaki_tousei tt
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no), '') thkey,
		       	
th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then 'í èÌ' when th.kubun = '2' then 'ä˙ä‘å¿íË' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || 'Å@' || th.st_time || 'Å@Å`Å@' || th.ed_date || 'Å@' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), 'ÅA') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm,
                array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), 'Å^') tehaitosei,
                array_to_string(ARRAY
		                         (SELECT tso.soshiki_id
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), 'Å^') tsil,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                tk.service_code,
                (select 1) editable 
                FROM tehaisaki th
                left join tehaisakikanri tk on tk.tehaikanri_id = th.tehaikanri_id
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 4 

                ORDER BY    thkey,
                            th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:42:09
SELECT distinct 
    th.kubun   || '' || 
    th.gyoumu_kbn   || '' || 
    th.st_date || '' || 
    th.st_time || 
    th.ed_date || '' || 
    th.ed_time   || '' || 
    th.syukan_soshiki   || '' || 
    array_to_string(ARRAY
         (SELECT tso.soshiki_id
          FROM tehaisaki_soshiki tso
          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  || '' || 
    array_to_string(ARRAY
        (SELECT tt.tanto_id || '' ||  
                tt.priority || '' || 
                tt.shikibetu1 || '' ||  
                tt.tel_id1 || '' ||  
                tt.shikibetu2 || '' || 
                tt.tel_id2
          FROM tehaisaki_tanto tt
          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no
          ORDER BY tt.priority), '')  || '' ||  
    array_to_string(ARRAY
        (SELECT tt.soshiki_id || '' ||  
                tt.tousei_no || '' || 
                tt.tel_id 
          FROM tehaisaki_tousei tt
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no), '') thkey,
		       	
th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then 'í èÌ' when th.kubun = '2' then 'ä˙ä‘å¿íË' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || 'Å@' || th.st_time || 'Å@Å`Å@' || th.ed_date || 'Å@' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), 'ÅA') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm,
                array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), 'Å^') tehaitosei,
                array_to_string(ARRAY
		                         (SELECT tso.soshiki_id
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '') tsil,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                tk.service_code,
                (select 1) editable 
                FROM tehaisaki th
                left join tehaisakikanri tk on tk.tehaikanri_id = th.tehaikanri_id
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 4 

                ORDER BY    thkey,
                            th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:47:43
SELECT distinct 
    th.kubun   || '' || 
    th.gyoumu_kbn   || '' || 
    th.st_date || '' || 
    th.st_time || 
    th.ed_date || '' || 
    th.ed_time   || '' || 
    th.syukan_soshiki   || '' || 
    array_to_string(ARRAY
         (SELECT tso.soshiki_id
          FROM tehaisaki_soshiki tso
          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  || '' || 
    array_to_string(ARRAY
        (SELECT tt.tanto_id || '' ||  
                tt.priority || '' || 
                tt.shikibetu1 || '' ||  
                tt.tel_id1 || '' ||  
                tt.shikibetu2 || '' || 
                tt.tel_id2
          FROM tehaisaki_tanto tt
          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no
          ORDER BY tt.priority), '')  || '' ||  
    array_to_string(ARRAY
        (SELECT tt.soshiki_id || '' ||  
                tt.tousei_no || '' || 
                tt.tel_id 
          FROM tehaisaki_tousei tt
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no), '') thkey,
		       	
th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then 'í èÌ' when th.kubun = '2' then 'ä˙ä‘å¿íË' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || 'Å@' || th.st_time || 'Å@Å`Å@' || th.ed_date || 'Å@' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), 'ÅA') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm,
                array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), 'Å^') tehaitosei,
                array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id 
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '') tsil,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                tk.service_code,
                (select 1) editable 
                FROM tehaisaki th
                left join tehaisakikanri tk on tk.tehaikanri_id = th.tehaikanri_id
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 4 

                ORDER BY    thkey,
                            th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:47:56
SELECT distinct 
    th.kubun   || '' || 
    th.gyoumu_kbn   || '' || 
    th.st_date || '' || 
    th.st_time || 
    th.ed_date || '' || 
    th.ed_time   || '' || 
    th.syukan_soshiki   || '' || 
    array_to_string(ARRAY
         (SELECT tso.soshiki_id
          FROM tehaisaki_soshiki tso
          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  || '' || 
    array_to_string(ARRAY
        (SELECT tt.tanto_id || '' ||  
                tt.priority || '' || 
                tt.shikibetu1 || '' ||  
                tt.tel_id1 || '' ||  
                tt.shikibetu2 || '' || 
                tt.tel_id2
          FROM tehaisaki_tanto tt
          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no
          ORDER BY tt.priority), '')  || '' ||  
    array_to_string(ARRAY
        (SELECT tt.soshiki_id || '' ||  
                tt.tousei_no || '' || 
                tt.tel_id 
          FROM tehaisaki_tousei tt
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no), '') thkey,
		       	
th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then 'í èÌ' when th.kubun = '2' then 'ä˙ä‘å¿íË' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || 'Å@' || th.st_time || 'Å@Å`Å@' || th.ed_date || 'Å@' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), 'ÅA') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm,
                array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), 'Å^') tehaitosei,
                array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id 
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                tk.service_code,
                (select 1) editable 
                FROM tehaisaki th
                left join tehaisakikanri tk on tk.tehaikanri_id = th.tehaikanri_id
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 4 

                ORDER BY    thkey,
                            th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:02:42
SELECT distinct 
    th.kubun   || '' || 
    th.gyoumu_kbn   || '' || 
    th.st_date || '' || 
    th.st_time || 
    th.ed_date || '' || 
    th.ed_time   || '' || 
    th.syukan_soshiki   || '' || 
    array_to_string(ARRAY
         (SELECT tso.soshiki_id
          FROM tehaisaki_soshiki tso
          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  || '' || 
    array_to_string(ARRAY
        (SELECT tt.tanto_id || '' ||  
                tt.priority || '' || 
                tt.shikibetu1 || '' ||  
                tt.tel_id1 || '' ||  
                tt.shikibetu2 || '' || 
                tt.tel_id2
          FROM tehaisaki_tanto tt
          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no
          ORDER BY tt.priority), '')  || '' ||  
    array_to_string(ARRAY
        (SELECT tt.soshiki_id || '' ||  
                tt.tousei_no || '' || 
                tt.tel_id 
          FROM tehaisaki_tousei tt
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no), '') thkey,
		       	
th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then 'í èÌ' when th.kubun = '2' then 'ä˙ä‘å¿íË' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || 'Å@' || th.st_time || 'Å@Å`Å@' || th.ed_date || 'Å@' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), 'ÅA') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm,
                array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), 'Å^') tehaitosei,
                array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                tk.service_code,
                (select 1) editable 
                FROM tehaisaki th
                left join tehaisakikanri tk on tk.tehaikanri_id = th.tehaikanri_id
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 4 

                ORDER BY    thkey,
                            th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:03:59
SELECT distinct 
    th.kubun   || '' || 
    th.gyoumu_kbn   || '' || 
    th.st_date || '' || 
    th.st_time || 
    th.ed_date || '' || 
    th.ed_time   || '' || 
    th.syukan_soshiki   || '' || 
    array_to_string(ARRAY
         (SELECT tso.soshiki_id
          FROM tehaisaki_soshiki tso
          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  || '' || 
    array_to_string(ARRAY
        (SELECT tt.tanto_id || '' ||  
                tt.priority || '' || 
                tt.shikibetu1 || '' ||  
                tt.tel_id1 || '' ||  
                tt.shikibetu2 || '' || 
                tt.tel_id2
          FROM tehaisaki_tanto tt
          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no
          ORDER BY tt.priority), '')  || '' ||  
    array_to_string(ARRAY
        (SELECT tt.soshiki_id || '' ||  
                tt.tousei_no || '' || 
                tt.tel_id 
          FROM tehaisaki_tousei tt
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no), '') thkey,
		       	
th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then 'í èÌ' when th.kubun = '2' then 'ä˙ä‘å¿íË' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || 'Å@' || th.st_time || 'Å@Å`Å@' || th.ed_date || 'Å@' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), 'ÅA') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm,
                array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), 'Å^') tehaitosei,
                array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)  || '_' || 
                                    (SELECT faxno FROM soshiki_fax sfax WHERE sfax.soshiki_id =tso.soshiki_id AND sfax.fax_id=tso.fax_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                tk.service_code,
                (select 1) editable 
                FROM tehaisaki th
                left join tehaisakikanri tk on tk.tehaikanri_id = th.tehaikanri_id
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 4 

                ORDER BY    thkey,
                            th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:16:45
select ttanto.soshiki_id, ttanto.tanto_id, priority, ttanto.shikibetu1, ttanto.tel_id1, ttanto.shikibetu2, ttanto.tel_id2
from tehaisaki_tanto ttanto
where ttanto.tehai_id = 541 and ttanto.eda_no=1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:17:22
select ttanto.soshiki_id, ttanto.tanto_id, ttanto.shikibetu1, ttanto.tel_id1, ttanto.shikibetu2, ttanto.tel_id2
from tehaisaki_tanto ttanto
where ttanto.tehai_id = 541 and ttanto.eda_no=1
order by ttanto.priority;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:17:32
select ttanto.soshiki_id, ttanto.tanto_id, ttanto.shikibetu1, ttanto.tel_id1, ttanto.shikibetu2, ttanto.tel_id2,priority
from tehaisaki_tanto ttanto
where ttanto.tehai_id = 541 and ttanto.eda_no=1
order by ttanto.priority;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:59:14
SELECT distinct 
    th.kubun   || '' || 
    th.gyoumu_kbn   || '' || 
    th.st_date || '' || 
    th.st_time || 
    th.ed_date || '' || 
    th.ed_time   || '' || 
    th.syukan_soshiki   || '' || 
    array_to_string(ARRAY
         (SELECT tso.soshiki_id
          FROM tehaisaki_soshiki tso
          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  || '' || 
    array_to_string(ARRAY
        (SELECT tt.tanto_id || '' ||  
                tt.priority || '' || 
                tt.shikibetu1 || '' ||  
                tt.tel_id1 || '' ||  
                tt.shikibetu2 || '' || 
                tt.tel_id2
          FROM tehaisaki_tanto tt
          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no
          ORDER BY tt.priority), '')  || '' ||  
    array_to_string(ARRAY
        (SELECT tt.soshiki_id || '' ||  
                tt.tousei_no || '' || 
                tt.tel_id 
          FROM tehaisaki_tousei tt
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no), '') thkey,
		       	
th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then 'í èÌ' when th.kubun = '2' then 'ä˙ä‘å¿íË' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || 'Å@' || th.st_time || 'Å@Å`Å@' || th.ed_date || 'Å@' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), 'ÅA') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm,
                array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), 'Å^') tehaitosei,
                array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)  || '_' || 
                                    (SELECT faxno FROM soshiki_fax sfax WHERE sfax.soshiki_id =tso.soshiki_id AND sfax.fax_id=tso.fax_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,
                array_to_string(ARRAY
		                         (select ttanto.soshiki_id || '_' || ttanto.tanto_id || '_' || ttanto.shikibetu1 || '_' || ttanto.tel_id1 || '_' ||  ttanto.shikibetu2 || '_' ||  ttanto.tel_id2
                                    from tehaisaki_tanto ttanto
                                    where ttanto.tehai_id = th.tehai_id AND th.eda_no = ttanto.eda_no
                                    order by ttanto.priority), '/') ttil,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                tk.service_code,
                (select 1) editable 
                FROM tehaisaki th
                left join tehaisakikanri tk on tk.tehaikanri_id = th.tehaikanri_id
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 4 

                ORDER BY    thkey,
                            th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:15:27
SELECT distinct 
    th.kubun   || '' || 
    th.gyoumu_kbn   || '' || 
    th.st_date || '' || 
    th.st_time || 
    th.ed_date || '' || 
    th.ed_time   || '' || 
    th.syukan_soshiki   || '' || 
    array_to_string(ARRAY
         (SELECT tso.soshiki_id
          FROM tehaisaki_soshiki tso
          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  || '' || 
    array_to_string(ARRAY
        (SELECT tt.tanto_id || '' ||  
                tt.priority || '' || 
                tt.shikibetu1 || '' ||  
                tt.tel_id1 || '' ||  
                tt.shikibetu2 || '' || 
                tt.tel_id2
          FROM tehaisaki_tanto tt
          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no
          ORDER BY tt.priority), '')  || '' ||  
    array_to_string(ARRAY
        (SELECT tt.soshiki_id || '' ||  
                tt.tousei_no || '' || 
                tt.tel_id 
          FROM tehaisaki_tousei tt
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no), '') thkey,
		       	
th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then 'í èÌ' when th.kubun = '2' then 'ä˙ä‘å¿íË' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || 'Å@' || th.st_time || 'Å@Å`Å@' || th.ed_date || 'Å@' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), 'ÅA') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm,
                array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), 'Å^') tehaitosei,
                array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)  || '_' || 
                                    (SELECT faxno FROM soshiki_fax sfax WHERE sfax.soshiki_id =tso.soshiki_id AND sfax.fax_id=tso.fax_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,
                array_to_string(ARRAY
		                         (select ttanto.soshiki_id || '_' || ttanto.tanto_id || '_' || ttanto.shikibetu1 || '_' || ttanto.tel_id1 || '_' ||  ttanto.shikibetu2 || '_' ||  ttanto.tel_id2
                                    from tehaisaki_tanto ttanto
                                    where ttanto.tehai_id = th.tehai_id AND th.eda_no = ttanto.eda_no
                                    order by ttanto.priority), '/') ttil,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                tk.service_code,
                th.kikan_naiyou,
                (select 1) editable 
                FROM tehaisaki th
                left join tehaisakikanri tk on tk.tehaikanri_id = th.tehaikanri_id
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 4 

                ORDER BY    thkey,
                            th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:16:20
SELECT distinct 
    th.kubun   || '' || 
    th.gyoumu_kbn   || '' || 
    th.st_date || '' || 
    th.st_time || 
    th.ed_date || '' || 
    th.ed_time   || '' || 
    th.syukan_soshiki   || '' || 
    array_to_string(ARRAY
         (SELECT tso.soshiki_id
          FROM tehaisaki_soshiki tso
          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  || '' || 
    array_to_string(ARRAY
        (SELECT tt.tanto_id || '' ||  
                tt.priority || '' || 
                tt.shikibetu1 || '' ||  
                tt.tel_id1 || '' ||  
                tt.shikibetu2 || '' || 
                tt.tel_id2
          FROM tehaisaki_tanto tt
          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no
          ORDER BY tt.priority), '')  || '' ||  
    array_to_string(ARRAY
        (SELECT tt.soshiki_id || '' ||  
                tt.tousei_no || '' || 
                tt.tel_id 
          FROM tehaisaki_tousei tt
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no), '') thkey,
		       	
th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then 'í èÌ' when th.kubun = '2' then 'ä˙ä‘å¿íË' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || 'Å@' || th.st_time || 'Å@Å`Å@' || th.ed_date || 'Å@' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), 'ÅA') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm,
                array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), 'Å^') tehaitosei,
                array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)  || '_' || 
                                    (SELECT faxno FROM soshiki_fax sfax WHERE sfax.soshiki_id =tso.soshiki_id AND sfax.fax_id=tso.fax_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,
                array_to_string(ARRAY
		                         (select ttanto.soshiki_id || '_' || ttanto.tanto_id || '_' || ttanto.shikibetu1 || '_' || ttanto.tel_id1 || '_' ||  ttanto.shikibetu2 || '_' ||  ttanto.tel_id2
                                    from tehaisaki_tanto ttanto
                                    where ttanto.tehai_id = th.tehai_id AND th.eda_no = ttanto.eda_no
                                    order by ttanto.priority), '/') ttil,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                tk.service_code,
                th.kikan_naiyou,
                (select 1) editable 
                FROM tehaisaki th
                left join tehaisakikanri tk on tk.tehaikanri_id = th.tehaikanri_id
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 4 

                ORDER BY    thkey,
                            th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:21:14
INSERT INTO tehaisaki (tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid)
VALUES(4,
       3795,
       1,
       '1',
       '1',
       '',
       '2017/4/18',
       '09:00',
       '',
       '',
       '3',
       '422',
       '',
       '2017/4/18 09:00:00',
       'kanri2',
       '2017/4/18 09:00:00',
       'kanri2');
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:21:44
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=3795;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:25:31
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=3795;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:32:01
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=3795;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:33:01
SELECT distinct 
    th.kubun   || '' || 
    th.gyoumu_kbn   || '' || 
    th.st_date || '' || 
    th.st_time || 
    th.ed_date || '' || 
    th.ed_time   || '' || 
    th.syukan_soshiki   || '' || 
    array_to_string(ARRAY
         (SELECT tso.soshiki_id
          FROM tehaisaki_soshiki tso
          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  || '' || 
    array_to_string(ARRAY
        (SELECT tt.tanto_id || '' ||  
                tt.priority || '' || 
                tt.shikibetu1 || '' ||  
                tt.tel_id1 || '' ||  
                tt.shikibetu2 || '' || 
                tt.tel_id2
          FROM tehaisaki_tanto tt
          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no
          ORDER BY tt.priority), '')  || '' ||  
    array_to_string(ARRAY
        (SELECT tt.soshiki_id || '' ||  
                tt.tousei_no || '' || 
                tt.tel_id 
          FROM tehaisaki_tousei tt
          WHERE tt.tehai_id = th.tehai_id
            AND tt.eda_no = th.eda_no), '') thkey,
		       	
th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then 'í èÌ' when th.kubun = '2' then 'ä˙ä‘å¿íË' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || 'Å@' || th.st_time || 'Å@Å`Å@' || th.ed_date || 'Å@' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), 'ÅA') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), 'Å^') gkbn_nm,
                array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), 'Å^') tehaitosei,
                array_to_string(ARRAY
		                         (SELECT tso.disp_flg || '_' ||  tso.soshiki_id || '_' ||  tso.tel_id || '_' ||  tso.fax_id  || '_' || 
                                    (SELECT telno FROM soshiki_tel stel WHERE stel.soshiki_id =tso.soshiki_id AND stel.tel_id=tso.tel_id)  || '_' || 
                                    (SELECT faxno FROM soshiki_fax sfax WHERE sfax.soshiki_id =tso.soshiki_id AND sfax.fax_id=tso.fax_id)
		                          FROM tehaisaki_soshiki tso
		                          WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '/') tsil,
                array_to_string(ARRAY
		                         (select ttanto.soshiki_id || '_' || ttanto.tanto_id || '_' || ttanto.shikibetu1 || '_' || ttanto.tel_id1 || '_' ||  ttanto.shikibetu2 || '_' ||  ttanto.tel_id2
                                    from tehaisaki_tanto ttanto
                                    where ttanto.tehai_id = th.tehai_id AND th.eda_no = ttanto.eda_no
                                    order by ttanto.priority), '/') ttil,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                tk.service_code,
                th.kikan_naiyou,
                th.bikou,
                (select 1) editable 
                FROM tehaisaki th
                left join tehaisakikanri tk on tk.tehaikanri_id = th.tehaikanri_id
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 4 

                ORDER BY    thkey,
                            th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:33:06
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=3795;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:34:53
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=3795;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:34:53
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=3795;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:34:54
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=3795;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 13:35:08
select tehai_id, eda_no, soshiki_id, tousei_no, tel_id, add_date, 
	add_userid, upd_date, upd_userid
from tehaisaki_tousei
where tehai_id=3795;
--/

