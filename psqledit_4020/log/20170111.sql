-- psqledit log file
-- date: 2017-01-11

--kosyo2@172.20.0.137:5432.kosyo2 11:31:47
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,			   
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code IN ('25','26','27','28','29','30') 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				LEFT JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 11:33:04
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,			   
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				    AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code IN ('25','26','27','28','29','30') 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:33:40
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code--,			   
--					   array_to_string(ARRAY
--						   (SELECT t2.kyoten_area
--							FROM tehaisakikanri t2
--							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
--							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				    AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code IN ('25','26','27','28','29','30') 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				LEFT JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:33:53
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,			   
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				    AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code IN ('25','26','27','28','29','30') 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				LEFT JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:39:57
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,			   
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				    AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code IN ('25','26','27','28','29','30') 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				--LEFT JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:40:31
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,			   
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				    AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code IN ('25','26','27','28','29','30') 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				LEFT JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:40:43
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,			   
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				    AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code IN ('25','26','27','28','29','30') 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				--LEFT JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:42:17
SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code,			   
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=bm.build_code), '、') kyoten_area
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				    AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code IN ('25','26','27','28','29','30') 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   
				ORDER BY bm.block_code,
						bm.fuken_code,
						bm.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:51:50
SELECT b.block_name,
	  f.fuken_name,
	  bm.block_code,
	  bm.fuken_code,
	  bm.build_kubun,
	  bm.build_name,
	  bm.ryaku_name,
	  bm.kana_name,
	  bm.admin_code,
	  bm.build_code,	
 tk.service_code,
					   sm.service_name,		   
   array_to_string(ARRAY
	   (SELECT t2.kyoten_area
		FROM tehaisakikanri t2
		LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
		WHERE t1.build_code=bm.build_code), '、') kyoten_area
FROM build_mst bm
LEFT JOIN block_mst b ON b.block_code = bm.block_code
LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
AND f.fuken_code = bm.fuken_code

INNER JOIN tehaisaki_build tb ON bm.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code
WHERE bm.block_code ='01'
  AND bm.fuken_code IN ('25','26','27','28','29','30') 
  AND bm.build_name LIKE '%%'
  AND bm.ryaku_name LIKE '%%'
  AND bm.kana_name LIKE '%%'
ORDER BY bm.block_code,
	bm.fuken_code,
	bm.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 13:27:16
SELECT b.block_name,
	  f.fuken_name,
	  bm.block_code,
	  bm.fuken_code,
	  bm.build_kubun,
	  bm.build_name,
	  bm.ryaku_name,
	  bm.kana_name,
	  bm.admin_code,
	  bm.build_code,			   
   array_to_string(ARRAY
	   (SELECT t2.kyoten_area
		FROM tehaisakikanri t2
		LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
		WHERE t1.build_code=bm.build_code), '、') kyoten_area
FROM build_mst bm
LEFT JOIN block_mst b ON b.block_code = bm.block_code
LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
AND f.fuken_code = bm.fuken_code
WHERE bm.block_code ='01'
  AND bm.fuken_code IN ('27') 
  AND bm.build_name LIKE '%%'
  AND bm.ryaku_name LIKE '%%'
  AND bm.kana_name LIKE '%%'

ORDER BY bm.block_code,
	bm.fuken_code,
	bm.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:02:38
SELECT b.block_name,
	  f.fuken_name,
	  bm.block_code,
	  bm.fuken_code,
	  bm.build_kubun,
	  bm.build_name,
	  bm.ryaku_name,
	  bm.kana_name,
	  bm.admin_code,
	  bm.build_code,			   
      array_to_string(ARRAY
    	   (SELECT t2.kyoten_area
    		FROM tehaisakikanri t2
    		LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
    		WHERE t1.build_code=bm.build_code), '、') kyoten_area
FROM build_mst bm
LEFT JOIN block_mst b ON b.block_code = bm.block_code
LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
AND f.fuken_code = bm.fuken_code
WHERE bm.block_code ='01'
  AND bm.fuken_code IN ('27') 
--  AND bm.build_name LIKE '%%'
--  AND bm.ryaku_name LIKE '%%'
--  AND bm.kana_name LIKE '%%'

ORDER BY bm.block_code,
	bm.fuken_code,
	bm.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:02:43
SELECT b.block_name,
	  f.fuken_name,
	  bm.block_code,
	  bm.fuken_code,
	  bm.build_kubun,
	  bm.build_name,
	  bm.ryaku_name,
	  bm.kana_name,
	  bm.admin_code,
	  bm.build_code,			   
      array_to_string(ARRAY
    	   (SELECT t2.kyoten_area
    		FROM tehaisakikanri t2
    		LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
    		WHERE t1.build_code=bm.build_code), '、') kyoten_area
FROM build_mst bm
LEFT JOIN block_mst b ON b.block_code = bm.block_code
LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
AND f.fuken_code = bm.fuken_code
WHERE bm.block_code ='01'
  AND bm.fuken_code IN ('27') 
  AND bm.build_name LIKE '%%'
  AND bm.ryaku_name LIKE '%%'
  AND bm.kana_name LIKE '%%'

