Models

  Attributes
    User
      email, password, first name, last name, street address one, street address two, state, zipcode, role
    Pets
      name, animal-type, breed, weight, age, color
    Appointments
      date, time
    Doctor
      first name, last name
    Bill
      total, date

  Associations
    User
      Admins
      Owners
        has_many pets
        has_many appointments, :through => pets
        has_many bills, :through => pets
    Pets
      belongs to owner, class: :user
      has_many appointments
      has_many doctors, through: appointments
      has_many bills
    Appointments
      belongs_to pet
      belongs_to doctor
      has_one bill
    Doctor
      has_many appointments
      has_many patients, class: pets, through: :appointments
    Bill
      belongs_to appointment
      belongs_to owner