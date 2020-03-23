# Answer to RequestRepository method

It is on line 10...

Here is the additional RequestRepository method you must define to get all requests in REVIEW status, but not any of the ones with the userId matching the id passed in on the url




Iterable<Request> getRequestByUserIdNot(Integer userId);