-- psqledit log file
-- date: 2017-02-08

--neomeit@172.20.0.90:5432.imagedatabase2 11:32:06
SELECT *
FROM
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
LEFT JOIN neomeit."Building" b ON b."BuildingCode" = f."BuildingCode"
WHERE p."PrefectureCode"='16'
  AND (b."BuildingCode" LIKE '%山%'
       OR b."BuildingName" LIKE '%山%'
       OR b."PrefectureCode" LIKE '%山%'
       OR b."BuildingName2"LIKE '%山%'
       OR b."BuildingKana" LIKE '%山%'
       OR b."PostNo" LIKE '%山%'
       OR b."Address" LIKE '%山%')
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 11:34:29
SELECT *
FROM
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
LEFT JOIN neomeit."Building" b ON b."BuildingCode" = f."BuildingCode"
WHERE p."PrefectureCode"='16'
  AND (b."BuildingCode" LIKE '%山%'
       OR b."BuildingName" LIKE '%山%'
       OR b."PrefectureCode" LIKE '%山%'
       OR b."BuildingName2"LIKE '%山%'
       OR b."BuildingKana" LIKE '%山%'
       OR b."PostNo" LIKE '%山%'
       OR b."Address" LIKE '%山%')
  AND f."BuildingCode" = '1620111101'
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 14:26:48
select "BuildingCode", "BuildingName", "PrefectureCode", 
	"BuildingName2", "BuildingKana", "PostNo", "Address"
from "Building"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 14:27:25
select "BackPoint", "Prefecture", "Building", "Floor", 
	"DetailsLocation"
from "Floor"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 15:04:23
select "BackPoint", "Floor", "DetailsLocation"
from "Floor"
where "BackPoint" like '%1620111101%';
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:37:30
select "BackPoint", "CategoryCode", "CommentCode", "Note", 
	"PositionSerialNumber", "PhotoSerialNumber", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from "Photo"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:10:15
select "BackPoint", "CategoryCode", "CommentCode", "Note", 
	"PositionSerialNumber", "PhotoSerialNumber", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from "Photo"
where "BackPoint"='16_1620100101_00002_00001';
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:10:19
select "BackPoint", "CategoryCode", "CommentCode", "Note", 
	"PositionSerialNumber", "PhotoSerialNumber", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from "Photo";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:10:59
select "BackPoint", "CategoryCode", "CommentCode", "Note", 
	"PositionSerialNumber", "PhotoSerialNumber", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from "Photo"
where "BackPoint"='16_1620100101_00002_00001';
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:12:02
select "BackPoint", "CategoryCode", "CommentCode", "Note", 
	"PositionSerialNumber", "PhotoSerialNumber", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from "Photo"
where "BackPoint"='16_1620100101_00002_00001'

;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:12:03
select "BackPoint", "CategoryCode", "CommentCode", "Note", 
	"PositionSerialNumber", "PhotoSerialNumber", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from "Photo"
where "BackPoint"='16_1620100101_00002_00001'

;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:12:03
select "BackPoint", "CategoryCode", "CommentCode", "Note", 
	"PositionSerialNumber", "PhotoSerialNumber", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from "Photo"
where "BackPoint"='16_1620100101_00002_00001'

;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:12:03
select "BackPoint", "CategoryCode", "CommentCode", "Note", 
	"PositionSerialNumber", "PhotoSerialNumber", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from "Photo"
where "BackPoint"='16_1620100101_00002_00001'

;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:12:03
select "BackPoint", "CategoryCode", "CommentCode", "Note", 
	"PositionSerialNumber", "PhotoSerialNumber", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from "Photo"
where "BackPoint"='16_1620100101_00002_00001'

;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:12:04
select "BackPoint", "CategoryCode", "CommentCode", "Note", 
	"PositionSerialNumber", "PhotoSerialNumber", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from "Photo"
where "BackPoint"='16_1620100101_00002_00001'

;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:12:04
select "BackPoint", "CategoryCode", "CommentCode", "Note", 
	"PositionSerialNumber", "PhotoSerialNumber", "PhotoFileName", 
	"FileType", "RegisterDateTime", "PhotographyCompany", 
	"PhotographerName"
from "Photo"
where "BackPoint"='16_1620100101_00002_00001'

;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:27:06
select "BackPoint", "Floor", "DetailsLocation"
from "Floor"
where "BackPoint" like '16_1620100101_00001_00001';
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:31:25
select "BackPoint", "Floor", "DetailsLocation"
from "Floor"
where "BackPoint" like '16_1620100101_00001_00001';
--/

