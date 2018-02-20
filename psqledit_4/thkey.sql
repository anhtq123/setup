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
							 kubun1