ORDER BY bm.block_code,
	bm.fuken_code,
	bm.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:03:01
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   --tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code
								AND t2.service_code=tk.service_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code ='27' 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				INNER JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:03:15
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   --tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code
								AND t2.service_code=tk.service_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code ='27' 
					  AND bm.build_name LIKE '%%'
					  AND bm.ryaku_name LIKE '%%'
					  AND bm.kana_name LIKE '%%'
				   ) X
				INNER JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:03:24
				SELECT distinct
					   x.block_name,
					   x.fuken_name,
					   x.block_code,
					   x.fuken_code,
					   x.build_kubun,
					   x.build_name,
					   x.ryaku_name,
					   x.kana_name,
					   x.admin_code,
					   x.build_code,	
					   --tb.tehaikanri_id,		   
					   tk.service_code,
					   sm.service_name,
					   array_to_string(ARRAY
						   (SELECT t2.kyoten_area
							FROM tehaisakikanri t2
							LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
							WHERE t1.build_code=X.build_code
								AND t2.service_code=tk.service_code), '、') kyoten_area
				FROM
				  (SELECT b.block_name,
						  f.fuken_name,
						  bm.block_code,
						  bm.fuken_code,
						  bm.build_kubun,
						  bm.build_name,
						  bm.ryaku_name,
						  bm.kana_name,
						  bm.admin_code,
						  bm.build_code
				   FROM build_mst bm
				   LEFT JOIN block_mst b ON b.block_code = bm.block_code
				   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
				   AND f.fuken_code = bm.fuken_code
				   WHERE bm.block_code ='01'
					  AND bm.fuken_code ='27' 
--					  AND bm.build_name LIKE '%%'
--					  AND bm.ryaku_name LIKE '%%'
--					  AND bm.kana_name LIKE '%%'
				   ) X
				INNER JOIN tehaisaki_build tb ON X.build_code = tb.build_code
				LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = tb.tehaikanri_id
				LEFT JOIN service_mst sm ON sm.service_code = tk.service_code 
				ORDER BY x.block_code,
							x.fuken_code,
							x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:03:38
SELECT b.block_name,
	  f.fuken_name,
	  bm.block_code,
	  bm.fuken_code,
	  bm.build_kubun,
	  bm.build_name,
	  bm.ryaku_name,
	  bm.kana_name,
	  bm.admin_code,
	  bm.build_code,			   
      array_to_string(ARRAY
    	   (SELECT t2.kyoten_area
    		FROM tehaisakikanri t2
    		LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
    		WHERE t1.build_code=bm.build_code), '、') kyoten_area
FROM build_mst bm
LEFT JOIN block_mst b ON b.block_code = bm.block_code
LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
AND f.fuken_code = bm.fuken_code
WHERE bm.block_code ='01'
  AND bm.fuken_code IN ('27') 
  AND bm.build_name LIKE '%%'
  AND bm.ryaku_name LIKE '%%'
  AND bm.kana_name LIKE '%%'

ORDER BY bm.block_code,
	bm.fuken_code,
	bm.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:03:49
SELECT b.block_name,
	  f.fuken_name,
	  bm.block_code,
	  bm.fuken_code,
	  bm.build_kubun,
	  bm.build_name,
	  bm.ryaku_name,
	  bm.kana_name,
	  bm.admin_code,
	  bm.build_code,			   
      array_to_string(ARRAY
    	   (SELECT t2.kyoten_area
    		FROM tehaisakikanri t2
    		LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
    		WHERE t1.build_code=bm.build_code), '、') kyoten_area
FROM build_mst bm
LEFT JOIN block_mst b ON b.block_code = bm.block_code
LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
AND f.fuken_code = bm.fuken_code
WHERE bm.block_code ='01'
  AND bm.fuken_code IN ('27') 
--  AND bm.build_name LIKE '%%'
--  AND bm.ryaku_name LIKE '%%'
--  AND bm.kana_name LIKE '%%'

ORDER BY bm.block_code,
	bm.fuken_code,
	bm.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:33:45
SELECT b.block_name,
	  f.fuken_name,
	  bm.block_code,
	  bm.fuken_code,
	  bm.build_kubun,
	  bm.build_name,
	  bm.ryaku_name,
	  bm.kana_name,
	  bm.admin_code,
	  bm.build_code,			   
      array_to_string(ARRAY
    	   (SELECT t2.kyoten_area
    		FROM tehaisakikanri t2
    		LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
    		WHERE t1.build_code=bm.build_code), '、') kyoten_area
FROM build_mst bm
LEFT JOIN block_mst b ON b.block_code = bm.block_code
LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
AND f.fuken_code = bm.fuken_code
WHERE bm.block_code ='01'
  AND bm.fuken_code IN ('27') 
  AND bm.build_name LIKE '%%'
  AND bm.ryaku_name LIKE '%%'
  AND bm.kana_name LIKE '%%'

ORDER BY bm.block_code,
	bm.fuken_code,
	bm.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:40:48
