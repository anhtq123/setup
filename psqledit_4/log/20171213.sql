-- psqledit log file
-- date: 2017-12-13

--postgres@172.20.0.89:5432.imagedatabase2 11:23:26
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
;
--/

--postgres@172.20.0.89:5432.imagedatabase2 11:24:32
update neomeit."User"
set "Password"='9451bb85c67e6012e096f5df691503b3'
where "UserID" ='6289300';
--/

--postgres@172.20.0.89:5432.imagedatabase2 11:52:40
select "UserID", "UserName","AreaPermissions"
from neomeit."User"
where "UserID" ='6289300';
--/

--postgres@172.20.0.89:5432.imagedatabase2 11:54:57
select "UserID", "UserName", "Password", "UserType", "Authority", 
	"Organization", "PrefectureCodes", "ManagerID", "ExpirationDate", 
	"PasswordUpdateDate", "LastLoginDate", "FailureCount", "FailureDate", 
	"LockedFlag", "DeleteFlag", "AreaPermissions"
from neomeit."User"
;
--/

--postgres@172.20.0.89:5432.imagedatabase2 11:56:10
update neomeit."User"
set "Password"='9451bb85c67e6012e096f5df691503b3'
where "UserID" ='pwreset';
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:00:41
	select * ,to_char("WorkFrom", 'yyyy/mm/dd') as "WorkFromf", to_char("WorkTo", 'yyyy/mm/dd') as "WorkTof", concat_ws(' ` ', to_char("WorkFrom", 'yyyy/mm/dd'), to_char("WorkTo", 'yyyy/mm/dd')) AS "workduration" from neomeit."Workname" w left join neomeit."Prefecture" p on p."PrefectureCode" = w."PrefectureCode" left join neomeit."Block" b on b."BlockCode" = w."BlockCode" where w."WorkYear"='2017' order by w."BlockCode" asc ,w."PrefectureCode" asc ,w."WorknameNo" asc;
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:01:13
SELECT *,
       to_char("WorkFrom", 'yyyy/mm/dd') AS "WorkFromf",
       to_char("WorkTo", 'yyyy/mm/dd') AS "WorkTof",
       concat_ws(' ` ', to_char("WorkFrom", 'yyyy/mm/dd'), to_char("WorkTo", 'yyyy/mm/dd')) AS "workduration"
FROM neomeit."Workname" w
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = w."PrefectureCode"
LEFT JOIN neomeit."Block" b ON b."BlockCode" = w."BlockCode"
WHERE w."WorkYear"='2017'
ORDER BY w."BlockCode" ASC,
         w."PrefectureCode" ASC,
         w."WorknameNo" ASC;
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:04:11
SELECT *,
       to_char("WorkFrom", 'yyyy/mm/dd') AS "WorkFromf",
       to_char("WorkTo", 'yyyy/mm/dd') AS "WorkTof",
       concat_ws(' ` ', to_char("WorkFrom", 'yyyy/mm/dd'), to_char("WorkTo", 'yyyy/mm/dd')) AS "workduration",
       u."AreaPermissions"
FROM neomeit."Workname" w
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = w."PrefectureCode"
LEFT JOIN neomeit."Block" b ON b."BlockCode" = w."BlockCode"
LEFT JOIN neomeit."User" u ON u."UserID" ='pwreset' --and b."BlockCode" in (01) 

WHERE w."WorkYear"='2017'
ORDER BY w."BlockCode" ASC,
         w."PrefectureCode" ASC,
         w."WorknameNo" ASC;
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:04:21
SELECT *,
       u."AreaPermissions",
       to_char("WorkFrom", 'yyyy/mm/dd') AS "WorkFromf",
       to_char("WorkTo", 'yyyy/mm/dd') AS "WorkTof",
       concat_ws(' ` ', to_char("WorkFrom", 'yyyy/mm/dd'), to_char("WorkTo", 'yyyy/mm/dd')) AS "workduration"
FROM neomeit."Workname" w
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = w."PrefectureCode"
LEFT JOIN neomeit."Block" b ON b."BlockCode" = w."BlockCode"
LEFT JOIN neomeit."User" u ON u."UserID" ='pwreset' --and b."BlockCode" in (01) 

