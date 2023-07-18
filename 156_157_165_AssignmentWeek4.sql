use mydb;

/*Stored Procedure*/
drop procedure if exists week4;
delimiter //
create procedure week4()
begin
insert into menu values(NULL, "กะเพราะหมูกรอบ", 45), (NULL, "ข้าวผัดหมู", 40);
insert into orders values(NULL, "2023-07-01", 1), (NULL, "2023-07-02", 2);
insert into orderdetails values(NULL, 1, 1, 1), (NULL, 2, 2, 2);
end//
delimiter ;

call week4();

/*View*/
create view reportorder3 as 
select ordersID, tableNum, orderDate, nameMenu, quantity
from orders join orderdetails using (ordersID) join menu using (menuID);