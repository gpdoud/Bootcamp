# PRS Api Requirement

Each of the tables in PRS (User, Vendor, Product, Request, RequestLine) will be generated with EntityFramework support. This will create the five basic apis automatically:

1. List all
2. Get by PK
3. Insert
4. Update
5. Delete

There are additional apis required that must be coded by students

## User

### Authenticate or Login

This api requires passing in the username and password then searching for a user with those credentials. If found, the user instance is returned; otherwise null is returned

## Vendor

No additional apis required

## Product

No addtional apis required

## Request

### SetStatusReview(int RequestId)

This api simply sets the status of the request to REVIEW.

### SetStatusApproved(int RequestId)

This api simply sets the status of the request to APPROVED.

### SetStatusRejected(int RequestId)

This api simply sets the status of the request to REJECTED.

### GetRequestsForReview

This api retrieves all the requests where status is REVIEW except those of the logged in user (users cannot review their own request)

## RequestLine

### RecalcRequestTotal(int RequestId)

This api recalculates the total for the request by iterating through the request lines, multiplying the quantity times the price, then summing up and updating the request with the total. This is called every time a request line is added, updated, or deleted.