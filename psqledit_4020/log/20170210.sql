-- psqledit log file
-- date: 2017-02-10

--neomeit@172.20.0.90:5432.imagedatabase2 09:07:07
SELECT *
FROM neomeit."Building" b;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:08:16
SELECT *
FROM neomeit."Building" b
LEFT JOIN neomeit."Floor" f ON SPLIT_PART(f."BackPoint",'_',2) = b."BuildingCode";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:09:57
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

--neomeit@172.20.0.90:5432.imagedatabase2 09:10:55
SELECT *
FROM neomeit."Building" b
LEFT JOIN
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
 

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

--neomeit@172.20.0.90:5432.imagedatabase2 09:12:21
SELECT *
FROM neomeit."Building" b
LEFT JOIN
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
 

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

--neomeit@172.20.0.90:5432.imagedatabase2 09:13:21
SELECT *
FROM neomeit."Building" b
LEFT JOIN
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
 

WHERE p."PrefectureCode"='16'
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:13:24
SELECT *
FROM neomeit."Building" b
LEFT JOIN
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
 

WHERE p."PrefectureCode"='16'
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:13:47
SELECT *
FROM neomeit."Building" b
LEFT JOIN
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode" or f."BuildingCode" is null
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
 

WHERE p."PrefectureCode"='16'
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:13:48
SELECT *
FROM neomeit."Building" b
LEFT JOIN
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode" or f."BuildingCode" is null
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
 

WHERE p."PrefectureCode"='16'
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:13:57
SELECT *
FROM neomeit."Building" b
LEFT JOIN
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode" or f."BuildingCode" is null
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
 

--WHERE p."PrefectureCode"='16'
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:14:01
SELECT *
FROM neomeit."Building" b
LEFT JOIN
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode" --or f."BuildingCode" is null
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
 

--WHERE p."PrefectureCode"='16'
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:14:02
SELECT *
FROM neomeit."Building" b
LEFT JOIN
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode" --or f."BuildingCode" is null
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
 

--WHERE p."PrefectureCode"='16'
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:14:24
SELECT *
FROM neomeit."Building" b
LEFT JOIN
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
 

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

--neomeit@172.20.0.90:5432.imagedatabase2 09:17:02
SELECT b."BuildingCode", b."BuildingName",b."BuildingKana",f."BackPoint",f."Floor",f."DetailsLocation",f."PrefectureCode",f."BuildingCode",f."FloorCode",f."DetailsLocationCode"
FROM neomeit."Building" b
LEFT JOIN
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
 

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

