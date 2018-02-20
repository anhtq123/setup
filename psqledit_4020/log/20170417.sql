-- psqledit log file
-- date: 2017-04-17

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:48:38
select gyoumu_kbn, gyoumu_name, service_code
from gyoumukubun
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:54:42
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
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '、') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, 
                (select 1) editable 
                FROM tehaisaki th
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:57:58
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
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	array_to_string(ARRAY
		                         (SELECT tm.tanto_id
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '、') tanto_id,
		       	array_to_string(ARRAY
		                         (SELECT gyoumu_name
		                          FROM gyoumukubun gb
		                          WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
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

