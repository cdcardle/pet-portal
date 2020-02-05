Models
  Attributes
    User
      email, password, first name, last name, street address one, street address two, state, zipcode, role
    Pet
      name, animal_type, breed, weight(pounds), age(months), color, gender
    Appointment
      date, time
    Doctor
      first name, last name
    Invoice
      total, date (from appointment)

  Associations
    User
      Admins
      Owners
        has_many pets
        has_many appointments, :through => pets
        has_many invoices, :through => pets
    Pets
      belongs to owner, class: :user
      has_many appointments
      has_many doctors, through: appointments
      has_many invoices
    Appointments
      belongs_to pet
      belongs_to doctor
      has_one invoice
    Doctor
      has_many appointments
      has_many patients, class: pets, through: :appointments
    Invoices
      belongs_to appointment
      belongs_to pet

Controllers
  Users
    Index - admin only
    New - visitors and admins
    Show - owner their own, admin everyone's
    Edit - owner their own, admin everyone's
    Destroy - admin only
  Pets
    Index - admin only
    New - admin only
    Show - owner their own, admin everyone's
    Edit - admin only
    Destroy - admin only
  Appointments
    Index - admin
    New - admin
    Show - user (theirs), admin (all)
    Edit - admin
    Destroy - admin
  Doctors
    Index - admin
    New - admin
    Show - admin
    Edit - admin
    Destroy - admin
  Invoices
    Index - admin
    New - admin
    Show - user (theirs), admin (all)
    Edit - admin
    Destroy - admin

<!-- Update navbar and left column for links -->

Views
  Layout
    Navbar
      Admin
      Owner
      Visitor
    Yield
    Footer
  Users
    Index
      List of each user with links to show/edit/delete
    New
      Form to create a new user
    Show
      Information for the user (pets, appointments, invoices)
    Edit
      Pre-filled form to edit user
  Pets
    Index
    New
    Show
    Edit
  Appointments
    Index
      Table - links for pets/doctors
    New
    Show
    Edit
  Doctors
    Index
    New
    Show
    Edit
  Invoices
    Index
    New
    Show
    Edit