--neomeit@172.20.0.90:5432.imagedatabase2 09:31:47
SELECT b."BuildingCode", b."BuildingName",b."BuildingKana",f."BackPoint",f."Floor",f."DetailsLocation",f."PrefectureCode",f."BuildingCode",f."FloorCode",f."DetailsLocationCode"
FROM neomeit."Building" b
LEFT JOIN
  (SELECT *,
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
 

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

--neomeit@172.20.0.90:5432.imagedatabase2 09:33:05
SELECT b."BuildingCode", b."BuildingName",b."BuildingKana",f."BackPoint",f."Floor",f."DetailsLocation",f."PrefectureCode",f."BuildingCode",f."FloorCode",f."DetailsLocationCode"
FROM neomeit."Building" b
LEFT JOIN
  (SELECT "BackPoint","Floor", "DetailsLocation",
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"

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

--neomeit@172.20.0.90:5432.imagedatabase2 09:38:05
SELECT *
FROM neomeit."Building" b
where b."BuildingName"='ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名';
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:39:21
SELECT b."BuildingCode",
       b."BuildingName",
       b."BuildingKana",
       f."BackPoint",
       f."Floor",
       f."DetailsLocation",
       f."PrefectureCode",
       f."BuildingCode",
       f."FloorCode",
       f."DetailsLocationCode",
       p."BlockCode",
       p."PrefectureCode",
       p."PrefectureName"
FROM neomeit."Building" b
LEFT JOIN
  (SELECT "BackPoint",
          "Floor",
          "DetailsLocation",
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:39:24
SELECT b."BuildingCode",
       b."BuildingName",
       b."BuildingKana",
       f."BackPoint",
       f."Floor",
       f."DetailsLocation",
       f."PrefectureCode",
       f."BuildingCode",
       f."FloorCode",
       f."DetailsLocationCode",
       p."BlockCode",
       p."PrefectureCode",
       p."PrefectureName"
FROM neomeit."Building" b
LEFT JOIN
  (SELECT "BackPoint",
          "Floor",
          "DetailsLocation",
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
WHERE p."PrefectureCode"='16';
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:39:34
SELECT b."BuildingCode",
       b."BuildingName",
       b."BuildingKana",
       f."BackPoint",
       f."Floor",
       f."DetailsLocation",
       f."PrefectureCode",
       f."BuildingCode",
       f."FloorCode",
       f."DetailsLocationCode",
       p."BlockCode",
       p."PrefectureCode",
       p."PrefectureName"
FROM neomeit."Building" b
LEFT JOIN
  (SELECT "BackPoint",
          "Floor",
          "DetailsLocation",
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
WHERE p."PrefectureCode"='16'
  AND (b."BuildingCode" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       OR b."BuildingName" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       OR b."PrefectureCode" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       OR b."BuildingName2"LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       OR b."BuildingKana" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       OR b."PostNo" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       OR b."Address" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%')
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:39:57
SELECT b."BuildingCode",
       b."BuildingName",
       b."BuildingKana",
       f."BackPoint",
       f."Floor",
       f."DetailsLocation",
       f."PrefectureCode",
       f."BuildingCode",
       f."FloorCode",
       f."DetailsLocationCode",
       p."BlockCode",
       p."PrefectureCode",
       p."PrefectureName"
FROM neomeit."Building" b
LEFT JOIN
  (SELECT "BackPoint",
          "Floor",
          "DetailsLocation",
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
WHERE p."PrefectureCode"='16'
  AND (b."BuildingCode" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       OR b."BuildingName" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       --OR b."PrefectureCode" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
      -- OR b."BuildingName2"LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       --OR b."BuildingKana" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
      -- OR b."PostNo" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
      -- OR b."Address" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
)
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:40:09
SELECT b."BuildingCode",
       b."BuildingName",
       b."BuildingKana",
       f."BackPoint",
       f."Floor",
       f."DetailsLocation",
       f."PrefectureCode",
       f."BuildingCode",
       f."FloorCode",
       f."DetailsLocationCode",
       p."BlockCode",
       p."PrefectureCode",
       p."PrefectureName"
FROM neomeit."Building" b
LEFT JOIN
  (SELECT "BackPoint",
          "Floor",
          "DetailsLocation",
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
WHERE p."PrefectureCode"='16'
  AND (--b."BuildingCode" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       --OR 
        b."BuildingName" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       --OR b."PrefectureCode" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
      -- OR b."BuildingName2"LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       --OR b."BuildingKana" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
      -- OR b."PostNo" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
      -- OR b."Address" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
)
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:43:39
SELECT *
FROM neomeit."Building" b
where b."BuildingName"='ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名';
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:43:54
SELECT b."BuildingCode",
       b."BuildingName",
       b."BuildingKana",
       f."BackPoint",
       f."Floor",
       f."DetailsLocation",
       f."PrefectureCode",
       f."BuildingCode",
       f."FloorCode",
       f."DetailsLocationCode",
       p."BlockCode",
       p."PrefectureCode",
       p."PrefectureName"
FROM neomeit."Building" b
LEFT JOIN
  (SELECT "BackPoint",
          "Floor",
          "DetailsLocation",
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = f."PrefectureCode"
WHERE p."PrefectureCode"='16'
  AND (--b."BuildingCode" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       --OR 
        b."BuildingName" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       --OR b."PrefectureCode" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
      -- OR b."BuildingName2"LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       --OR b."BuildingKana" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
      -- OR b."PostNo" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
      -- OR b."Address" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
)
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 09:44:35
SELECT b."BuildingCode",
       b."BuildingName",
       b."BuildingKana",
       f."BackPoint",
       f."Floor",
       f."DetailsLocation",
       f."PrefectureCode",
       f."BuildingCode",
       f."FloorCode",
       f."DetailsLocationCode",
       p."BlockCode",
       p."PrefectureCode",
       p."PrefectureName"
FROM neomeit."Building" b
LEFT JOIN
  (SELECT "BackPoint",
          "Floor",
          "DetailsLocation",
          SPLIT_PART("BackPoint",'_',1) AS "PrefectureCode",
          SPLIT_PART("BackPoint",'_',2) AS "BuildingCode",
          SPLIT_PART("BackPoint",'_',3) AS "FloorCode",
          SPLIT_PART("BackPoint",'_',4) AS "DetailsLocationCode"
   FROM neomeit."Floor") f ON b."BuildingCode" = f."BuildingCode"
LEFT JOIN neomeit."Prefecture" p ON p."PrefectureCode" = b."PrefectureCode"
WHERE p."PrefectureCode"='16'
  AND (--b."BuildingCode" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       --OR 
        b."BuildingName" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       --OR b."PrefectureCode" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
      -- OR b."BuildingName2"LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
       --OR b."BuildingKana" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
      -- OR b."PostNo" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
      -- OR b."Address" LIKE '%ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名ビル名%'
)
ORDER BY f."BackPoint" ASC;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 10:13:12
select "BlockCode", "PrefectureCode", "BuildingCode", "WorkYear", 
	"Workname", "WorknameNo", "WorkFrom", "WorkTo", "Registrant", "Biko"
from "Workname"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:18:56
select "BlockCode", "PrefectureCode", "BuildingCode", "WorkYear", 
	"Workname", "WorknameNo", "WorkFrom", "WorkTo", "Registrant", "Biko"
from "Workname"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:19:02
select "RentNo", "CampanyName", "Shimei", "Workname", "RentDay", 
	"RentNumber", "RentKind", "RentFrom", "RentTo", "RentBiko", 
	"ReturnDay", "ReturnBiko"
from "Rent"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:29:16
SELECT "RentNo", "CampanyName", "Shimei", "Workname", "RentDay", "RentNumber", "RentKind", "RentFrom", "RentTo", "RentBiko", "ReturnDay", "ReturnBiko" FROM neomeit."Rent" ;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:36:40
SELECT "RentNo",
       "CampanyName",
       "Shimei",
       "Workname",
       "RentDay",
       "RentNumber",
       "RentKind",
       "RentFrom",
       "RentTo",
       "RentBiko",
       "ReturnDay",
       "ReturnBiko"
FROM "Rent";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:38:30
SELECT "RentNo",
       "CampanyName",
       "Shimei",
       "Workname",
       "RentDay",
       "RentNumber",
       "RentKind",
       "RentFrom"  "RentTo",
       "RentBiko",
       "ReturnDay",
       "ReturnBiko"
FROM "Rent";
--/

--kosyo@172.20.0.137:5432.39 13:40:09
select tanto_id | kaisya_id, soshiki_id, tanto_name, tanto_tel1, 
	tanto_tel2, tanto_mail, tanto_fax, yakusyoku_code, add_date, 
	add_userid, upd_date, upd_userid
from tanto_mst
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:42:56
SELECT "RentNo",
       "CampanyName",
       "Shimei",
       "Workname",
       "RentDay",
       "RentNumber",
       "RentKind",
        concat_ws('～', "RentFrom", "RentTo") AS ab,
       "RentBiko",
       "ReturnDay",
       "ReturnBiko"
FROM "Rent";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:49:17
SELECT "RentNo",
       "CampanyName",
       "Shimei",
       "Workname",
       "RentDay",
       "RentNumber",
       "RentKind",
        concat_ws('～', "RentFrom", "RentTo") AS RentDuration,
       "RentBiko",
       "ReturnDay",
       "ReturnBiko"
FROM "Rent";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:52:56
SELECT "RentNo",
       "CampanyName",
       "Shimei",
       "Workname",
       "RentDay",
       "RentNumber",
       "RentKind",
        date_trunc('hour',"RentFrom") as "RentFrom",
        concat_ws('～', "RentFrom", "RentTo") AS RentDuration,
       "RentBiko",
       "ReturnDay",
       "ReturnBiko"
FROM "Rent";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:53:30
SELECT "RentNo",
       "CampanyName",
       "Shimei",
       "Workname",
       "RentDay",
       "RentNumber",
       "RentKind",
        date_trunc('day',"RentFrom") as "RentFrom",
        concat_ws('～', "RentFrom", "RentTo") AS RentDuration,
       "RentBiko",
       "ReturnDay",
       "ReturnBiko"
FROM "Rent";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:55:25
SELECT "RentNo",
       "CampanyName",
       "Shimei",
       "Workname",
       "RentDay",
       "RentNumber",
       "RentKind",
        "RentFrom"::timestamp,
        concat_ws('～', "RentFrom", "RentTo") AS RentDuration,
       "RentBiko",
       "ReturnDay",
       "ReturnBiko"
FROM "Rent";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:55:45
SELECT "RentNo",
       "CampanyName",
       "Shimei",
       "Workname",
       "RentDay",
       "RentNumber",
       "RentKind",
        "RentFrom"::timestamp::date,
        concat_ws('～', "RentFrom", "RentTo") AS RentDuration,
       "RentBiko",
       "ReturnDay",
       "ReturnBiko"
FROM "Rent";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 13:55:59
SELECT "RentNo",
       "CampanyName",
       "Shimei",
       "Workname",
       "RentDay",
       "RentNumber",
       "RentKind",
        "RentFrom"::timestamp::date,
        concat_ws('～', "RentFrom"::timestamp::date, "RentTo"::timestamp::date) AS RentDuration,
       "RentBiko",
       "ReturnDay",
       "ReturnBiko"
FROM "Rent";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 15:01:53
SELECT "RentNo",
       "CampanyName",
       "Shimei",
       "Workname",
       "RentDay",
       "RentNumber",
       "RentKind",
        "RentFrom"::timestamp::date,
        concat_ws('～', "RentFrom"::timestamp::date, "RentTo"::timestamp::date) AS RentDuration,
       "RentBiko",
       "ReturnDay",
       "ReturnBiko"
FROM "Rent";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 15:02:08
SELECT "RentNo",
       "CampanyName",
       "Shimei",
       "Workname",
       "RentDay",
       "RentNumber",
       "RentKind",
        "RentFrom"::timestamp::date,
        concat_ws('～', "RentFrom"::timestamp::date, "RentTo"::timestamp::date) AS RentDuration,
       "RentBiko",
       "ReturnDay",
       "ReturnBiko"
FROM "Rent"
where "ReturnDay" is null;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 15:13:15
SELECT "RentNo",
				   "CampanyName",
				   "Shimei",
				   "Workname",
				   "RentDay"::timestamp::date,
				   "RentNumber",
				   "RentKind",
				   "RentFrom"::timestamp::date,
				   "RentTo"::timestamp::date,
				   concat_ws(' ～ ', "RentFrom"::timestamp::date, "RentTo"::timestamp::date) AS RentDuration,
				   "RentBiko",
				   "ReturnDay"::timestamp::date,
				   "ReturnBiko"
			FROM neomeit."Rent" where 1=1  and 				"RentNo" = 'K00'			 and 				"Workname" LIKE '%Dummy_高岡市外1 %' and 				"RentNo" IS NULL			 order by "RentNo" asc;
--/

