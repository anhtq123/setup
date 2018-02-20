-- psqledit log file
-- date: 2016-12-09

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:34:38
                        SELECT DISTINCT t.tehai_id,
										t.eda_no
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
							   OR ts.soshiki_id =
								 (SELECT soshiki_id
								  FROM itakumoto_soshiki
								  WHERE itaku_soshiki_id=374 )
							   OR t.syukan_soshiki=374
							   OR t.syukan_soshiki=
								 (SELECT soshiki_id
								  FROM itakumoto_soshiki
								  WHERE itaku_soshiki_id=374 ) )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date >= 'now()'
							    )
                            AND  tk.service_code='01';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:35:41
                        SELECT DISTINCT t.tehai_id,
										t.eda_no
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date >= 'now()'
							    )
                            AND  tk.service_code='01';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:35:46
                        SELECT DISTINCT t.tehai_id,
										t.eda_no
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              );
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:35:54
                        SELECT DISTINCT t.tehai_id,
										t.eda_no
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:35:58
                        SELECT DISTINCT t.tehai_id,
										t.eda_no
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:36:04
                        SELECT DISTINCT t.tehai_id,
										t.eda_no
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date >= 'now()'
							    );
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:38:54
                        SELECT DISTINCT t.tehai_id,
										t.eda_no
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:43:55
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,t.ed_date
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:45:01
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,t.ed_date
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date >= 'now()'
							    );
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:45:15
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,t.ed_date
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								--OR t.ed_date >= 'now()'
							    );
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:45:16
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,t.ed_date
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								--OR t.ed_date >= 'now()'
							    );
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:45:26
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,t.ed_date
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date >= 'now()'
							    );
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:45:34
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,t.ed_date
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date <= 'now()'
							    );
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:46:00
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,t.ed_date
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date <= 'now()'
							    )
                            AND  tk.service_code='01';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:46:12
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,t.ed_date,tk.service_code
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date <= 'now()'
							    );
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:46:18
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,t.ed_date,tk.service_code
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date <= 'now()'
							    )
                            AND  tk.service_code='01';
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:47:26
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,t.ed_date,tk.service_code
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date <= 'now()'
							    )
                            AND  tk.service_code='01'
                        ORDER BY t.tehai_id,
								t.eda_no;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:47:53
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,t.ed_date,tk.service_code
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date <= 'now()'
							    )
                            AND  tk.service_code='01'
                        ORDER BY t.tehai_id,
								t.eda_no,
                                tk.service_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 10:48:13
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,
                                        tk.service_code
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date <= 'now()'
							    )
                            AND  tk.service_code='01'
                        ORDER BY t.tehai_id,
								t.eda_no,
                                tk.service_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:15:15
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,
                                        tk.service_code
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date <= 'now()'
							    )
--                            AND  tk.service_code='01'
                        ORDER BY t.tehai_id,
								t.eda_no,
                                tk.service_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:15:37
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,
                                        tk.service_code,t.st_date,t.ed_date
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
--							   OR ts.soshiki_id =
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 )
--							   OR t.syukan_soshiki=374
--							   OR t.syukan_soshiki=
--								 (SELECT soshiki_id
--								  FROM itakumoto_soshiki
--								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date <= 'now()'
							    )
--                            AND  tk.service_code='01'
                        ORDER BY t.tehai_id,
								t.eda_no,
                                tk.service_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:16:52
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,
                                        tk.service_code,t.st_date,t.ed_date
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
							   OR ts.soshiki_id =
								 (SELECT soshiki_id
								  FROM itakumoto_soshiki
								  WHERE itaku_soshiki_id=374 )
							   OR t.syukan_soshiki=374
							   OR t.syukan_soshiki=
								 (SELECT soshiki_id
								  FROM itakumoto_soshiki
								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date <= 'now()'
							    )
--                            AND  tk.service_code='01'
                        ORDER BY t.tehai_id,
								t.eda_no,
                                tk.service_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:27:26
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,
                                        tk.service_code,t.st_date,t.ed_date
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
							   OR ts.soshiki_id =
								 (SELECT soshiki_id
								  FROM itakumoto_soshiki
								  WHERE itaku_soshiki_id=374 )
							   OR t.syukan_soshiki=374
							   OR t.syukan_soshiki=
								 (SELECT soshiki_id
								  FROM itakumoto_soshiki
								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date <= '2016/12/19'
							    )
--                            AND  tk.service_code='01'
                        ORDER BY t.tehai_id,
								t.eda_no,
                                tk.service_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 11:27:34
                        SELECT DISTINCT t.tehai_id,
										t.eda_no,
                                        tk.service_code,t.st_date,t.ed_date
						FROM tehaisaki t
						LEFT JOIN tehaisaki_soshiki ts ON ts.tehai_id = t.tehai_id
							AND ts.eda_num = t.eda_no
						LEFT JOIN tehaisakikanri tk ON tk.tehaikanri_id = t.tehaikanri_id
						WHERE (ts.soshiki_id=374
							   OR ts.soshiki_id =
								 (SELECT soshiki_id
								  FROM itakumoto_soshiki
								  WHERE itaku_soshiki_id=374 )
							   OR t.syukan_soshiki=374
							   OR t.syukan_soshiki=
								 (SELECT soshiki_id
								  FROM itakumoto_soshiki
								  WHERE itaku_soshiki_id=374 ) 
                              )
							AND t.kubun = '1'
							AND t.timezone_code = '1'
							AND (t.ed_date = ''
								OR t.ed_date <= '2016/12/09'
							    )
