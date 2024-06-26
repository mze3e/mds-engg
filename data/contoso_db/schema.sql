CREATE SEQUENCE lineitem_id_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 12814 NO CYCLE;
CREATE SEQUENCE order_id_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 2546 NO CYCLE;
CREATE SEQUENCE product_id_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 296 NO CYCLE;
CREATE SEQUENCE customer_id_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 501 NO CYCLE;
CREATE TABLE Products(
	ProductId INTEGER PRIMARY KEY DEFAULT(nextval('product_id_seq')),
	Colour VARCHAR,
	DaysToManufacture INTEGER NOT NULL,
	Description VARCHAR,
	ListPrice DECIMAL(10, 2) NOT NULL,
	"Name" VARCHAR,
	StandardCost DECIMAL(10, 2) NOT NULL,
	Weight DECIMAL(10, 2) NOT NULL
);
CREATE TABLE Customers(
	CustomerId INTEGER PRIMARY KEY DEFAULT(nextval('customer_id_seq')),
	Address VARCHAR,
	Company VARCHAR,
	Email VARCHAR,
	FirstName VARCHAR,
	LastName VARCHAR,
	Phone VARCHAR
);
CREATE TABLE Orders(
	OrderId INTEGER PRIMARY KEY DEFAULT(nextval('order_id_seq')),
	Address VARCHAR,
	CustomerId INTEGER NOT NULL,
	CustomerName VARCHAR,
	DateFilled TIMESTAMP,
	DatePlaced TIMESTAMP NOT NULL,
	InvoiceNumber INTEGER NOT NULL,
	PaymentStatus INTEGER NOT NULL,
	Status INTEGER NOT NULL,
	Term INTEGER NOT NULL,
	FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);
CREATE TABLE LineItems(
	LineItemId INTEGER PRIMARY KEY DEFAULT(nextval('lineitem_id_seq')),
	OrderId INTEGER NOT NULL,
	ProductId INTEGER NOT NULL,
	Quantity INTEGER NOT NULL,
	FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
	FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);
CREATE INDEX IX_Orders_CustomerId ON Orders (CustomerId);
CREATE INDEX IX_LineItems_ProductId ON LineItems (ProductId);
CREATE INDEX IX_LineItems_OrderId ON LineItems (OrderId);