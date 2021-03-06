select o.* ,sum(od.Quantity * od.UnitPrice) as OrderPrice
from Orders o
	Join [Order Details] OD
	on od.OrderID = o.OrderID

select * 
from Products p
where p.Discontinued = 0


select c.CategoryName, sum(od.UnitPrice * Quantity  * (1-Discount)) as revenue, count(od.Quantity) as AmountSold
from Products p
	join [Order Details] od 
		on p.ProductID = od.ProductID
	join Categories c
		on c.CategoryID = p.CategoryID
group by c.CategoryName 
order by revenue desc

select o.OrderID, o.OrderDate, sum(od.Quantity * od.UnitPrice * (1 - Discount)) as OrderPrice
from Orders o
	Join [Order Details] OD
	on od.OrderID = o.OrderID
group by o.OrderID, o.OrderDate