# Chapter 6 Exercises - Answers

/* 6.1
-- 6.1
SELECT DISTINCT VendorName
    from Vendors v
    where v.VendorID in (
        SELECT VendorID from Invoices
    )
    order by VendorName;
*/

/* 6.2
-- 6.2
SELECT InvoiceNumber, InvoiceTotal
    from Invoices
    where PaymentTotal > (
        SELECT Avg(PaymentTotal)
            from Invoices
            where InvoiceTotal - (PaymentTotal + CreditTotal) = 0
    );
*/

/* 6.3
-- 6.3
SELECT InvoiceNumber, InvoiceTotal
    from Invoices
    where PaymentTotal > ALL (
        SELECT TOP 50 PERCENT PaymentTotal
            from Invoices
            order by PaymentTotal
    );
*/

/* 6.4
-- 6.4
SELECT *
    from GLAccounts g
    where NOT EXISTS (
        SELECT * 
            from InvoiceLineItems l
            where l.AccountNo = g.AccountNo
    )
    order by g.AccountNo;
*/

/* 6.5
-- 6.5
SELECT VendorName, i.InvoiceID, InvoiceSequence, InvoiceLineItemAmount
    from Vendors v
    join Invoices i 
        on i.VendorID = v.VendorID
    join InvoiceLineItems l
        on l.InvoiceID = i.InvoiceID
    where i.InvoiceID in (
        SELECT DISTINCT InvoiceID
            from InvoiceLineItems
                where InvoiceSequence > 1
        );
*/

/* 6.6
-- 6.6
SELECT Sum(UnpaidInvoices.UnpaidInvoiceTotal)
    from (
        SELECT v.VendorID, max(InvoiceTotal) UnpaidInvoiceTotal
            from Invoices i
            join Vendors v
                on v.VendorID = i.VendorID
            where InvoiceTotal - (PaymentTotal + CreditTotal) > 0
            group by v.VendorID
    ) UnpaidInvoices;
*/

/* 6.7
-- 6.7
SELECT v.VendorName, v.VendorCity, v.VendorState
    from Vendors v
    join (
        SELECT VendorCity, VendorState
            from Vendors v
            group by VendorState, VendorCity
            having Count(*) = 1
    ) VendorCityState
        on v.VendorState = VendorCityState.VendorState 
            and v.VendorCity = VendorCityState.VendorCity

*/

/* 6.8
-- 6.8
Select v.VendorName, i.InvoiceNumber, i.InvoiceDate, i.InvoiceTotal
    from Invoices i
    join Vendors v
        on v.VendorID = i.VendorID
    join 
    (
        SELECT v.VendorId, min(InvoiceDate) MinInvoiceDate
            from Invoices i
            join Vendors v
                on v.VendorID = i.VendorID
            group by v.VendorID
    ) d
        on i.VendorID = d.VendorID
    where i.InvoiceDate = d.MinInvoiceDate
    order by i.VendorID
*/

/* 6.9
-- 6.9
WITH UnpaidInvoices as (
    SELECT v.VendorID, max(InvoiceTotal) UnpaidInvoiceTotal
        from Invoices i
        join Vendors v
            on v.VendorID = i.VendorID
        where InvoiceTotal - (PaymentTotal + CreditTotal) > 0
        group by v.VendorID
)
SELECT Sum(UnpaidInvoiceTotal) 'Total Unpaid Invoices'
    from UnpaidInvoices;
*/