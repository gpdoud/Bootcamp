# Chapter 4 Exercises - Answers

/* 4.1 Answer
SELECT *
	from Invoices i
	join Vendors v
		on v.VendorID = i.VendorID
*/

/* 4.2 Answer
SELECT VendorName, InvoiceNumber, InvoiceDate, 
		InvoiceTotal - (PaymentTotal + CreditTotal) as Balance
	from Vendors v
	join Invoices i
		on i.VendorID = v.VendorID
	where InvoiceTotal - (PaymentTotal + CreditTotal) != 0
	order by VendorName
*/

/* 4.3 Answer
SELECT VendorName, DefaultAccountNo, AccountDescription
	from vendors v
	join GLAccounts g
		on g.AccountNo = v.DefaultAccountNo
	order by AccountDescription, VendorName
*/

/* 4.5 Answer
SELECT VendorName Vendor, InvoiceDate Date, InvoiceNumber Number,
		InvoiceSequence '#', InvoiceLineItemAmount LineItem
	from Vendors v
	join Invoices i
		on i.VendorID = v.VendorID
	join InvoiceLineItems l
		on l.InvoiceID = i.InvoiceID
	order by VendorName, InvoiceDate, InvoiceNumber, InvoiceSequence;
*/
