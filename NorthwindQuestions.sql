select o.* ,sum(od.Quantity * od.UnitPrice) as OrderPrice
from Orders o
	Join [Order Details] OD
	on od.OrderID = o.OrderID
