-- psqledit log file
-- date: 2017-02-17

--neomeit@172.20.0.90:5432.imagedatabase2 11:05:50
select "BlockCode", "PrefectureCode", "WorkYear", "Workname", 
	"WorknameNo", "WorkFrom", "WorkTo", "Registrant", "Biko"
from "Workname"
where "BlockCode" LIKE '%5%' OR 
"PrefectureCode" LIKE '%5%'  OR 
"WorkYear" LIKE '%5%'  OR 
"Workname" LIKE '%5%'  OR 
"WorknameNo" LIKE '%5%'  OR 
"Registrant" LIKE '%5%'  OR 
"Biko" LIKE '%5%' 
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 11:06:00
select distinct "BlockCode", "PrefectureCode", "WorkYear", "Workname", 
	"WorknameNo", "WorkFrom", "WorkTo", "Registrant", "Biko"
from "Workname"
where "BlockCode" LIKE '%5%' OR 
"PrefectureCode" LIKE '%5%'  OR 
"WorkYear" LIKE '%5%'  OR 
"Workname" LIKE '%5%'  OR 
"WorknameNo" LIKE '%5%'  OR 
"Registrant" LIKE '%5%'  OR 
"Biko" LIKE '%5%' 
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 11:06:08
select  "BlockCode", "PrefectureCode", "WorkYear", "Workname", 
	"WorknameNo", "WorkFrom", "WorkTo", "Registrant", "Biko"
from "Workname"
where "BlockCode" LIKE '%5%' OR 
"PrefectureCode" LIKE '%5%'  OR 
"WorkYear" LIKE '%5%'  OR 
"Workname" LIKE '%5%'  OR 
"WorknameNo" LIKE '%5%'  OR 
"Registrant" LIKE '%5%'  OR 
"Biko" LIKE '%5%' 
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 11:35:20
select "BlockCode", "PrefectureCode", "WorkYear", "Workname", 
	"WorknameNo", "WorkFrom", "WorkTo", "Registrant", "Biko"
from "Workname"
;
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:18:34
			select "BuildingCode","BuildingName" from neomeit."Building" where 				("BuildingCode" like '%ã‡ëÚñÌê∂1234567890-^\!"#$%&''(()=~=~|<>?_/*-%'
					or
					"BuildingName" like '%ã‡ëÚñÌê∂1234567890-^\!"#$%&''(()=~=~|<>?_/*-%'
					or
					"PrefectureCode" like '%ã‡ëÚñÌê∂1234567890-^\!"#$%&''(()=~=~|<>?_/*-%'
					or
					"BuildingName2"like '%ã‡ëÚñÌê∂1234567890-^\!"#$%&''(()=~=~|<>?_/*-%'
					or
					"BuildingKana" like '%ã‡ëÚñÌê∂1234567890-^\!"#$%&''(()=~=~|<>?_/*-%'
					or
					"PostNo" like '%ã‡ëÚñÌê∂1234567890-^\!"#$%&''(()=~=~|<>?_/*-%'
					or
					"Address" like '%ã‡ëÚñÌê∂1234567890-^\!"#$%&''(()=~=~|<>?_/*-%'
					) and  "PrefectureCode"='17';
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:19:01
			select "BuildingCode","BuildingName" from neomeit."Building" where 				("BuildingCode" like '%ã‡ëÚñÌê∂1234567890-^\!"#$%&''(()=~=~|<>?_/*-%'
				
					) 
and  "PrefectureCode"='17';
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:19:02
			select "BuildingCode","BuildingName" from neomeit."Building" where 				("BuildingCode" like '%ã‡ëÚñÌê∂1234567890-^\!"#$%&''(()=~=~|<>?_/*-%'
				
					) 
and  "PrefectureCode"='17';
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:21:15
				SELECT  "Workname",  
						"WorknameNo"
				FROM neomeit."Workname" 
				WHERE 	"BlockCode" LIKE '%!"#$%&''()=~|{`*+P}?_></*-7894563210%' OR 
						"PrefectureCode" LIKE '%!"#$%&''()=~|{`*+P}?_></*-7894563210%' OR 
						"WorkYear" LIKE '%!"#$%&''()=~|{`*+P}?_></*-7894563210%'  OR 
						"Workname" LIKE '%!"#$%&''()=~|{`*+P}?_></*-7894563210%'  OR 
						"WorknameNo" LIKE '%!"#$%&''()=~|{`*+P}?_></*-7894563210%'  OR 
						"Registrant" LIKE '%!"#$%&''()=~|{`*+P}?_></*-7894563210%'  OR 
						"Biko" LIKE '%!"#$%&''()=~|{`*+P}?_></*-7894563210%' 
				ORDER BY "Workname";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:23:04
				SELECT  "Workname",  
						"WorknameNo"
				FROM neomeit."Workname" 
				WHERE 	"BlockCode" LIKE '%ã‡ëÚñÌê∂1234567890-^\!"#$%&''(()=~=~|<>?_/*-%' OR 
						"PrefectureCode" LIKE '%!"#$%&''()=~|{`*+P}?_></*-7894563210%' OR 
						"WorkYear" LIKE '%!"#$%&''()=~|{`*+P}?_></*-7894563210%'  OR 
						"Workname" LIKE '%!"#$%&''()=~|{`*+P}?_></*-7894563210%'  OR 
						"WorknameNo" LIKE '%!"#$%&''()=~|{`*+P}?_></*-7894563210%'  OR 
						"Registrant" LIKE '%!"#$%&''()=~|{`*+P}?_></*-7894563210%'  OR 
						"Biko" LIKE '%!"#$%&''()=~|{`*+P}?_></*-7894563210%' 
				ORDER BY "Workname";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:23:17
				SELECT  "Workname",  
						"WorknameNo"
				FROM neomeit."Workname" 
				WHERE 	"BlockCode" LIKE '%ã‡ëÚñÌê∂1234567890-^\!"#$%&''(()=~=~|<>?_/*-%'
				ORDER BY "Workname";
--/

--neomeit@172.20.0.90:5432.imagedatabase2 16:23:20
			select "BuildingCode","BuildingName" from neomeit."Building" 
where 				("BuildingCode" like '%ã‡ëÚñÌê∂1234567890-^\!"#$%&''(()=~=~|<>?_/*-%'
				
					) 
and  "PrefectureCode"='17';
--/

