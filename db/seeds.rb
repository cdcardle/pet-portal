User.create(email: "admin_example@yahoo.com", password: "adminpassword", role: 1)
User.create(email: "tom_example@yahoo.com", password: "tompassword", first_name: "Tom", last_name: "Johnson", first_street_address: "1234 Example Rd.", second_street_address: "Apt 201", city: "Exampletown", state: "Example", zipcode: 12345, role: 0)
User.create(email: "bob_example@yahoo.com", password: "bobpassword", first_name: "Bob", last_name: "Smith", first_street_address: "9876 Example Rd.", city: "Exampletown", state: "Example", zipcode: 12345, role: 0)

Pet.create(name: "Casey", animal_type: "dog", breed: "German Shepherd Dog", gender: "female", color: "Black and Tan", weight: 50, age: 7, user_id: 2)
Pet.create(name: "Zelda", animal_type: "dog", breed: "Golden Retriever", gender: "female", color: "Golden Brown and White", weight: 75, age: 26, user_id: 2)
Pet.create(name: "George", animal_type: "cat", breed: "Calico", gender: "male", color: "Orange and Tan", weight: 13, age: 43, user_id: 3)

Doctor.create(first_name: "Kristen", last_name: "Wilson")

Appointment.create(datetime: "2020-01-20T10:30:00", pet_id: 1, doctor_id: 1)
Appointment.create(datetime: "2020-01-30T10:30:00", pet_id: 1, doctor_id: 1)
Appointment.create(datetime: "2020-02-06T14:30:00", pet_id: 2, doctor_id: 1)
Appointment.create(datetime: "2020-02-20T16:30:00", pet_id: 3, doctor_id: 1)

Invoice.create(cents: 56713, appointment_id: 1)
Invoice.create(cents: 11789, appointment_id: 2)
Invoice.create(cents: 8613, appointment_id: 3)
Invoice.create(cents: 22256, appointment_id: 4)