select tehaikanri_id, tehai_id, eda_no, timezone_code, kubun, 
	kikan_naiyou, st_date, st_time, ed_date, ed_time, gyoumu_kbn, 
	syukan_soshiki, bikou, add_date, add_userid, upd_date, upd_userid
from tehaisaki
where tehai_id=114;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:41:07
select *
from tehaisaki
where tehai_id=114;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:41:17
select x.*
from tehaisaki x
where tehai_id=114;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:41:18
select x.*
from tehaisaki x
where tehai_id=114;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:41:18
select x.*
from tehaisaki x
where tehai_id=114;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:41:19
select x.*
from tehaisaki x
where tehai_id=114;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:41:19
select x.*
from tehaisaki x
where tehai_id=114;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:41:19
select x.*
from tehaisaki x
where tehai_id=114;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:42:47
select * from 
(SELECT b.block_name,
	  f.fuken_name,
	  bm.block_code,
	  bm.fuken_code,
	  bm.build_kubun,
	  bm.build_name,
	  bm.ryaku_name,
	  bm.kana_name,
	  bm.admin_code,
	  bm.build_code
/*	  ,			   
      array_to_string(ARRAY
    	   (SELECT t2.kyoten_area
    		FROM tehaisakikanri t2
    		LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
    		WHERE t1.build_code=bm.build_code), '、') kyoten_area
*/
FROM build_mst bm
LEFT JOIN block_mst b ON b.block_code = bm.block_code
LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
AND f.fuken_code = bm.fuken_code
WHERE bm.block_code ='01'
  AND bm.fuken_code IN ('27') 
  AND bm.build_name LIKE '%%'
  AND bm.ryaku_name LIKE '%%'
  AND bm.kana_name LIKE '%%'

ORDER BY bm.block_code,
	bm.fuken_code,
	bm.build_code
)x ,
 array_to_string(ARRAY
    	   (SELECT t2.kyoten_area
    		FROM tehaisakikanri t2
    		LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
    		WHERE t1.build_code=x.build_code), '、') kyoten_area;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:53:31
select t1.build_code, string_agg(t2.kyoten_area,'、')
from tehaisaki_build t1
left join tehaisakikanri t2 on t2.tehaikanri_id = t1.tehaikanri_id
group by t1.build_code

;
--/

--kosyo2@172.20.0.137:5432.kosyo2 15:57:52
select * from 
(SELECT b.block_name,
	  f.fuken_name,
	  bm.block_code,
	  bm.fuken_code,
	  bm.build_kubun,
	  bm.build_name,
	  bm.ryaku_name,
	  bm.kana_name,
	  bm.admin_code,
	  bm.build_code
/*	  ,			   
      array_to_string(ARRAY
    	   (SELECT t2.kyoten_area
    		FROM tehaisakikanri t2
    		LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
    		WHERE t1.build_code=bm.build_code), '、') kyoten_area
*/
FROM build_mst bm
LEFT JOIN block_mst b ON b.block_code = bm.block_code
LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
AND f.fuken_code = bm.fuken_code
WHERE bm.block_code ='01'
  AND bm.fuken_code IN ('27') 
  AND bm.build_name LIKE '%%'
  AND bm.ryaku_name LIKE '%%'
  AND bm.kana_name LIKE '%%'

ORDER BY bm.block_code,
	bm.fuken_code,
	bm.build_code
)x 
-- array_to_string(ARRAY
--    	   (SELECT t2.kyoten_area
--    		FROM tehaisakikanri t2
--    		LEFT JOIN tehaisaki_build t1 ON t1.tehaikanri_id = t2.tehaikanri_id
--    		WHERE t1.build_code=x.build_code), '、') kyoten_area
left join
(select t1.build_code, string_agg(t2.kyoten_area,'、') kyoten_area
from tehaisaki_build t1
left join tehaisakikanri t2 on t2.tehaikanri_id = t1.tehaikanri_id
--WHERE t1.build_code=x.build_code
group by t1.build_code ) y on  y.build_code = x.build_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2 17:30:09
SELECT x.*, y.kyoten_area 
				FROM (
					SELECT distinct
							  b.block_name,
							  f.fuken_name,
							  bm.block_code,
							  bm.fuken_code,
							  bm.build_kubun,
							  bm.build_name,
							  bm.ryaku_name,
							  bm.kana_name,
							  bm.admin_code,
							  bm.build_code					
					FROM build_mst bm
					   LEFT JOIN block_mst b ON b.block_code = bm.block_code
					   LEFT JOIN fuken_mst f ON f.block_code = bm.block_code
					   AND f.fuken_code = bm.fuken_code
					WHERE bm.block_code ='02'
						  AND bm.fuken_code IN ('21','22','23','24') 
						  
					ORDER BY 	bm.block_code,
								bm.fuken_code,
								bm.build_code
					) x
				LEFT JOIN
					(SELECT t1.build_code, string_agg(t2.kyoten_area,'、') kyoten_area
					FROM tehaisaki_build t1
					LEFT JOIN tehaisakikanri t2 ON t2.tehaikanri_id = t1.tehaikanri_id
					GROUP BY t1.build_code ) y ON  y.build_code = x.build_code;
--/

