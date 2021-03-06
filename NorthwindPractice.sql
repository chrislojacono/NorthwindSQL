

select *
from products

select ProductName,
	   UnitsInStock * UnitPrice as PotentialRevenue --as is optional
from Products
where UnitPrice > 20

select p.*
from products p
	join Suppliers
		on P.SupplierID = Suppliers.SupplierID
where Suppliers.Country = 'USA'

select ProductName, CompanyName
from products
	join Suppliers
		on Products.SupplierID = Suppliers.SupplierID --- Table.Column

select products.*, c.*
from products 
	 join Categories c
		on Products.CategoryID = C.CategoryID
where c.CategoryName = 'Produce'

select p.*, s.CompanyName, c.CategoryName
from products p
	join Suppliers s
		on P.SupplierID = S.SupplierID
	join Categories c
		on c.CategoryID = p.CategoryID
where c.CategoryName = 'seafood'

select top 100 * 
	from Orders o
		join Employees e
			on o.EmployeeID = e.EmployeeID

select top 100 UnitPrice,Quantity, Discount, UnitPrice * Quantity * (1-Discount) as revenue
from [Order Details]

select c.CategoryName, sum(od.UnitPrice * Quantity  * (1-Discount)) as revenue
from Products p
	join [Order Details] od 
		on p.ProductID = od.ProductID
	join Categories c
		on c.CategoryID = p.CategoryID
group by c.CategoryName -- columns either have to a grouping, or they have to used for a calculation
order by revenue desc

select c.CategoryName, min(od.UnitPrice * Quantity  * (1-Discount)) as revenue
from Products p
	join [Order Details] od 
		on p.ProductID = od.ProductID
	join Categories c
		on c.CategoryID = p.CategoryID
group by c.CategoryName -- columns either have to a grouping, or they have to used for a calculation
order by revenue desc

select c.CategoryName, count(distinct od.ProductID) --min(od.UnitPrice * Quantity  * (1-Discount)) as revenue
from Products p
	join [Order Details] od 
		on p.ProductID = od.ProductID
	join Categories c
		on c.CategoryID = p.CategoryID
group by c.CategoryName -- columns either have to a grouping, or they have to used for a calculation
