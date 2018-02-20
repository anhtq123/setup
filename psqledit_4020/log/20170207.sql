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
select * from (select *, SPLIT_PART("BackPoint",'_',1) as "PrefectureCode", SPLIT_PART("BackPoint",'_',2) as "BuildingCode", SPLIT_PART("BackPoint",'_',3) as "FloorCode", SPLIT_PART("BackPoint",'_',4) as "DetailsLocationCode" from neomeit."Floor") f left join neomeit."Prefecture" p on p."PrefectureCode" = f."PrefectureCode" left join neomeit."Building" b on b."BuildingCode" = f."BuildingCode" where p."PrefectureCode"='16' and (b."BuildingCode" like '%山%' or b."BuildingName" like '%山%' or b."PrefectureCode" like '%山%' or b."BuildingName2"like '%山%' or b."BuildingKana" like '%山%' or b."PostNo" like '%山%' or b."Address" like '%山%' ) order by f."BackPoint" asc ;
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
  AND (b."BuildingCode" LIKE '%山%'
       OR b."BuildingName" LIKE '%山%'
       OR b."PrefectureCode" LIKE '%山%'
       OR b."BuildingName2"LIKE '%山%'
       OR b."BuildingKana" LIKE '%山%'
       OR b."PostNo" LIKE '%山%'
       OR b."Address" LIKE '%山%')
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
  AND (b."BuildingCode" LIKE '%山%'
       OR b."BuildingName" LIKE '%山%'
       OR b."PrefectureCode" LIKE '%山%'
       OR b."BuildingName2"LIKE '%山%'
       OR b."BuildingKana" LIKE '%山%'
       OR b."PostNo" LIKE '%山%'
       OR b."Address" LIKE '%山%')
ORDER BY f."BackPoint" ASC;
--/

