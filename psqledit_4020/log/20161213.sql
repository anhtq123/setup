-- psqledit log file
-- date: 2016-12-13

--kosyo2@172.20.0.137:5432.kosyo2_20161101 16:25:22
SELECT sm.soshiki_id, sm.kaisya_id, (select kaisya_name from kaisya_mst where kaisya_id = sm.kaisya_id) || 'Å@' || array_to_string (ARRAY (SELECT soshiki_name FROM soshiki_mst WHERE soshiki_code LIKE left(sm.soshiki_code,2)||'%' AND length(soshiki_code) <= length(sm.soshiki_code) AND kaisya_id = sm.kaisya_id AND soshiki_code = left(sm.soshiki_code, length(soshiki_code)) ORDER BY soshiki_code), 'a