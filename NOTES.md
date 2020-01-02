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
  Pets
  Appointments
  Doctors
  Invoices