hinook SQL Practice Dataset 🎵
📌 Overview
The Chinook database is a sample database designed for practicing SQL.
It represents a digital music store, similar to iTunes, and is widely used for learning:

SQL fundamentals
Joins & subqueries
Aggregations
Real-world relational database design
This dataset is perfect for Data Analytics, Data Science, and SQL interview preparation.

🛠 Tools Used
SQLite
VS Code
SQLite Extension
🗂 Database Schema Overview
The database consists of 11 tables, organized into music data, customers & sales, and employees.

🎼 Music Related Tables
1️⃣ Artist
Stores information about music artists.

Column	Description
ArtistId	Unique ID for each artist
Name	Name of the artist
📌 One artist can have many albums

2️⃣ Album
Contains albums created by artists.

Column	Description
AlbumId	Unique album ID
Title	Album title
ArtistId	Reference to Artist table
📌 One album belongs to one artist

3️⃣ Track
Stores individual songs (tracks).

Column	Description
TrackId	Unique track ID
Name	Track name
AlbumId	Reference to Album
MediaTypeId	Type of media
GenreId	Genre of track
Composer	Composer name
Milliseconds	Track length
Bytes	File size
UnitPrice	Price per track
📌 Central table of the database

4️⃣ Genre
Defines music genres.

Column	Description
GenreId	Genre ID
Name	Genre name
📌 Used to categorize tracks

5️⃣ MediaType
Specifies format of the track.

Column	Description
MediaTypeId	Media type ID
Name	Media format (MP3, AAC, etc.)
👥 Customer & Sales Tables
6️⃣ Customer
Stores customer details.

Column	Description
CustomerId	Unique customer ID
FirstName	First name
LastName	Last name
Country	Country
City	City
Email	Email
SupportRepId	Assigned employee
📌 One customer can make many invoices

7️⃣ Invoice
Contains purchase transactions.

Column	Description
InvoiceId	Invoice ID
CustomerId	Customer reference
InvoiceDate	Date of purchase
BillingCountry	Country
Total	Total bill amount
📌 One invoice belongs to one customer

8️⃣ InvoiceLine
Details of each item in an invoice.

Column	Description
InvoiceLineId	Line item ID
InvoiceId	Invoice reference
TrackId	Purchased track
UnitPrice	Price
Quantity	Quantity
📌 Used for revenue and sales analysis

🧑‍💼 Employee Tables
9️⃣ Employee
Stores employee details.

Column	Description
EmployeeId	Employee ID
FirstName	First name
LastName	Last name
Title	Job title
ReportsTo	Manager ID
📌 Self-referencing table (manager-employee hierarchy)

🌍 Other Tables
🔟 Playlist
Stores playlists.

Column	Description
PlaylistId	Playlist ID
Name	Playlist name
1️⃣1️⃣ PlaylistTrack
Many-to-many mapping between playlists and tracks.

Column	Description
PlaylistId	Playlist reference
TrackId	Track reference
🔗 Entity Relationships (Important for Joins)
Artist → Album → Track
Track → Genre
Track → MediaType
Customer → Invoice → InvoiceLine → Track
Employee → Customer (Support Rep)
Playlist ↔ Track (Many-to-Many)
🎯 SQL Practice Topics Covered
INNER JOIN, LEFT JOIN
GROUP BY & HAVING
Subqueries
Window Functions (advanced)
Revenue analysis
Customer behavior analysis
🧪 Sample Queries
-- Top 5 customers by total spending
SELECT c.FirstName, c.LastName, SUM(i.Total) AS TotalSpent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY TotalSpent DESC
LIMIT 5;
