-- psqledit log file
-- date: 2017-11-08

--postgres@172.20.0.89:5432.imagedatabase3 14:11:44
select "BlockCode", "BlockName"
from neomeit."Block"
;
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:12:47
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
where "UserID" = 'neo';
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:13:17
select "UserID", "AreaPermissions", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag"
from neomeit."User"
where "UserID" = 'neo';
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:13:30
select "UserID", "AreaPermissions", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag"
from neomeit."User"
where "UserID" = 'neo';
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:17:24
select "UserID", "AreaPermissions", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag"
from neomeit."User"
where "UserID" = 'admin';
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:28:16
select "UserID", "AreaPermissions", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag"
from neomeit."User"
where "UserID" = 'admin';
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:28:20
select "UserID", "AreaPermissions", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag"
from neomeit."User"
where "UserID" = 'neo';
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:30:38
select "UserID", "AreaPermissions", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag"
from neomeit."User"
where "UserID" = 'neo1';
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:31:49
select "UserID", "AreaPermissions", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag"
from neomeit."User"
where "UserID" = 'neo2';
--/

--postgres@172.20.0.89:5432.imagedatabase3 14:58:35
select "UserID", "AreaPermissions", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag"
from neomeit."User"
where "UserID" = 'neo3';
--/

