-- psqledit log file
-- date: 2017-04-13

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:02:40
SELECT tehaikanri_id
FROM tehaisakikanri
WHERE kyoten_area ='滋賀＿専用＿１'
  AND service_code =
    (SELECT service_code
     FROM tehaisakikanri
     WHERE tehaikanri_id = 1)
  AND fuken_code =
    (SELECT fuken_code
     FROM tehaisakikanri
     WHERE tehaikanri_id = 1)
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:03:04
SELECT tehaikanri_id
FROM tehaisakikanri
WHERE kyoten_area ='滋賀＿専用＿２'
  AND service_code =
    (SELECT service_code
     FROM tehaisakikanri
     WHERE tehaikanri_id = 1)
  AND fuken_code =
    (SELECT fuken_code
     FROM tehaisakikanri
     WHERE tehaikanri_id = 1)
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:03:11
SELECT tehaikanri_id
FROM tehaisakikanri
WHERE kyoten_area ='滋賀＿専用＿２';
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 09:03:18
SELECT tehaikanri_id
FROM tehaisakikanri
WHERE kyoten_area ='滋賀＿専用＿３'
  AND service_code =
    (SELECT service_code
     FROM tehaisakikanri
     WHERE tehaikanri_id = 1)
  AND fuken_code =
    (SELECT fuken_code
     FROM tehaisakikanri
     WHERE tehaikanri_id = 1)
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:09:26
update tehaisakikanri
set kyoten_area ='滋賀＿専用＿３'
WHERE tehaikanri_id = 1
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:09:48
update tehaisakikanri
set kyoten_area ='滋賀＿専用＿１'
WHERE tehaikanri_id = 1
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:09:58
update tehaisakikanri
set kyoten_area ='滋賀＿専用＿２'
WHERE tehaikanri_id = 2
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 10:50:11
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
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
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1  AND (th.syukan_soshiki IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,355,423,379,88,200,117,198,421,447,463,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,478,484,486,488,479,482,485,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,355,423,379,88,200,117,198,421,447,463,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,478,484,486,488,479,482,485,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) ) ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:37:24
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
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
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1  AND (th.syukan_soshiki IN (0)
					   OR ts.soshiki_id IN (1,2,3,4,600,601,602,603,5,13,54,199,299,422,355,423,379,88,200,117,198,421,447,463,19,55,202,300,89,204,301,118,201,139,155,203,424,448,25,56,205,90,206,119,207,140,208,302,156,209,303,163,211,304,426,450,464,469,472,475,167,212,305,170,210,425,449,31,58,215,429,451,465,470,473,476,477,91,214,428,306,356,380,120,217,308,141,218,431,453,466,471,474,309,357,381,157,216,307,430,452,35,57,213,427,39,59,220,433,454,310,434,455,358,435,382,92,219,432,456,467,41,60,224,312,359,438,458,93,221,121,223,311,437,142,222,436,457,6,12,50,178,286,84,181,113,182,289,348,135,179,287,152,180,288,18,51,185,292,350,85,186,293,351,377,114,183,290,349,136,184,291,24,52,191,86,192,115,193,137,190,419,297,354,153,189,418,296,353,161,187,415,295,352,378,166,188,417,294,416,169,30,53,195,87,197,116,138,194,154,162,196,298,420,7,11,48,174,284,347,82,175,17,46,171,282,23,47,172,283,346,81,173,29,49,177,285,83,176,8,14,61,226,313,360,94,227,314,361,122,225,439,20,62,231,95,232,123,229,143,228,158,230,26,63,233,440,459,315,96,235,316,124,236,317,144,234,32,64,238,441,460,319,362,383,97,237,318,125,241,321,364,145,239,320,363,159,242,322,365,164,243,323,366,168,240,36,65,247,442,461,468,327,98,246,326,126,244,324,146,245,325,160,248,328,165,249,9,15,66,250,329,99,127,21,67,251,330,100,27,68,252,331,101,128,147,33,70,255,445,333,367,103,256,37,69,253,443,332,444,462,102,254,10,16,72,260,335,368,384,391,104,258,129,259,22,73,262,336,369,105,130,261,28,71,257,334,34,74,263,337,370,385,392,397,401,106,264,38,75,267,339,446,371,386,393,107,265,338,131,268,148,266,40,76,270,340,372,387,108,269,132,272,341,149,271,42,77,274,342,373,388,394,398,402,405,408,411,109,273,43,78,275,343,374,110,133,150,276,44,79,277,344,375,389,395,399,403,406,409,412,111,134,279,151,278,45,80,280,345,376,390,396,400,404,407,410,413,414,112,281,478,484,486,488,479,482,485,487,480,481,483,489,496,509,501,490,498,512,514,503,511,506,510,513,515,516,508,491,500,505,507,492,499,504,493,497,502,494,495,517,518,519,520,521,522,523,524,527,525,528,530,532,534,531,533,526,529,535,536,537,538,539,541,543,545,546,547,548,549,540,542,544,550,551,553,556,558,555,557,559,552,554,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,621,575,576,577,596,597,598,583,599,604,605,609,610,611,634,635,644,642,638,636,639)
					   OR ts.soshiki_id IN (0) ) ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:37:40
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
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
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1  AND (th.syukan_soshiki IN (0)
					  
					   OR ts.soshiki_id IN (0) ) ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:38:17
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
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
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
 ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:48:01
