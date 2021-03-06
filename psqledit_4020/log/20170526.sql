-- psqledit log file
-- date: 2017-05-26

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:02:18
				SELECT distinct
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
                                ts.tel_id	    || '-' ||
                                ts.fax_id
                        FROM tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')  								  ||
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||
								tt.priority 	|| '' ||
								tt.shikibetu1 	|| '' ||
								tt.tel_id1 		|| '' ||
								tt.shikibetu2 	|| '' ||
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  										||
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||
								tt.tousei_no 	|| '' ||
								tt.tel_id
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:03:03
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id in (3877,
3879,
3878
);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:04:24
				SELECT distinct
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
                                ts.tel_id	    || '-' ||
                                ts.fax_id
                        FROM tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')  								  ||
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||
					
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||
								tt.tousei_no 	|| '' ||
								tt.tel_id
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:04:50
				SELECT distinct
				array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||
								tt.priority 	|| '' ||
								tt.shikibetu1 	|| '' ||
								tt.tel_id1 		|| '' ||
								tt.shikibetu2 	|| '' ||
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), ''),
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
                                ts.tel_id	    || '-' ||
                                ts.fax_id
                        FROM tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')  								  ||
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||
								tt.priority 	|| '' ||
								tt.shikibetu1 	|| '' ||
								tt.tel_id1 		|| '' ||
								tt.shikibetu2 	|| '' ||
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  										||
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||
								tt.tousei_no 	|| '' ||
								tt.tel_id
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:05:48
				SELECT distinct
				array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||
								tt.priority 	|| '' ||
								tt.shikibetu1 	|| '' ||
								tt.tel_id1 		|| '' ||
								tt.shikibetu2 	|| '' ||
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  LEFT JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), ''),
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
                                ts.tel_id	    || '-' ||
                                ts.fax_id
                        FROM tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')  								  ||
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||
								tt.priority 	|| '' ||
								tt.shikibetu1 	|| '' ||
								tt.tel_id1 		|| '' ||
								tt.shikibetu2 	|| '' ||
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  										||
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||
								tt.tousei_no 	|| '' ||
								tt.tel_id
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:06:13
				SELECT distinct
				array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||
								tt.priority 	|| '' ||
								tt.shikibetu1 	|| '' ||
								tt.tel_id1 		|| '' ||
								tt.shikibetu2 	|| '' ||
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  LEFT JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), ''),
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
                                ts.tel_id	    || '-' ||
                                ts.fax_id
                        FROM tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')  								  ||
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||
								tt.priority 	|| '' ||
								tt.shikibetu1 	|| '' ||
								tt.tel_id1 		|| '' ||
								tt.shikibetu2 	|| '' ||
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  LEFT JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  										||
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||
								tt.tousei_no 	|| '' ||
								tt.tel_id
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:08:38
select tehai_id, eda_no, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2, add_date, add_userid, upd_date, 
	upd_userid
