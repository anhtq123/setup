-- psqledit log file
-- date: 2017-02-09

--neomeit@172.20.0.90:5432.imagedatabase2 09:09:11
select "BackPoint", "Floor", "DetailsLocation"
from "Floor";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 14:34:40
select "BackPoint", "Floor", "DetailsLocation"
from "Floor"
where "BackPoint" like '16_1620100101_00001_00001';
--/

--neomeit@172.20.0.90:5432.imagedatabase2 14:35:15
select "BackPoint", "Floor", "DetailsLocation"
from "Floor"
where "BackPoint" like '16_1620100201_00002_00001';
--/

--neomeit@172.20.0.90:5432.imagedatabase2 14:35:26
select "BackPoint", "Floor", "DetailsLocation"
from "Floor"
where "BackPoint" = '16_1620100201_00002_00001';
--/

--neomeit@172.20.0.90:5432.imagedatabase2 17:28:20
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

