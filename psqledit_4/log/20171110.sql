-- psqledit log file
-- date: 2017-11-10

--postgres@172.20.0.89:5432.imagedatabase3 09:50:09
select "BackPoint", "CategoryCode", "CommentCode", "Note", 
	"PositionSerialNumber", "PhotoSerialNumber", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from neomeit."Photo"
;
--/

--postgres@172.20.0.89:5432.imagedatabase3 09:50:28
select "BackPoint", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from neomeit."Photo"
;
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:13:16
select "BackPoint", 
	"PositionSerialNumber", "CategoryCode", "CommentCode", "Note", "PhotoSerialNumber", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from neomeit."Photo"
;
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:13:43
select "Photo"."BackPoint", 	"Photo"."PositionSerialNumber"
from neomeit."Photo"
;
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:20:16
select "Photo"."BackPoint", 	"Photo"."PositionSerialNumber","RegisterPosition", "Note"
from neomeit."Photo"
left join neomeit."RegisterPosition" on neomeit."RegisterPosition"."BackPoint" = neomeit."Photo"."BackPoint";
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:22:39
select "Photo"."BackPoint", 	"Photo"."PositionSerialNumber","RegisterPosition", "Note"
from neomeit."Photo"
left join neomeit."RegisterPosition" on neomeit."RegisterPosition"."PositionSerialNumber"::text = neomeit."Photo"."PositionSerialNumber";
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:18:19
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
where "UserID"='11100000Z'
;
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:18:45
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
where "UserID"='11100000Z'
;
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:19:17
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
where "UserID"='11100000Z'
;
--/

--postgres@172.20.0.89:5432.imagedatabase3 15:21:01
select "BlockCode", "BlockName"
from neomeit."Block"
;
--/

--postgres@172.20.0.89:5432.imagedatabase3 16:02:08
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
;
--/

--postgres@172.20.0.89:5432.imagedatabase3 16:02:27
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
where "UserID"='11100000Z'
;
--/

--postgres@172.20.0.89:5432.imagedatabase3 16:13:38
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
where "UserID"='11100000Z'
;
--/

--postgres@172.20.0.89:5432.imagedatabase3 16:13:46
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
where "UserID"='11100000Z'
;
--/

