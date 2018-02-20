-- psqledit log file
-- date: 2017-02-14

--neomeit@172.20.0.90:5432.imagedatabase2 13:36:53
SELECT "RentNo",
				   "CampanyName",
				   "Shimei",
				   "Workname",
				   Replace("Workname", '-', '/') ,
				   "RentNumber",
				   "RentKind",
				   "RentFrom"::timestamp::date,
				   "RentTo"::timestamp::date,
				   concat_ws(' Å` ', "RentFrom"::timestamp::date, "RentTo"::timestamp::date) AS RentDuration,
				   "RentBiko",
				   "ReturnDay"::timestamp::date,
				   "ReturnBiko"
			FROM neomeit."Rent";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:39:29
SELECT "RentNo",
				   "CampanyName",
				   "Shimei",
				   "Workname",
				   Replace(to_char("RentDay", 'yyyy/mm/dd'), '-', '/') ,
				   "RentNumber",
				   "RentKind",
				   "RentFrom"::timestamp::date,
				   "RentTo"::timestamp::date,
				   concat_ws(' Å` ', "RentFrom"::timestamp::date, "RentTo"::timestamp::date) AS RentDuration,
				   "RentBiko",
				   "ReturnDay"::timestamp::date,
				   "ReturnBiko"
			FROM neomeit."Rent";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:39:46
SELECT "RentNo",
				   "CampanyName",
				   "Shimei",
				   "Workname",to_char("RentDay", 'yyyy/mm/dd'),
				   Replace(to_char("RentDay", 'yyyy/mm/dd'), '-', '/') ,
				   "RentNumber",
				   "RentKind",
				   "RentFrom"::timestamp::date,
				   "RentTo"::timestamp::date,
				   concat_ws(' Å` ', "RentFrom"::timestamp::date, "RentTo"::timestamp::date) AS RentDuration,
				   "RentBiko",
				   "ReturnDay"::timestamp::date,
				   "ReturnBiko"
			FROM neomeit."Rent";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:45:08
SELECT "RentNo",
				   "CampanyName",
				   "Shimei",
				   "Workname",
				   to_char("RentDay", 'yyyy/mm/dd') as RentDay,
				   "RentNumber",
				   "RentKind",
				   to_char("RentFrom", 'yyyy/mm/dd') as RentFrom,
				   to_char("RentTo", 'yyyy/mm/dd') as RentTo,
				   concat_ws(' Å` ', to_char("RentFrom", 'yyyy/mm/dd'), to_char("RentTo", 'yyyy/mm/dd')) AS RentDuration,
				   "RentBiko",
				   to_char("ReturnDay", 'yyyy/mm/dd') as returnday,
				   "ReturnBiko"
			FROM neomeit."Rent" where 1=1  and 					"ReturnDay" IS NOT NULL			 order by "RentNo" asc;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:56:04
SELECT "RentNo",
				   "CampanyName",
				   "Shimei",
				   "Workname",
				   to_char("RentDay", 'yyyy/mm/dd') as RentDay,
				   "RentNumber",
				   "RentKind",
				   to_char("RentFrom", 'yyyy/mm/dd') as RentFrom,
				   to_char("RentTo", 'yyyy/mm/dd') as RentTo,
				   concat_ws(' Å` ', to_char("RentFrom", 'yyyy/mm/dd'), to_char("RentTo", 'yyyy/mm/dd')) AS RentDuration,
				   "RentBiko",
				   to_char("ReturnDay", 'yyyy/mm/dd') as returnday,
				   "ReturnBiko"
			FROM neomeit."Rent" where 1=1  and 					"ReturnDay" IS NOT NULL			 order by "RentNo" asc;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 15:10:29
select "BlockCode", "PrefectureCode", "BuildingCode", "WorkYear", 
	"Workname", "WorknameNo", "WorkFrom", "WorkTo", "Registrant", "Biko"
from "Workname"
;
--/

