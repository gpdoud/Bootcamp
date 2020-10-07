# PRS API Specs

| Controller        | Method        | HTTP      | API                                       |
| ---               | ---           | ---       | ---                                       |
| Users             | Login         | GET       | /api/users/{username}/{password}          |
|                   | GetAll        | GET       | /api/users                                |
|                   | GetByPK       | GET       | /api/users/{id}                           |
|                   | Insert        | POST      | /api/users                                |
|                   | Update        | PUT       | /api/users/{id}                           |
|                   | Delete        | DELETE    | /api/users/{id}                           |
| Vendors           | GetAll        | GET       | /api/vendors                              |
|                   | GetByPK       | GET       | /api/vendors/{id}                         |
|                   | Insert        | POST      | /api/vendors                              |
|                   | Update        | PUT       | /api/vendors/{id}                         |
|                   | Delete        | DELETE    | /api/vendors/{id}                         |
| Products          | GetAll        | GET       | /api/products                             |
|                   | GetByPK       | GET       | /api/products/{id}                        |
|                   | Insert        | POST      | /api/products                             |
|                   | Update        | PUT       | /api/products/{id}                        |
|                   | Delete        | DELETE    | /api/products/{id}                        |
| Requests          | GetAll        | GET       | /api/requests                             |
|                   | GetByPK       | GET       | /api/requests/{id}                        |
|                   | Insert        | POST      | /api/requests                             |
|                   | Update        | PUT       | /api/requests/{id}                        |
|                   | Delete        | DELETE    | /api/requests/{id}                        |
|                   | GetRequests   | GET       | /api/requests/reviews                     |
|                   | SetRequests   | POST      | /api/requests/review                      |
|                   | SetApproved   | POST      | /api/requests/approve                     |
|                   | SetRejected   | POST      | /api/requests/reject                      |
| Lines             | GetByPk       | GET       | /api/lines/{id}                           |
|                   | Insert        | POST      | /api/lines/{reqid}                        |
|                   | Update        | PUT       | /api/lines/{id}                           |
|                   | Delete        | DELETE    | /api/lines/{id}                           |