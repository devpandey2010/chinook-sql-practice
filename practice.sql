--List all customers along with their invoices (include customers with no invoices).
select * from customer c join invoice i on c.CustomerId=i.CustomerId;

--Q2.Show customer name and total number of invoices for each customer.
select c.FirstName,c.LastName,count(i.InvoiceId) as total_invoices from customer c 
left join invoice i on c.CustomerId=i.customerid
group by c.firstname,c.lastname,c.CustomerId;

--Q3.list all tracks with their album name and artist name
select t.name as track_name,al.title as album_name,ar.name as artist_name from track t 
join album al on t.albumid=al.AlbumId join artist ar on al.ArtistId=ar.ArtistId;

--Q4.Display all invoices along with customer country
select i.*,c.Country as country from invoice i join Customer c on i.CustomerId=c.CustomerId;

--Q5.Show all tracks and their genre names.
select t.name,g.name from track t join genre g on t.GenreId=g.GenreId;

--Q6.List customers who have made at least one purchase.
select distinct c.FirstName,c.LastName from Customer c join invoice i on c.CustomerId=i.CustomerId;

select c.firstname,c.lastname from customer c  
where exists(select 1 from invoice i where i.CustomerId=c.CustomerId);

--Q7.Find all albums that have at least one track.
select al.title from album al 
where exists(select 1 from track t where t.AlbumId=al.AlbumId);

--Q8.Display each invoice and the total number of tracks in it.
select i.InvoiceId,count(t.TrackId) as total from Invoice i 
join InvoiceLine il on i.InvoiceId=il.InvoiceId join track t on il.TrackId=t.TrackId
group by i.InvoiceId;

--Q9.Show all artists and their albums (include artists with no albums)
select ar.name,al.title from artist ar left join album al on ar.ArtistId=al.ArtistId;

--Q10 List employees along with their managers’ names
-- List employees along with their managers’ names

SELECT
    e.FirstName  AS employee_first_name,
    e.LastName   AS employee_last_name,
    m.FirstName  AS manager_first_name,
    m.LastName   AS manager_last_name
FROM Employee e
LEFT JOIN Employee m
    ON e.ReportsTo = m.EmployeeId;


