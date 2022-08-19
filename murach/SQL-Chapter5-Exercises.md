# Chapter 5 Exercises - Answers

/* 5.1
SELECT VendorID, sum(PaymentTotal) PaymentSum
	from Invoices
	group by VendorID
*/
/* 5.2
SELECT top 10 VendorName, sum(PaymentTotal) PaymentSum
	from Invoices i
	join Vendors v
		on v.VendorID = i.VendorID
	group by v.VendorName
	order by sum(PaymentTotal) desc;
*/
/* 5.3
SELECT VendorName, count(*) InvoiceCount, sum(invoiceTotal) InvoiceTotal
	from Invoices i
	join Vendors v
		on v.VendorID = i.VendorID
	group by v.VendorID, VendorName
	order by InvoiceCount desc;
*/
/* 5.4
SELECT AccountDescription, Count(*) LineItemCount, Sum(InvoiceLineItemAmount) LineItemSum
	from GLAccounts g
	join InvoiceLineItems l
		on l.AccountNo = g.AccountNo
	group by AccountDescription
	having Count(*) > 1
	order by LineItemCount desc;
*/
/* 5.5
*/
SELECT VendorName, AccountDescription, Count(*) LineItemCount, 
		Sum(InvoiceLineItemAmount) LineItemSum
	from Vendors v
	join Invoices i
		on i.VendorID = v.VendorID
	join InvoiceLineItems l
		on l.InvoiceID = i.InvoiceID
	join GLAccounts g
		on g.AccountNo = l.AccountNo
	group by VendorName, AccountDescription