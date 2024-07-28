--------------------Stored Procedures--------------------
--User Management
---CreateUser
create proc CreateUser
(
@Username nvarchar(250), @Email nvarchar(250), @PasswordHash nvarchar(250),
@Status nvarchar(11), @AddressLine1 nvarchar(250),
@AddressLine2 nvarchar(250), @City nvarchar(25), @State nvarchar(25),
@PostalCode int, @CountryID int
)
as
begin 
insert into users (username, email, passwordhash, status,
addressline1, addressline2, city, state, postalcode, countryid)
values (@Username, @Email, @PasswordHash, @Status, @AddressLine1,
@AddressLine2, @City, @State, @PostalCode, @CountryID)
end
go

---UpdateUserStatus
create proc UpdateUserStatus
(
@UserID int, @Status nvarchar(11)
)
as
begin 
update users set status = @Status where userid = @UserID
end
go

--Item Management
---CreateItem
create proc CreatItem
(
	@SellerID INT,
    @CategoryID INT,
    @Title NVARCHAR(100),
    @Description TEXT,
    @StartingPrice DECIMAL(10,2),
    @CurrentPrice DECIMAL(10,2),
    @StartDate DATETIME,
    @EndDate DATETIME,
    @ImageURL NVARCHAR(255)
)
as
begin 
 INSERT INTO items (sellerid, categoryid, title, description, startingprice,
 currentprice, startdate, enddate, imageurl)
    VALUES (@SellerID, @CategoryID, @Title, @Description, @StartingPrice,
	@CurrentPrice, @StartDate, @EndDate, @ImageURL)
end
go


--Bid Management
---PlaceBid
create proc PlaceBid 
(
@ItemID int, @UserID int, @BidAmount decimal (10,2)

)
as 
begin 
INSERT INTO bids (itemid, userid, bidamount)
VALUES (@ItemID, @UserID, @BidAmount);
UPDATE items
SET currentprice = @BidAmount
WHERE itemid = @ItemID;
end
go

--------------------Views--------------------
--Retrieve all items along with their respective seller information
create view ItemsWithSellers as 
select it.*, u.username as seller_username, u.email as seller_email
from items it
left join users u on u.userid = it.sellerid
go



--Retrieve all users along with their items, if they have any.
create view UsersWithItems as 
select u.*, it.itemid, it.startingprice, it.currentprice, it.description
from users u
join items it on it.sellerid = u.userid
go

--Retrieve all users and their items, showing all users and all items,
--even if there is no match.
create view usersAndItems as 
select u.*, it.itemid, it.startingprice, it.currentprice, it.description
from users u
full outer join items it on it.sellerid = u.userid
go

--Retrieve items with the number of bids each item has received
create view ItemsWithBidsNumber as
select b.itemid, count(*) as noOfBids
from bids b
join items it on it.itemid = b.itemid
group by b.itemid
go


select * from items
select * from orders
select * from bids
select * from users
go

--Retrieve users and the total amount they have spent on orders.
create view UsersAndTotalAmountPaid as
select username, totalamount
from users u 
join orders o on o.buyerid = u.userid 
go

--Retrieve items along with their category names.
create view ItemsWithTheirCategory as 
select it.*, cat.categoryname
from items it
join categories cat on cat.categoryid = it.categoryid


