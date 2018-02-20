-- psqledit log file
-- date: 2017-02-13

--neomeit@172.20.0.90:5432.imagedatabase2 09:28:33
select "RentNo", "CampanyName", "Shimei", "Workname", "RentDay", 
	"RentNumber", "RentKind", "RentFrom", "RentTo", "RentBiko", 
	"ReturnDay", "ReturnBiko"
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:58:59
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag"
from "User"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 14:04:30
select "UserID", "CampanyName", "Shimei", "PayoutDate", "ReturnDate", 
	"EnableFlag", "Kiji", "Workname"
from "UserAttri"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 14:05:43
select "BlockCode", "PrefectureCode", "BuildingCode", "WorkYear", 
	"Workname", "WorknameNo", "WorkFrom", "WorkTo", "Registrant", "Biko"
from "Workname"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 14:13:18
select distinct "CampanyName"
from "UserAttri"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 14:15:05
select distinct "UserID", "CampanyName", "Shimei", "PayoutDate", "ReturnDate", 
	"EnableFlag", "Kiji", "Workname"
from "UserAttri"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 14:51:31
select distinct "UserID", "CampanyName", "Shimei", "PayoutDate", "ReturnDate", 
	"EnableFlag", "Kiji", "Workname"
from "UserAttri"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:41:27
select "RentNo", "CampanyName", "Shimei", "Workname", "RentDay", 
	"RentNumber", "RentKind", "RentFrom", "RentTo", "RentBiko", 
	"ReturnDay", "ReturnBiko"
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:48:24
select "RentNo", "CampanyName", "Shimei", "Workname", "RentDay", 
	"RentNumber", "RentKind", "RentFrom", "RentTo", "RentBiko", 
	"ReturnDay", "ReturnBiko"
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:48:25
select "RentNo", "CampanyName", "Shimei", "Workname", "RentDay", 
	"RentNumber", "RentKind", "RentFrom", "RentTo", "RentBiko", 
	"ReturnDay", "ReturnBiko"
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:49:59
select "RentNo", "CampanyName", "Shimei", "Workname", "RentDay", 
	"RentNumber", "RentKind", "RentFrom", "RentTo", "RentBiko", 
	"ReturnDay", "ReturnBiko"
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:09:58
select pg_get_indexdef(indexrelid) from pg_index;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:15:39
select "RentNo"
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:15:48
select max("RentNo")
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:16:15
select max("RentNo")
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:20:34
select Replace(max("RentNo"), 'K', '')
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:20:42
select Replace(max("RentNo"), 'K', '') as max
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:23:01
select cast(Replace(max("RentNo"), 'K', '') as int)
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:23:16
select cast(Replace(max("RentNo"), 'K', '') as int) as max
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:24:30
select cast(Replace(max("RentNo"), 'K', '') as int) as max
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:58:41
select "RentNo", "CampanyName", "Shimei", "Workname", "RentDay", 
	"RentNumber", "RentKind", "RentFrom", "RentTo", "RentBiko", 
	"ReturnDay", "ReturnBiko"
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 18:07:12
select "RentNo", "CampanyName", "Shimei", "Workname", "RentDay", 
	"RentNumber", "RentKind", "RentFrom", "RentTo", "RentBiko", 
	"ReturnDay", "ReturnBiko"
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 18:08:58
select "RentNo", "CampanyName", "Shimei", "Workname", "RentDay", 
	"RentNumber", "RentKind", "RentFrom", "RentTo", "RentBiko", 
	"ReturnDay", "ReturnBiko"
from "Rent"
;
--/

