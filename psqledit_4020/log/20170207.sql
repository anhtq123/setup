-- psqledit log file
-- date: 2017-02-07

--neomeit@172.20.0.90:5432.imagedatabase2 15:34:25
select * from (select *, SPLIT_PART("BackPoint",'_',1) as "PrefectureCode", SPLIT_PART("BackPoint",'_',2) as "BuildingCode", SPLIT_PART("BackPoint",'_',3) as "FloorCode", SPLIT_PART("BackPoint",'_',4) as "DetailsLocationCode" from neomeit."Floor") f left join neomeit."Prefecture" p on p."PrefectureCode" = f."PrefectureCode" left join neomeit."Building" b on b."BuildingCode" = f."BuildingCode" where p."PrefectureCode"='16' order by f."BackPoint" asc ;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 15:36:41
SELECT *
FROM
  (SELECT "BackPoint",
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
LEFT JOIN neomeit."Building" b ON b."BuildingCode" = f."BuildingCode"
WHERE p."PrefectureCode"='16'
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 15:36:54
SELECT f.*
FROM
  (SELECT "BackPoint",
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
LEFT JOIN neomeit."Building" b ON b."BuildingCode" = f."BuildingCode"
WHERE p."PrefectureCode"='16'
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:25:48
select * from (select *, SPLIT_PART("BackPoint",'_',1) as "PrefectureCode", SPLIT_PART("BackPoint",'_',2) as "BuildingCode", SPLIT_PART("BackPoint",'_',3) as "FloorCode", SPLIT_PART("BackPoint",'_',4) as "DetailsLocationCode" from neomeit."Floor") f left join neomeit."Prefecture" p on p."PrefectureCode" = f."PrefectureCode" left join neomeit."Building" b on b."BuildingCode" = f."BuildingCode" where p."PrefectureCode"='16' and (b."BuildingCode" like '%�R%' or b."BuildingName" like '%�R%' or b."PrefectureCode" like '%�R%' or b."BuildingName2"like '%�R%' or b."BuildingKana" like '%�R%' or b."PostNo" like '%�R%' or b."Address" like '%�R%' ) order by f."BackPoint" asc ;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:26:29
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
  AND (b."BuildingCode" LIKE '%�R%'
       OR b."BuildingName" LIKE '%�R%'
       OR b."PrefectureCode" LIKE '%�R%'
       OR b."BuildingName2"LIKE '%�R%'
       OR b."BuildingKana" LIKE '%�R%'
       OR b."PostNo" LIKE '%�R%'
       OR b."Address" LIKE '%�R%')
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:27:29
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
  AND (b."BuildingCode" LIKE '%�R%'
       OR b."BuildingName" LIKE '%�R%'
       OR b."PrefectureCode" LIKE '%�R%'
       OR b."BuildingName2"LIKE '%�R%'
       OR b."BuildingKana" LIKE '%�R%'
       OR b."PostNo" LIKE '%�R%'
       OR b."Address" LIKE '%�R%')
ORDER BY f."BackPoint" ASC;
--/