WHERE w."WorkYear"='2017'
ORDER BY w."BlockCode" ASC,
         w."PrefectureCode" ASC,
         w."WorknameNo" ASC;
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:04:29
SELECT u."AreaPermissions",*,
       
       to_char("WorkFrom", 'yyyy/mm/dd') AS "WorkFromf",
       to_char("WorkTo", 'yyyy/mm/dd') AS "WorkTof",
       concat_ws(' ` ', to_char("WorkFrom", 'yyyy/mm/dd'), to_char("WorkTo", 'yyyy/mm/dd')) AS "workduration"
FROM neomeit."Workname" w
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = w."PrefectureCode"
LEFT JOIN neomeit."Block" b ON b."BlockCode" = w."BlockCode"
LEFT JOIN neomeit."User" u ON u."UserID" ='pwreset' --and b."BlockCode" in (01) 

WHERE w."WorkYear"='2017'
ORDER BY w."BlockCode" ASC,
         w."PrefectureCode" ASC,
         w."WorknameNo" ASC;
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:07:03
SELECT u."AreaPermissions",*,
       
       to_char("WorkFrom", 'yyyy/mm/dd') AS "WorkFromf",
       to_char("WorkTo", 'yyyy/mm/dd') AS "WorkTof",
       concat_ws(' ` ', to_char("WorkFrom", 'yyyy/mm/dd'), to_char("WorkTo", 'yyyy/mm/dd')) AS "workduration"
FROM neomeit."Workname" w
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = w."PrefectureCode"
LEFT JOIN neomeit."Block" b ON b."BlockCode" = w."BlockCode"
LEFT JOIN neomeit."User" u ON u."UserID" ='pwreset' and position(b."BlockCode" in u."AreaPermissions") > 0 

WHERE w."WorkYear"='2017'
ORDER BY w."BlockCode" ASC,
         w."PrefectureCode" ASC,
         w."WorknameNo" ASC;
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:07:29
SELECT u."AreaPermissions",*,
       
       to_char("WorkFrom", 'yyyy/mm/dd') AS "WorkFromf",
       to_char("WorkTo", 'yyyy/mm/dd') AS "WorkTof",
       concat_ws(' ` ', to_char("WorkFrom", 'yyyy/mm/dd'), to_char("WorkTo", 'yyyy/mm/dd')) AS "workduration"
FROM neomeit."Workname" w
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = w."PrefectureCode"
LEFT JOIN neomeit."Block" b ON b."BlockCode" = w."BlockCode"
LEFT JOIN neomeit."User" u ON u."UserID" ='pwreset' and position(b."BlockCode" in u."AreaPermissions") > 0 

WHERE w."WorkYear"='2017'
ORDER BY w."BlockCode" ASC,
         w."PrefectureCode" ASC,
         w."WorknameNo" ASC;
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:07:52
SELECT u."AreaPermissions",*,
       
       to_char("WorkFrom", 'yyyy/mm/dd') AS "WorkFromf",
       to_char("WorkTo", 'yyyy/mm/dd') AS "WorkTof",
       concat_ws(' ` ', to_char("WorkFrom", 'yyyy/mm/dd'), to_char("WorkTo", 'yyyy/mm/dd')) AS "workduration"
FROM neomeit."Workname" w
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = w."PrefectureCode"
LEFT JOIN neomeit."Block" b ON b."BlockCode" = w."BlockCode"
inner JOIN neomeit."User" u ON u."UserID" ='pwreset' and position(b."BlockCode" in u."AreaPermissions") > 0 

WHERE w."WorkYear"='2017'
ORDER BY w."BlockCode" ASC,
         w."PrefectureCode" ASC,
         w."WorknameNo" ASC;
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:08:02
SELECT u."AreaPermissions",*,
       
       to_char("WorkFrom", 'yyyy/mm/dd') AS "WorkFromf",
       to_char("WorkTo", 'yyyy/mm/dd') AS "WorkTof",
       concat_ws(' ` ', to_char("WorkFrom", 'yyyy/mm/dd'), to_char("WorkTo", 'yyyy/mm/dd')) AS "workduration"
FROM neomeit."Workname" w
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = w."PrefectureCode"
LEFT JOIN neomeit."Block" b ON b."BlockCode" = w."BlockCode"
 JOIN neomeit."User" u ON u."UserID" ='pwreset' and position(b."BlockCode" in u."AreaPermissions") > 0 