--                            AND  tk.service_code='01'
                        ORDER BY t.tehai_id,
								t.eda_no,
                                tk.service_code;
--/

--kosyo2@172.20.0.137:5432.kosyo2_20161101 15:19:04
				SELECT 	wi.irai_id, 
							wi.title, 
							wi.kigen, 
							wi.irai_houhou, 
							wi.status, 
							wi.status_upd_dt,
							wi.add_date,
							km1.kaisya_name || '　' || (CASE
								 WHEN length(sm1.soshiki_code) > 1 THEN
										(SELECT soshiki_name
										 FROM soshiki_mst b
										 WHERE b.soshiki_code = substring(sm1.soshiki_code,1,2)
										   AND b.kaisya_id = sm1.kaisya_id)
								 ELSE ''
							 END) || '　' || CASE
												WHEN length(sm1.soshiki_code) > 3 THEN
													   (SELECT soshiki_name
														FROM soshiki_mst b
														WHERE b.soshiki_code = substring(sm1.soshiki_code,1,4)
														  AND b.kaisya_id = sm1.kaisya_id)
												ELSE ''
											END || '　' || CASE
															  WHEN length(sm1.soshiki_code) > 5 THEN
																	 (SELECT soshiki_name
																	  FROM soshiki_mst b
																	  WHERE b.soshiki_code = substring(sm1.soshiki_code,1,6)
																		AND b.kaisya_id = sm1.kaisya_id)
															  ELSE ''
														  END || '　' || CASE
																			WHEN length(sm1.soshiki_code) > 7 THEN
																				   (SELECT soshiki_name
																					FROM soshiki_mst b
																					WHERE b.soshiki_code = substring(sm1.soshiki_code,1,8)
																					  AND b.kaisya_id = sm1.kaisya_id)
																			ELSE ''
																		END || '　' || CASE
																						  WHEN length(sm1.soshiki_code) > 9 THEN
																								 (SELECT soshiki_name
																								  FROM soshiki_mst b
																								  WHERE b.soshiki_code = substring(sm1.soshiki_code,1,10)
																									AND b.kaisya_id = sm1.kaisya_id)
																						  ELSE ''
																					  END AS iraimoto,
							km2.kaisya_name || '　' || (CASE
								 WHEN length(sm2.soshiki_code) > 1 THEN
										(SELECT soshiki_name
										 FROM soshiki_mst b
										 WHERE b.soshiki_code = substring(sm2.soshiki_code,1,2)
										   AND b.kaisya_id = sm2.kaisya_id)
								 ELSE ''
							 END) || '　' || CASE
												WHEN length(sm2.soshiki_code) > 3 THEN
													   (SELECT soshiki_name
														FROM soshiki_mst b
														WHERE b.soshiki_code = substring(sm2.soshiki_code,1,4)
														  AND b.kaisya_id = sm2.kaisya_id)
												ELSE ''
											END || '　' || CASE
															  WHEN length(sm2.soshiki_code) > 5 THEN
																	 (SELECT soshiki_name
																	  FROM soshiki_mst b
																	  WHERE b.soshiki_code = substring(sm2.soshiki_code,1,6)
																		AND b.kaisya_id = sm2.kaisya_id)
															  ELSE ''
														  END || '　' || CASE
																			WHEN length(sm2.soshiki_code) > 7 THEN
																				   (SELECT soshiki_name
																					FROM soshiki_mst b
																					WHERE b.soshiki_code = substring(sm2.soshiki_code,1,8)
																					  AND b.kaisya_id = sm2.kaisya_id)
																			ELSE ''
																		END || '　' || CASE
																						  WHEN length(sm2.soshiki_code) > 9 THEN
																								 (SELECT soshiki_name
																								  FROM soshiki_mst b
																								  WHERE b.soshiki_code = substring(sm2.soshiki_code,1,10)
																									AND b.kaisya_id = sm2.kaisya_id)
																						  ELSE ''
																					  END AS iraisaki,
							sm2.soshiki_id,
						    wir.status AS iraisaki_status,
						    wir.seq_no,
							inum.irai_su,
							st.kanryou_su
					FROM work_irai 				wi
					LEFT JOIN soshiki_mst		sm1  ON sm1.soshiki_id = wi.soshiki_id
					LEFT JOIN kaisya_mst 		km1  ON km1.kaisya_id = sm1.kaisya_id
					LEFT JOIN work_irai_req		wir  ON wir.irai_id = wi.irai_id
					LEFT JOIN soshiki_mst		sm2  ON sm2.soshiki_id = wir.soshiki_id
					LEFT JOIN kaisya_mst 		km2	 ON km2.kaisya_id = sm2.kaisya_id
					LEFT JOIN
					  (SELECT req.irai_id,
							  count(req.irai_id) AS irai_su,
							  req.soshiki_id
					   FROM work_irai_tehai req
					   GROUP BY req.irai_id,
								req.soshiki_id) inum ON wi.irai_id = inum.irai_id AND wir.soshiki_id = inum.soshiki_id
					LEFT JOIN
					  (SELECT req.irai_id,
							  count(req.status) AS kanryou_su,
							  req.soshiki_id
					   FROM work_irai_tehai req
					   WHERE req.status >= 9
					   GROUP BY req.irai_id,
								req.soshiki_id) st ON wi.irai_id = st.irai_id AND st.soshiki_id = wir.soshiki_id 
					WHERE 1 = 1 
					AND wi.irai_id = 165  
					ORDER BY wir.seq_no;
--/

