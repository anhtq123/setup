-- psqledit log file
-- date: 2017-11-22

--postgres@172.20.0.89:5432.imagedatabase3 13:28:49
insert into neomeit."User" ("UserID" , "UserType" , "Authority" , "UserName" , "Password" , "PasswordUpdateDate" , "Organization" , "ManagerID" , "ExpirationDate" , "LockedFlag" , "DeleteFlag" , "AreaPermissions" ) values ('sako001119' , '0' , '2' , 'テストユーザ' , 'd322ba1a50613ce1e01d6e18a3c24f2b8cdbae299f9ebc17af1266403977b221' , '2017-11-22 13:24:53' , '' , 'admin' , '2017/12/31' , '0' , '0' , '01,05,' );
--/

--postgres@172.20.0.89:5432.imagedatabase3 13:31:28
delete from neomeit."User"
where "User"."UserID"='sako001119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 13:35:47
insert into neomeit."User" ("UserID" , "UserType" , "Authority" , "UserName" , "Password" , "PasswordUpdateDate" , "Organization" , "ManagerID" , "ExpirationDate" , "LockedFlag" , "DeleteFlag" , "AreaPermissions" ) values ('sako001119' , '0' , '2' , 'テストユーザ' , 'd322ba1a50613ce1e01d6e18a3c24f2b8cdbae299f9ebc17af1266403977b221' , '2017-11-22 13:32:09' , '' , 'admin' , '2017/12/31' , '0' , '0' , '01,05,' );
--/

--postgres@172.20.0.89:5432.imagedatabase3 13:36:13
delete from neomeit."User"
where "User"."UserID"='sako001119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:01:04
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
;
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:04:26
delete from neomeit."User"
where "User"."UserID"='sako001119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:06:41
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
where "User"."UserID"='sako003119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:07:06
select "UserID", "CampanyName", "Shimei", "PayoutDate", "ReturnDate", 
	"EnableFlag", "Kiji", "Workname"
from neomeit."UserAttri"
where "UserAttri"."UserID"='sako003119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:07:21
select "UserID", "CampanyName", "Shimei", "PayoutDate", "ReturnDate", 
	"EnableFlag", "Kiji", "Workname"
from neomeit."UserAttri"
where "UserAttri"."UserID"='sako003119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:07:22
select "UserID", "CampanyName", "Shimei", "PayoutDate", "ReturnDate", 
	"EnableFlag", "Kiji", "Workname"
from neomeit."UserAttri"
where "UserAttri"."UserID"='sako003119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:07:24
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
where "User"."UserID"='sako003119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:07:26
select "UserID", "CampanyName", "Shimei", "PayoutDate", "ReturnDate", 
	"EnableFlag", "Kiji", "Workname"
from neomeit."UserAttri"
where "UserAttri"."UserID"='sako003119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:07:27
select "UserID", "CampanyName", "Shimei", "PayoutDate", "ReturnDate", 
	"EnableFlag", "Kiji", "Workname"
from neomeit."UserAttri"
where "UserAttri"."UserID"='sako003119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:07:28
select "UserID", "CampanyName", "Shimei", "PayoutDate", "ReturnDate", 
	"EnableFlag", "Kiji", "Workname"
from neomeit."UserAttri"
where "UserAttri"."UserID"='sako003119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:08:39
select "UserID", "CampanyName", "Shimei", "PayoutDate", "ReturnDate", 
	"EnableFlag", "Kiji", "Workname"
from neomeit."UserAttri"
where "UserAttri"."UserID"='sako004119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:08:42
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
where "User"."UserID"='sako004119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:14:38
delete from neomeit."UserAttri"
where "UserAttri"."UserID"='sako001119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:14:55
delete from neomeit."UserAttri"
where "UserAttri"."UserID"='sako003119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:15:24
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
where "User"."UserID"='sako004119';
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:15:26
select "UserID", "CampanyName", "Shimei", "PayoutDate", "ReturnDate", 
	"EnableFlag", "Kiji", "Workname"
from neomeit."UserAttri"
where "UserAttri"."UserID"='sako004119';
--/

