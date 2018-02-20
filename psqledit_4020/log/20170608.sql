-- psqledit log file
-- date: 2017-06-08

--postgres@172.20.0.137:5432.kosyo_tool_step3 09:58:03
SELECT count(tehai_id) count
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '3'
				  AND gyoumu_kbn = '1';
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 09:58:19
SELECT max(eda_no) count
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '3'
				  AND gyoumu_kbn = '1';
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 09:58:35
SELECT max(eda_no) eda_max
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '3'
				  AND gyoumu_kbn = '1';
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 10:00:31
SELECT max(eda_no) eda_max
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '3'
				  AND gyoumu_kbn = '4';
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 10:02:25
SELECT CASE WHEN max(eda_no) is null THEN '0'
    
    ELSE max(eda_no)
END eda_max
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '3'
				  AND gyoumu_kbn = '4';
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 10:02:29
SELECT CASE WHEN max(eda_no) is null THEN '0'
    
    ELSE max(eda_no)
END eda_max
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '3'
				  AND gyoumu_kbn = '1';
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:12:32
SELECT  tehai_id,eda_no
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '3'
  AND gyoumu_kbn = '1'
order by eda_no
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:12:39
SELECT  tehai_id,eda_no
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '3'
  AND gyoumu_kbn = '4'
order by eda_no
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:12:50
SELECT  tehai_id,eda_no
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '1'
  AND gyoumu_kbn = '4'
order by eda_no
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:13:08
SELECT  tehai_id,eda_no
FROM tehaisaki
WHERE tehaikanri_id = 731;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:13:17
SELECT  tehai_id,eda_no
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '1';
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:13:38
SELECT  tehai_id,eda_no,timezone_code, gyoumu_kbn
FROM tehaisaki
WHERE tehaikanri_id = 731;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:13:50
SELECT  tehai_id,eda_no,timezone_code, gyoumu_kbn
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '1'
  AND gyoumu_kbn = '1'
order by eda_no
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:14:00
SELECT  tehai_id,eda_no,timezone_code, gyoumu_kbn
FROM tehaisaki
WHERE tehaikanri_id = 731;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:14:20
SELECT  tehai_id,eda_no,timezone_code, gyoumu_kbn
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '1'
  AND gyoumu_kbn = '1'
order by eda_no desc
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:15:02
SELECT  tehai_id||'_'||eda_no
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '1'
  AND gyoumu_kbn = '1'
order by eda_no desc
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:16:26
SELECT  tehai_id||'_'||eda_no 
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '1'
  AND gyoumu_kbn = '4'
order by eda_no desc
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:16:52
SELECT  tehai_id||'_'||eda_no 
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '1'
  AND gyoumu_kbn = '1'
order by eda_no desc
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:24:12
SELECT  CASE WHEN (tehai_id||'_'||eda_no)  is null THEN '0'
        ELSE tehai_id||'_'||eda_no 
        END 
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '1'
  AND gyoumu_kbn = '4'
order by eda_no desc
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:24:19
SELECT  CASE WHEN (tehai_id||'_'||eda_no)  is null THEN '0'
        ELSE tehai_id||'_'||eda_no 
        END 
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '1'
  AND gyoumu_kbn = '1'
order by eda_no desc
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:24:25
SELECT  CASE WHEN (tehai_id||'_'||eda_no)  is null THEN '0'
        ELSE tehai_id||'_'||eda_no 
        END 
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '1'
  AND gyoumu_kbn = '4'
order by eda_no desc
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:27:56
SELECT  tehai_id||'_'||eda_no  
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '1'
  AND gyoumu_kbn = '4'
order by eda_no desc
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:28:00
SELECT  tehai_id||'_'||eda_no  
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '1'
  AND gyoumu_kbn = '1'
order by eda_no desc
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:35:44
SELECT  tehai_id||'_'||eda_no  
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '3'
  AND gyoumu_kbn = '1'
order by eda_no desc
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:36:53
SELECT  tehai_id||'_'||eda_no  
FROM tehaisaki
WHERE tehaikanri_id = 731
  AND timezone_code = '4'
  AND gyoumu_kbn = '1'
order by eda_no desc
limit 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:40:24
SELECT tehai_id||'_'||eda_no
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:40:25
SELECT tehai_id||'_'||eda_no
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:40:26
SELECT tehai_id||'_'||eda_no
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:40:26
SELECT tehai_id||'_'||eda_no
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:40:27
SELECT tehai_id||'_'||eda_no
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:40:27
SELECT tehai_id||'_'||eda_no
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:40:27
SELECT tehai_id||'_'||eda_no
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:40:27
SELECT tehai_id||'_'||eda_no
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:40:28
SELECT tehai_id||'_'||eda_no
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:40:43
SELECT tehai_id||'_'||eda_no te
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:42:16
				SELECT tehai_id||'_'||eda_no te
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:50:01
				SELECT eda_no
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 11:50:04
				SELECT tehai_id||'_'||eda_no te
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

--postgres@172.20.0.137:5432.kosyo_tool_step3 13:29:59
				SELECT tehai_id||'_'||eda_no||'_'|| ed_date||'_'|| ed_time
				FROM tehaisaki
				WHERE tehaikanri_id = 731
				  AND timezone_code = '4'
				  AND gyoumu_kbn = '1' 
				ORDER BY eda_no desc
				LIMIT 1;
--/

