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

    // GET: api/Users/Auth/Username/Password
    [HttpGet("/api/Users/Auth/{username}/{password}")]
    public async Task<ActionResult<User>> GetAuthenticate(string username, string password) {
        var user = await _context.Users
            .SingleOrDefaultAsync(u => u.Username.ToLower().Equals(username.ToLower()) 
                && u.Password.Equals(password));
        if(user == null) {
            return NotFound();
        }
        return user;
    }


## Vendor

No additional apis required

## Product

No addtional apis required

## Request

### SetStatusReview(int RequestId)

This api simply sets the status of the request to REVIEW.

    // Set request to REVIEW or APPROVED based on Total <= 50
    [HttpPut("/api/Requests/Review/{id}")]
    public async Task<IActionResult> PutRequestReview(int id) {

        var request = await _context.Requests.FindAsync(id);
        
        if(request == null) {
            return NotFound();
        }
        #region If statement using Request.Total
        if(request.Total <= 50) {
            request.Status = "APPROVED";
        }  else {
            request.Status = "REVIEW";
        }
        #endregion
        await _context.SaveChangesAsync();
        // body code goes here
        return NoContent();
    }

### SetStatusApproved(int RequestId)

This api simply sets the status of the request to APPROVED.

    // Set request to APPROVED
    [HttpPut("/api/Requests/Approved/{id}")]
    public async Task<IActionResult> PutRequestApproved(int id) {

        var request = await _context.Requests.FindAsync(id);

        if(request == null) {
            return NotFound();
        }

        #region Set Request.Status to APPROVED
        request.Status = "APPROVED";
        #endregion

        await _context.SaveChangesAsync();

        return NoContent();
    }


### SetStatusRejected(int RequestId)

This api simply sets the status of the request to REJECTED.

    // Set request to REJECTED
    [HttpPut("/api/Requests/Rejected/{id}")]
    public async Task<IActionResult> PutRequestRejected(int id, Request request) {

        //var request = await _context.Requests.FindAsync(id);

        if(request == null) {
            return NotFound();
        }

        #region Set Request.Status to REJECTED
        request.Status = "REJECTED";
        #endregion

        _context.Entry(request).State = EntityState.Modified;
        await _context.SaveChangesAsync();

        return NoContent();
    }


### GetRequestsForReview

This api retrieves all the requests where status is REVIEW except those of the logged in user (users cannot review their own request)

    // GET: api/Requests/Review
    [HttpGet("/api/Requests/Review")]
    public async Task<ActionResult<IEnumerable<Request>>> GetRequestsForReview()
    {
        return await _context.Requests.Where(r => r.Status == "REVIEW").ToListAsync();
    }

## RequestLine

### RecalcRequestTotal(int RequestId)

This api recalculates the total for the request by iterating through the request lines, multiplying the quantity times the price, then summing up and updating the request with the total. This is called every time a request line is added, updated, or deleted.

    // Recalculate the total in the Request
    private bool RecalculateRequestTotal(int requestId) {
        var request = _context.Requests
                            .SingleOrDefault(r => r.Id == requestId);
        if(request == null) {
            return false;
        }

        request.Total = _context.RequestLines
                            .Include(l => l.Product)
                            .Where(l => l.RequestId == requestId)
                            .Sum(l => l.Quantity * l.Product.Price);
        if(request.Status == "REVIEW")
        request.Status = "REVISED";

        _context.SaveChanges();
        return true;

    }

This is the ADD method for the request line. It shows the call to 
the `RecalculateRequestTotal()` passing in the request id to be recalculated.

    // POST: api/RequestLines
    [HttpPost]
    public async Task<ActionResult<RequestLine>> PostRequestLine(RequestLine requestLine)
    {
        _context.RequestLines.Add(requestLine);
        await _context.SaveChangesAsync();

        if(!RecalculateRequestTotal(requestLine.RequestId)) {

        }

        return CreatedAtAction("GetRequestLine", new { id = requestLine.Id }, requestLine);
    }
