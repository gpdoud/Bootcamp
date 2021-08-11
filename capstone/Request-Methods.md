# Additional methods in the Request Controller

This supplement details the additional controller methods requried in the RequestController.

It is good practive to define constant strings to represent the values for the request status. For example, to create the constant string for the status `NEW`, the definition would look like this:

You would do the same for the statuses of "REVIEW", "APPROVED", "REJECTED", and optionally "EDIT". Edit would be used when a request set to any status other than NEW is changed.

```
public static final String REQUEST_STATUS_NEW = "NEW";
```

## Set request to REVIEW status

```
[PUT] http://localhost:8080/requests/review
```

This method simply updates the request changing the `status` field to the value `REQUEST`. This is done using an HTTP `PUT` method and requires passing the entire request in the request body.


## Set request status to APPROVED or REJECTED

There should be one method to set the request status to APPROVED and a different method to set the status to REJECTED

```
[PUT] http://localhost:8080/requests/approve
[PUT] http://localhost:8080/requests/reject
```

## Get all requests in review status except the ones I own

```
[GET] http://localhost:8080/requests/reviews/5
```

This requires a change to the RequestRepository to define a method that will get all requests that have a status == 'REVIEW' and a userId != 5.

In the repository, you need to create a new method to read the requests that have a status set to "REVIEW" but exclude the request that have a userId equal to the one that is passed in the url. I will post the answer in the class Slack channel and you can look at it if you want.

It will return a collection of requests.