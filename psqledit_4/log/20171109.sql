-- psqledit log file
-- date: 2017-11-09

--postgres@172.20.0.89:5432.imagedatabase3 16:15:00
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
;
--/