from tehaisaki_tanto
where tehai_id=3877;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:09:49
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id in (3877
);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:14:41
				SELECT distinct
				
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
                                ts.tel_id	    || '-' ||
                                ts.fax_id
                        FROM tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')  								  ||
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||
					
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||
								tt.tousei_no 	|| '' ||
								tt.tel_id
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:14:54
				SELECT distinct
				
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
                                ts.tel_id	    || '-' ||
                                ts.fax_id
                        FROM tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')  								  ||
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||
					
			
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:14:57
				SELECT distinct
				
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
                                ts.tel_id	    || '-' ||
                                ts.fax_id
                        FROM tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')  								  ||
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||
					
			
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:15:00
				SELECT distinct
				
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
                                ts.tel_id	    || '-' ||
                                ts.fax_id
                        FROM tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')  								  ||
				
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:15:12
				SELECT distinct
				
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
                                ts.tel_id	    || '-' ||
                                ts.fax_id
                        FROM tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')  								  ||
				
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:15:14
				SELECT distinct
				
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
				
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:15:25
				SELECT distinct
				
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:15:36
				SELECT distinct
				
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(
				
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:16:25
				SELECT distinct
				
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
				
					th.kubun) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:26:22
				SELECT distinct
				array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||
								tt.priority 	|| '' ||
								tt.shikibetu1 	|| '' ||
								tt.tel_id1 		|| '' ||
								tt.shikibetu2 	|| '' ||
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), ''),
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
                                ts.tel_id	    || '-' ||
                                ts.fax_id
                        FROM tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')  								  ||
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||
								tt.priority 	|| '' ||
								tt.shikibetu1 	|| '' ||
								tt.tel_id1 		|| '' ||
								tt.shikibetu2 	|| '' ||
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  										||
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||
								tt.tousei_no 	|| '' ||
								tt.tel_id
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:26:36
				SELECT distinct 
				th.bikou,
				array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||
								tt.priority 	|| '' ||
								tt.shikibetu1 	|| '' ||
								tt.tel_id1 		|| '' ||
								tt.shikibetu2 	|| '' ||
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), ''),
					th.gyoumu_kbn 	||
					th.st_date 		||
					th.st_time 		||
					th.ed_date 		||
					th.ed_time   	||
					th.kubun   		||
					md5(th.syukan_soshiki   ||
					array_to_string(ARRAY (
                            SELECT
                                ts.soshiki_id	|| '-' ||
                                ts.disp_flg	|| '-' ||
                                ts.tel_id	    || '-' ||
                                ts.fax_id
                        FROM tehaisaki_soshiki ts
                        WHERE ts.tehai_id = th.tehai_id
                        	AND ts.eda_num = th.eda_no), '')  								  ||
					array_to_string(ARRAY
						(SELECT tso.soshiki_id
						  FROM tehaisaki_soshiki tso
						  WHERE tso.tehai_id = th.tehai_id AND th.eda_no = tso.eda_num), '')  ||
					array_to_string(ARRAY
						(SELECT tt.tanto_id 	|| '' ||
								tt.priority 	|| '' ||
								tt.shikibetu1 	|| '' ||
								tt.tel_id1 		|| '' ||
								tt.shikibetu2 	|| '' ||
								tt.tel_id2
						  FROM tehaisaki_tanto tt
						  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no
						  ORDER BY tt.priority), '')  										||
					array_to_string(ARRAY
						(SELECT tt.soshiki_id 	|| '' ||
								tt.tousei_no 	|| '' ||
								tt.tel_id
						  FROM tehaisaki_tousei tt
						  WHERE tt.tehai_id = th.tehai_id
							AND tt.eda_no = th.eda_no), '') 								||
					th.bikou) thkey,
					th.tehai_id,
					th.eda_no,
					th.timezone_code,
					case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
					th.kikan_naiyou,
					(th.st_date || '　' || th.st_time || '　〜　' || th.ed_date || '　' || th.ed_time) kikan,
					th.gyoumu_kbn,
					(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
					array_to_string (ARRAY
											   (SELECT soshiki_name
												FROM soshiki_mst
												WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%'
												  AND length(soshiki_code) <= length(sm.soshiki_code)
												  AND kaisya_id = sm.kaisya_id
												  AND soshiki_code = left(sm.soshiki_code, length(soshiki_code))
												ORDER BY soshiki_code), '　') soshiki_name,
					tz.timezone_name,
					array_to_string(ARRAY
									 (SELECT tm.tanto_name
									  FROM tehaisaki_tanto tt
									  JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
									  WHERE tt.tehai_id = th.tehai_id
										AND tt.eda_no = th.eda_no
									  ORDER BY tt.priority), '、') tanto_name,
					array_to_string(ARRAY
									 (SELECT gyoumu_name
									  FROM gyoumukubun gb
									  WHERE th.gyoumu_kbn = th.gyoumu_kbn | gb.gyoumu_kbn), '／') gkbn_nm,
					array_to_string(ARRAY
		                         (SELECT tsei.soshiki_id || '_' || tsei.tel_id || '_' || tsei.tousei_no
		                          FROM tehaisaki_tousei tsei
		                          WHERE tsei.tehai_id = th.tehai_id AND th.eda_no = tsei.eda_no), '／') tehaitosei,
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
					tk.service_code,
					sm.kaisya_id,
					th.kubun kubun1,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code,
					th.kikan_naiyou,
					th.syukan_soshiki,
					th.bikou,
					(select 1) editable
					
				FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				LEFT JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = th.tehaikanri_id
				WHERE th.tehaikanri_id = 140 
					AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,658,355,423,379,88,200,117,198,447,421,463,668,669,670,671,672,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,666,667,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,659,660,661,662,478,484,486,488,649,479,482,485,657,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) )
				ORDER BY
					kubun1,
					th.gyoumu_kbn,
					th.st_date,
					th.st_time,
					th.ed_date,
					th.ed_time,
					th.timezone_code;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:39:32
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id in (3930
);
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 14:57:59
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id in (3941
);
--/

