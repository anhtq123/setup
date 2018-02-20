-- psqledit log file
-- date: 2017-01-19

--kosyo2@172.20.0.137:5432.kosyo2_20170118 09:04:09
select user_mail
from user_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 09:04:25
select user_mail
from user_mst
order by user_mail desc;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 09:07:52
select char_length(user_mail)
from user_mst
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 09:08:01
select char_length(user_mail)
from user_mst
order by char_length(user_mail);
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 09:08:05
select char_length(user_mail)
from user_mst
order by char_length(user_mail) desc;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170118 09:08:26
select char_length(user_mail),user_mail
from user_mst
order by char_length(user_mail) desc;
--/

--postgres@172.20.0.90:5432.imagedatabase2 09:57:33
select *
from User
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:59:45
select *
from User
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:59:55
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag"
from "User"
;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:01:38
select kaisya_id, kaisya_name, kaisya_kubun, disp_no, add_date, 
	add_userid, upd_date, upd_userid
from kaisya_mst
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 14:11:54
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag"
from "User"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 15:44:49
select * from neomeit."User" order by "ExpirationDate" asc , "UserID" asc ;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 17:22:33
select user_id, user_password, kaisya_id, soshiki_id, user_name, 
	user_tel1, user_tel2, user_mail, user_authority, user_useauthority, 
	pwd_upd, lock_flg, add_date, add_userid, upd_date, upd_userid
from user_mst
where soshiki_id=500;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 17:23:29
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki

where soshiki_id=500;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20170119 17:25:42
select kaisya_id, soshiki_id, itaku_kaisya_id, itaku_soshiki_id, 
	add_date, add_userid, upd_date, upd_userid
from itakumoto_soshiki

where soshiki_id=507;
--/

