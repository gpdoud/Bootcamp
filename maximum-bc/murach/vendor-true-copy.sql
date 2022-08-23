Set IDENTITY_INSERT VendorsTrueCopy on;

Insert into VendorsTrueCopy (VendorId, VendorName, VendorAddress1, VendorAddress2, 
            VendorCity, VendorState, VendorZipCode, VendorPHone, 
            VendorContACTLName, VendorContactFName,
            DefaultTermsId, DefaultAccountNo)
        Select VendorId, VendorName, VendorAddress1, VendorAddress2, 
            VendorCity, VendorState, VendorZipCode, VendorPHone, 
            VendorContACTLName, VendorContactFName,
            DefaultTermsId, DefaultAccountNo
            from vendors;

Set IDENTITY_INSERT VendorsTrueCopy off;

Select * from vendorsTrueCopy;