SELECT distinct th.tehai_id,
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
				th.kubun kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki, (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:49:16
SELECT distinct th.tehai_id,
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
				th.syukan_soshiki, (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:53:33
SELECT distinct th.tehai_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:54:15
SELECT distinct th.tehai_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 11:55:37
SELECT distinct th.tehai_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@localhost:5432.postgres 15:38:13
CREATE TABLE categories (
 category_id serial PRIMARY KEY,
 category_name VARCHAR (255) NOT NULL
);
--/

--postgres@localhost:5432.postgres 15:39:48
CREATE TABLE products (
 product_id serial PRIMARY KEY,
 product_name VARCHAR (255) NOT NULL,
 category_id INT NOT NULL,
 FOREIGN KEY (category_id) REFERENCES categories (category_id)
);
--/

--postgres@localhost:5432.postgres 15:40:17
INSERT INTO categories (category_name)
VALUES
 ('Smart Phone'),
 ('Laptop'),
 ('Tablet');
--/

--postgres@localhost:5432.postgres 15:40:18
 
INSERT INTO products (product_name, category_id)
VALUES
 ('iPhone', 1),
 ('Samsung Galaxy', 1),
 ('HP Elite', 2),
 ('Lenovo Thinkpad', 2),
 ('iPad', 3),
 ('Kindle Fire', 3);
--/

--postgres@localhost:5432.postgres 15:40:50
SELECT
 *
FROM
 products
NATURAL JOIN categories;
--/

--postgres@localhost:5432.postgres 15:43:46
SELECT *
FROM
 products p
JOIN categories c on c.category_id=p.category_id;
--/

--postgres@localhost:5432.postgres 15:45:05
SELECT *
FROM categories c
JOIN products p on c.category_id=p.category_id
where p.product_id='2';
--/

--postgres@localhost:5432.postgres 15:45:43
SELECT *
FROM categories c
JOIN products p on c.category_id=p.category_id
where p.product_id='2';
--/

--postgres@localhost:5432.postgres 15:46:03
SELECT *
FROM categories c
JOIN products p on c.category_id=p.category_id
where p.product_id is null;
--/

--postgres@localhost:5432.postgres 15:46:08
SELECT *
FROM categories c
JOIN products p on c.category_id=p.category_id;
--/

--postgres@localhost:5432.postgres 15:46:22
SELECT *
FROM categories c
left JOIN products p on c.category_id=p.category_id
where p.product_id is null;
--/

--postgres@localhost:5432.postgres 15:46:28
SELECT *
FROM categories c
left JOIN products p on c.category_id=p.category_id;
--/

--postgres@localhost:5432.postgres 15:46:59
SELECT *
FROM categories c
JOIN products p on c.category_id=p.category_id;
--/

--postgres@localhost:5432.postgres 15:47:04
SELECT *
FROM categories c
left JOIN products p on c.category_id=p.category_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:00:26
SELECT distinct th.tehai_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:01:13
select tehai_id, eda_no, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2, add_date, add_userid, upd_date, 
	upd_userid
from tehaisaki_tanto
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:03:42
select tehai_id, eda_no, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2, add_date, add_userid, upd_date, 
	upd_userid
from tehaisaki_tanto
where tehai_id=134
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:31:13
select tanto_id, tel_id, telno
from tanto_tel
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:31:55
select tanto_id, tel_id, telno
from tanto_tel
where tanto_id=73;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:32:01
select tanto_id, tel_id, telno
from tanto_tel
where tanto_id=74;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:32:29
select tehai_id, eda_no, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2
	upd_userid
from tehaisaki_tanto
where tehai_id=134
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:32:35
select tehai_id, eda_no, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:33:53
select tehai_id, eda_no, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:35:54
SELECT distinct th.tehai_id,
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
		                         (SELECT tel_id1
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:36:14
SELECT distinct th.tehai_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:36:54
select tehai_id, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:37:23
select tehai_id+ soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:37:36
select tehai_id+ soshiki_id+ tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:37:49
select tehai_id, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:38:22
select tehai_id, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:39:53
select tehai_id-soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:40:02
select tehai_id, soshiki_id, tanto_id, priority, shikibetu1, 
	tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:47:12
select tehai_id | soshiki_id, tanto_id, priority, shikibetu1, tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:47:27
select tehai_id | soshiki_id| tanto_id, priority, shikibetu1, tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:47:41
select tehai_id, soshiki_id, tanto_id, priority, shikibetu1, tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:51:36
select tehai_id || ' - ' || soshiki_id, tanto_id, priority, shikibetu1, tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:51:48
select tehai_id ||''|| soshiki_id, tanto_id, priority, shikibetu1, tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:53:12
select tehai_id || '' || soshiki_id, tanto_id, priority, shikibetu1, tel_id1, shikibetu2, tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:53:40
select tehai_id || '' || soshiki_id || '' || tanto_id || '' ||  priority || '' || shikibetu1 || '' ||  tel_id1 || '' ||  shikibetu2 || '' || tel_id2
from tehaisaki_tanto
where tehai_id=134
order by tehai_id,tanto_id
;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:54:30
SELECT distinct th.tehai_id,
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
		                         (SELECT tt.tehai_id || '' || tt.soshiki_id || '' || tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:56:17
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tehai_id || '' || tt.soshiki_id || '' || tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:58:15
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || array_to_string(ARRAY
		                         (SELECT tt.tehai_id || '' || tt.soshiki_id || '' || tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:59:10
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time   || '' || array_to_string(ARRAY
		                         (SELECT tt.tehai_id || '' || tt.soshiki_id || '' || tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:59:29
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '　' || th.st_time || th.ed_date || '' || th.ed_time   || '' || array_to_string(ARRAY
		                         (SELECT tt.tehai_id || '' || tt.soshiki_id || '' || tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:59:30
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '　' || th.st_time || th.ed_date || '' || th.ed_time   || '' || array_to_string(ARRAY
		                         (SELECT tt.tehai_id || '' || tt.soshiki_id || '' || tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 16:59:58
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || array_to_string(ARRAY
		                         (SELECT tt.tehai_id || '' || tt.soshiki_id || '' || tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:00:52
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || array_to_string(ARRAY
		                         (SELECT tt.tehai_id || '' || tt.soshiki_id || '' || tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:04:18
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tehai_id || '' || tt.soshiki_id || '' || tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:04:51
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:13:56
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:15:19
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:15:19
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:15:19
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:15:20
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:15:20
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:15:20
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:15:20
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:15:21
SELECT distinct th.tehai_id,
		       	th.eda_no,
		       	th.timezone_code,
		       	case when th.kubun = '1' then '通常' when th.kubun = '2' then '期間限定' else '' end kubun,
		       	th.kikan_naiyou,
		       	(th.st_date || '　' || th.st_time || '　～　' || th.ed_date || '　' || th.ed_time) kikan,
		       	th.gyoumu_kbn,
		       	(select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || '　' ||
		       	th.syukan_soshiki,
		       	tz.timezone_name,
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:15:32
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:16:12
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:16:13
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:16:13
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:16:13
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:16:13
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:16:14
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:16:14
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:16:14
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:16:27
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
		       	
				th.syukan_soshiki, 
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:16:32
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id,
		       	
				
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:16:52
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id
		       	
				
                 FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:17:35
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id
		       	
				
                 FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
                left join tehaisaki_tousei tto on th.tehai_id = tto.tehai_id
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:18:05
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki  || '' || tto.soshiki_id  || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id
		       	
				
                 FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
                left join tehaisaki_tousei tto on th.tehai_id = tto.tehai_id
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:18:31
SELECT distinct 
		       	th.tehai_id  || '' || th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
		                         (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id
		       	
				
                 FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
                left join tehaisaki_tousei tto on th.tehai_id = tto.tehai_id
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:19:28
SELECT distinct 
    th.tehai_id  || '' || 
    th.eda_no   || '' || th.kubun   || '' || th.gyoumu_kbn   || '' || th.st_date || '' || th.st_time || th.ed_date || '' || th.ed_time   || '' || th.syukan_soshiki   || '' || ts.soshiki_id  || '' || array_to_string(ARRAY
    (SELECT tt.tanto_id || '' ||  tt.priority || '' || tt.shikibetu1 || '' ||  tt.tel_id1 || '' ||  tt.shikibetu2 || '' || tt.tel_id2
		                          FROM tehaisaki_tanto tt
		                          JOIN tanto_mst tm ON tt.tanto_id = tm.tanto_id
		                          WHERE tt.tehai_id = th.tehai_id
		                            AND tt.eda_no = th.eda_no
		                          ORDER BY tt.priority), '') tanto_id
		       	
				
                 FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
                left join tehaisaki_tousei tto on th.tehai_id = tto.tehai_id
				WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:20:26
SELECT distinct 
    th.tehai_id  || '' || 
    th.eda_no   || '' || 
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
          ORDER BY tt.priority), '') tanto_id
		       	
				
FROM tehaisaki th
JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
left join tehaisaki_tousei tto on th.tehai_id = tto.tehai_id
WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:26:12
SELECT distinct 
    th.tehai_id  || '' || 
    th.eda_no   || '' || 
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
            AND tt.eda_no = th.eda_no), '') tanto_id
		       	
				
FROM tehaisaki th
JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num

WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:26:30
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
            AND tt.eda_no = th.eda_no), '') tanto_id
		       	
				
FROM tehaisaki th
JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:27:41
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
            AND tt.eda_no = th.eda_no), '') thkey
		       	
				
FROM tehaisaki th
JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:29:16
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
          ORDER BY tt.priority), '')  thkey
		       	
				
FROM tehaisaki th
JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
WHERE th.tehaikanri_id = 1 
                ;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:30:01
SELECT distinct th.tehai_id,
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:30:21
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:32:39
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:36:48
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
                (select 1) editable FROM tehaisaki th
				JOIN soshiki_mst sm ON th.syukan_soshiki = sm.soshiki_id
				JOIN timezone_mst tz ON th.timezone_code = tz.timezone_code
				JOIN tehaisaki_soshiki ts ON th.tehai_id = ts.tehai_id AND th.eda_no = ts.eda_num
				WHERE th.tehaikanri_id = 1 

group by thkey,th.tehai_id,th.eda_no,
		       	th.timezone_code,kubun,
		       	th.kikan_naiyou, kikan,
		       	th.gyoumu_kbn,th.syukan_soshiki,
		       	tz.timezone_name,gkbn_nm,
				kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki,editable
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:38:04
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
				WHERE th.tehaikanri_id = 1 

group by thkey,th.tehai_id,th.eda_no,
		       	th.timezone_code,kubun,
		       	th.kikan_naiyou, kikan,
		       	th.gyoumu_kbn,th.syukan_soshiki,
		       	tz.timezone_name,gkbn_nm,
				kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki,editable
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:40:12
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
				WHERE th.tehaikanri_id = 2 

group by thkey,th.tehai_id,th.eda_no,
		       	th.timezone_code,kubun,
		       	th.kikan_naiyou, kikan,
		       	th.gyoumu_kbn,th.syukan_soshiki,
		       	tz.timezone_name,gkbn_nm,
				kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki,editable
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:40:19
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
				WHERE th.tehaikanri_id = 3 

group by thkey,th.tehai_id,th.eda_no,
		       	th.timezone_code,kubun,
		       	th.kikan_naiyou, kikan,
		       	th.gyoumu_kbn,th.syukan_soshiki,
		       	tz.timezone_name,gkbn_nm,
				kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki,editable
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:40:23
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

group by thkey,th.tehai_id,th.eda_no,
		       	th.timezone_code,kubun,
		       	th.kikan_naiyou, kikan,
		       	th.gyoumu_kbn,th.syukan_soshiki,
		       	tz.timezone_name,gkbn_nm,
				kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki,editable
                ORDER BY th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:41:59
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

group by thkey,th.tehai_id,th.eda_no,
		       	th.timezone_code,kubun,
		       	th.kikan_naiyou, kikan,
		       	th.gyoumu_kbn,th.syukan_soshiki,
		       	tz.timezone_name,gkbn_nm,
				kubun1,
				th.st_date,
				th.st_time,
				th.ed_date,
				th.ed_time,
				th.timezone_code,
				sm.kaisya_id,
				th.syukan_soshiki,editable
                ORDER BY thkey,th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:42:18
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

                ORDER BY thkey,th.gyoumu_kbn,
							 th.timezone_code,
							 th.st_date,
							 th.st_time,
							 th.ed_date,
							 th.ed_time,
							 kubun1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:42:31
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:42:31
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:42:32
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:42:32
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

--postgres@172.20.0.137:5432.kosyo_tool_20170126 17:42:32
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

