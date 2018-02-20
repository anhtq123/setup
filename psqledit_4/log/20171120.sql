-- psqledit log file
-- date: 2017-11-20

--postgres@172.20.0.89:5432.imagedatabase3 13:18:11
insert into neomeit."User" ("UserID" , "UserType" , "Authority" , "UserName" , "Password" , "PasswordUpdateDate" , "Organization" , "ManagerID" , "ExpirationDate" , "LockedFlag" , "DeleteFlag" , "AreaPermissions" ) values ('sako003' , '1' , '0' , 'テストユーザ' , 'ea47b763f3f127e2e096f5df691503b3' , '2017-11-20 13:17:57' , '' , 'admin' , '2017/12/31' , '0' , '0' , '01,05,' );
--/

--postgres@172.20.0.89:5432.imagedatabase3 13:29:42
delete from neomeit."User"
where "UserID"='sako003';
--/

