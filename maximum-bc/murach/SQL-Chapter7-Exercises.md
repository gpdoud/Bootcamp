# Chapter 7 Exercises - Answers

/* 7.1
-- 7.1
select * 
    into VendorsCopy
    from Vendors;

select * 
    into InvoicesCopy
    from Invoices;
*/

/* 7.2
-- 7.2
insert InvoicesCopy
    (VendorID, InvoiceTotal, TermsID, InvoiceNumber, PaymentTotal, InvoiceDueDate, InvoiceDate, CreditTotal, PaymentDate)
    VALUES
    (32, 434.58, 2, 'AX-014-027', 0, '2020-05-08', '2020-04-21', 0, null);
*/

/* 7.3
-- 7.3
Insert into vendorscopy
    (vendorname, vendoraddress1, vendorcity, vendorstate, vendorzipcode, vendorphone, 
        vendorcontactlname, vendorcontactfname, defaultTermsId, defaultAccountNo)
    Select vendorname, vendoraddress1, vendorcity, vendorstate, vendorzipcode, vendorphone, 
        vendorcontactlname, vendorcontactfname, defaultTermsId, defaultAccountNo from vendors
    where vendorstate != 'CA'
*/

/* 7.4
-- 7.4
update VendorsCopy SET
    DefaultAccountNo = 403
    where DefaultAccountNo = 400;
*/

/* 7.5
-- 7.5
UPDATE dbo.InvoicesCopy Set
    PaymentDate = GETDATE(),
    PaymentTotal = InvoiceTotal - (PaymentTotal + CreditTotal)
    where InvoiceTotal - (PaymentTotal + CreditTotal) > 0 
*/

/* 7.6
-- 7.6
UPDATE InvoicesCopy SET
    TermsID = 2
    where invoiceid in (
        select invoiceid
            from InvoicesCopy i
            join VendorsCopy v
                on v.vendorid = i.vendorid
            where v.defaultTermsId = 2
    ); 
*/

/* 7.7
-- 7.7
UPDATE InvoicesCopy SET
    TermsID = 2
        from InvoicesCopy i
        join VendorsCopy v
            on v.vendorId = i.vendorid
        where v.defaultTermsId = 2; 
*/

/* 7.8
-- 7.8
DELETE VendorsCopy
    where vendorState = 'MN'; 
*/

/* 7.9
-- 7.9
Delete VendorsCopy
    where vendorState in (
        Select Distinct VendorState
            from VendorsCopy v
            left join InvoicesCopy i
                on i.VendorID = v.VendorID
            where i.VendorID is null
    ) 
*/