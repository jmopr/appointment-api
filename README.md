RESTful Appointment API
Application developed with Ruby on Rails that exposes appointment resources with 4 methods that handle CRUD operations. 

The database is first filled with data from a csv file. The API exposes the following four methods for operations on the appointment resources:
- Create
- Update
- Delete
- List (accepts optional appointment start/end time or first/last name parameters to filter data)

When creating or updating a resource, it validates if the start and end times are in the future and do not overlap an existing
appointment on the same day. All operations render in JSON along with the appropriate HTTP status codes.

If you have any questions, contact the maintainer of this project:

Juan Ortiz (jmopr83@gmail.com)
