# UML Use Case Diagram Explanation

**Actors:**
1. **Passenger**: The primary user who interacts with the system for booking.
2. **Admin**: The internal user who manages the system data (Schedules, Trains).

**Use Cases:**
- **Login**: Both actors authenticate themselves.
- **Search Trains**: Passenger finds trains between stations.
- **Book Ticket**: Passenger reserves a seat.
- **Cancel Ticket**: Passenger releases a reserved seat.
- **View Bookings**: Passenger checks history.
- **Manage Schedule**: Admin updates train timings and routes.

**Diagram Structure:**
- **System Boundary**: A rectangle containing all use cases.
- **Actors**: Stick figures outside the boundary.
- **Connections**: Lines (Associations) showing which actor performs which use case.
- **Dependencies**: Use cases like `Book Ticket` may have an `<<include>>` relationship with `Login`.
