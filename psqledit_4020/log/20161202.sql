-- psqledit log file
-- date: 2016-12-02

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:50:46
SELECT user_id,
					   user_name,
					   user_authority,
					   user_useauthority,
					   lock_flg,
					   um.kaisya_id,
					   user_tel1,
					   user_tel2,
					   user_mail,
					   um.soshiki_id,
					   sm.soshiki_name,
					   pwd_upd,
					   kaisya_name,
					   CASE
						   WHEN length(sm.soshiki_code) > 1 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,2))
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(sm.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,4))
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(sm.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,6))
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(sm.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,8))
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(sm.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = sm.soshiki_code)
						   ELSE ''
					   END AS level_5
				FROM user_mst um
				LEFT JOIN soshiki_mst sm ON sm.soshiki_id = um.soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = um.kaisya_id
				WHERE um.soshiki_id IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,63,64,52,65,53,54,55,56,57,58,59,60,61,62,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,94,95,368,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,374,373,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,369,370,371,372,344,345,346,347,348,349,359,360,361,362,363,364,365,366,367,356,357,358,350,351,352,353,354,355)
				ORDER BY user_id, 
						 user_authority,
					     user_useauthority;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:55:29
SELECT user_id,
					   user_name,
					   user_authority,
					   user_useauthority,
					   lock_flg,
					   um.kaisya_id,
					   user_tel1,
					   user_tel2,
					   user_mail,
					   um.soshiki_id,
					   sm.soshiki_name,
					   pwd_upd,
					   kaisya_name,
					   CASE
						   WHEN length(sm.soshiki_code) > 1 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,2))
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(sm.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,4))
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(sm.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,6))
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(sm.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,8))
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(sm.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = sm.soshiki_code)
						   ELSE ''
					   END AS level_5
				FROM user_mst um
				LEFT JOIN soshiki_mst sm ON sm.soshiki_id = um.soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = um.kaisya_id
				WHERE um.soshiki_id IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,63,64,52,65,53,54,55,56,57,58,59,60,61,62,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,94,95,368,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,374,373,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,369,370,371,372,344,345,346,347,348,349,359,360,361,362,363,364,365,366,367,356,357,358,350,351,352,353,354,355)
				  AND um.user_id = 'hokuryoku04'
				ORDER BY user_id, 
						 user_authority,
					     user_useauthority;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:56:46
SELECT user_id,
					   user_name,
					   user_authority,
					   user_useauthority,
					   lock_flg,
					   um.kaisya_id,
					   user_tel1,
					   user_tel2,
					   user_mail,
					   um.soshiki_id,
					   sm.soshiki_name,
					   pwd_upd,
					   kaisya_name,
					   CASE
						   WHEN length(sm.soshiki_code) > 1 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,2))
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(sm.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,4))
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(sm.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,6))
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(sm.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,8))
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(sm.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = sm.soshiki_code)
						   ELSE ''
					   END AS level_5
				FROM user_mst um
				LEFT JOIN soshiki_mst sm ON sm.soshiki_id = um.soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = um.kaisya_id
				WHERE um.soshiki_id IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,63,64,52,65,53,54,55,56,57,58,59,60,61,62,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,94,95,368,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,374,373,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,369,370,371,372,344,345,346,347,348,349,359,360,361,362,363,364,365,366,367,356,357,358,350,351,352,353,354,355)
				  AND um.kaisya_id = 1
				  AND um.soshiki_id IN
					(SELECT soshiki_id
					 FROM soshiki_mst
					 WHERE kaisya_id=um.kaisya_id
					   AND soshiki_code LIKE '%06%' 
					   AND substring(soshiki_code from 1 for char_length('06')) = '06')
				  AND um.user_name = '%	北九州フィールドサービスセンタ・宅内担当%'
				ORDER BY user_id, 
						 user_authority,
					     user_useauthority;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:56:48
SELECT user_id,
					   user_name,
					   user_authority,
					   user_useauthority,
					   lock_flg,
					   um.kaisya_id,
					   user_tel1,
					   user_tel2,
					   user_mail,
					   um.soshiki_id,
					   sm.soshiki_name,
					   pwd_upd,
					   kaisya_name,
					   CASE
						   WHEN length(sm.soshiki_code) > 1 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,2))
						   ELSE ''
					   END AS level_1,
					   CASE
						   WHEN length(sm.soshiki_code) > 3 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,4))
						   ELSE ''
					   END AS level_2,
					   CASE
						   WHEN length(sm.soshiki_code) > 5 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,6))
						   ELSE ''
					   END AS level_3,
					   CASE
						   WHEN length(sm.soshiki_code) > 7 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = substring(sm.soshiki_code,1,8))
						   ELSE ''
					   END AS level_4,
					   CASE
						   WHEN length(sm.soshiki_code) > 9 THEN
								  (SELECT soshiki_name
								   FROM soshiki_mst
								   WHERE kaisya_id=um.kaisya_id
									 AND soshiki_code = sm.soshiki_code)
						   ELSE ''
					   END AS level_5
				FROM user_mst um
				LEFT JOIN soshiki_mst sm ON sm.soshiki_id = um.soshiki_id
				LEFT JOIN kaisya_mst km ON km.kaisya_id = um.kaisya_id
				WHERE um.soshiki_id IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,63,64,52,65,53,54,55,56,57,58,59,60,61,62,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,94,95,368,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,374,373,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,369,370,371,372,344,345,346,347,348,349,359,360,361,362,363,364,365,366,367,356,357,358,350,351,352,353,354,355)
				  AND um.kaisya_id = 1
				  AND um.soshiki_id IN
					(SELECT soshiki_id
					 FROM soshiki_mst
					 WHERE kaisya_id=um.kaisya_id
					   AND soshiki_code LIKE '%06%' 
					   AND substring(soshiki_code from 1 for char_length('06')) = '06')
				  AND um.user_name = '%北九州フィールドサービスセンタ・宅内担当%'
				ORDER BY user_id, 
						 user_authority,
					     user_useauthority;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:57:24
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
where user_name = '%北九州フィールドサービスセンタ・宅内担当%';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:57:34
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
where user_name = '北九州フィールドサービスセンタ・宅内担当';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:57:54
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
where user_name = '%北九州フィールドサービスセンタ・宅内担当%';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:58:00
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
where user_name = '%北九州フィールドサービスセンタ%';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:58:32
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
where user_name like '%北九州フィールドサービスセンタ%';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:18:33
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehaikanri_id=115;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:12:20
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=117;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:12:29
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehaikanri_id=117;
--/