WHERE w."WorkYear"='2017'
ORDER BY w."BlockCode" ASC,
         w."PrefectureCode" ASC,
         w."WorknameNo" ASC;
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:08:03
SELECT u."AreaPermissions",*,
       
       to_char("WorkFrom", 'yyyy/mm/dd') AS "WorkFromf",
       to_char("WorkTo", 'yyyy/mm/dd') AS "WorkTof",
       concat_ws(' ` ', to_char("WorkFrom", 'yyyy/mm/dd'), to_char("WorkTo", 'yyyy/mm/dd')) AS "workduration"
FROM neomeit."Workname" w
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = w."PrefectureCode"
LEFT JOIN neomeit."Block" b ON b."BlockCode" = w."BlockCode"
 JOIN neomeit."User" u ON u."UserID" ='pwreset' and position(b."BlockCode" in u."AreaPermissions") > 0 

WHERE w."WorkYear"='2017'
ORDER BY w."BlockCode" ASC,
         w."PrefectureCode" ASC,
         w."WorknameNo" ASC;
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:08:03
SELECT u."AreaPermissions",*,
       
       to_char("WorkFrom", 'yyyy/mm/dd') AS "WorkFromf",
       to_char("WorkTo", 'yyyy/mm/dd') AS "WorkTof",
       concat_ws(' ` ', to_char("WorkFrom", 'yyyy/mm/dd'), to_char("WorkTo", 'yyyy/mm/dd')) AS "workduration"
FROM neomeit."Workname" w
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = w."PrefectureCode"
LEFT JOIN neomeit."Block" b ON b."BlockCode" = w."BlockCode"
 JOIN neomeit."User" u ON u."UserID" ='pwreset' and position(b."BlockCode" in u."AreaPermissions") > 0 

WHERE w."WorkYear"='2017'
ORDER BY w."BlockCode" ASC,
         w."PrefectureCode" ASC,
         w."WorknameNo" ASC;
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:08:06
SELECT u."AreaPermissions",*,
       
       to_char("WorkFrom", 'yyyy/mm/dd') AS "WorkFromf",
       to_char("WorkTo", 'yyyy/mm/dd') AS "WorkTof",
       concat_ws(' ` ', to_char("WorkFrom", 'yyyy/mm/dd'), to_char("WorkTo", 'yyyy/mm/dd')) AS "workduration"
FROM neomeit."Workname" w
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = w."PrefectureCode"
LEFT JOIN neomeit."Block" b ON b."BlockCode" = w."BlockCode"
JOIN neomeit."User" u ON u."UserID" ='pwreset' and position(b."BlockCode" in u."AreaPermissions") > 0 

WHERE w."WorkYear"='2017'
ORDER BY w."BlockCode" ASC,
         w."PrefectureCode" ASC,
         w."WorknameNo" ASC;
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:12:16
update neomeit."User"
set "AreaPermissions"='01,02'
where "UserID" ='pwreset';
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:12:28
SELECT u."AreaPermissions",*,
       
       to_char("WorkFrom", 'yyyy/mm/dd') AS "WorkFromf",
       to_char("WorkTo", 'yyyy/mm/dd') AS "WorkTof",
       concat_ws(' ` ', to_char("WorkFrom", 'yyyy/mm/dd'), to_char("WorkTo", 'yyyy/mm/dd')) AS "workduration"
FROM neomeit."Workname" w
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = w."PrefectureCode"
LEFT JOIN neomeit."Block" b ON b."BlockCode" = w."BlockCode"
JOIN neomeit."User" u ON u."UserID" ='pwreset' and position(b."BlockCode" in u."AreaPermissions") > 0 

WHERE w."WorkYear"='2017'
ORDER BY w."BlockCode" ASC,
         w."PrefectureCode" ASC,
         w."WorknameNo" ASC;
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:16:23
update neomeit."User"
set "AreaPermissions"='01,02,03'
where "UserID" ='pwreset';
--/

--postgres@172.20.0.89:5432.imagedatabase2 16:16:41
update neomeit."User"
set "AreaPermissions"='01,02'
where "UserID" ='pwreset';
--/

