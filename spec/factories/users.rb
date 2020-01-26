FactoryBot.define do
  factory :user, class: "User" do
    email { "tom_example@yahoo.com" }
    password { "tompassword" }
    first_name { "Tom" }
    last_name { "Johnson" }
    first_street_address { "1234 Example Rd." }
    second_street_address { "Apt 201" }
    city { "Exampletown" }
    state { "Example" }
    zipcode { 12345 }
    role { "owner" }
  end

  factory :admin, class: "User" do
    email { "admin_email@yahoo.com" }
    password { "adminpassword" }
    first_name { "Admin" }
    last_name { "Smith" }
    first_street_address { "1234 Example Dr." }
    city { "Exampletown" }
    state { "Example" }
    zipcode { 12345 }
    role { "admin" }
  end

  factory :different_user, class: "User" do
    email { "bob_example@yahoo.com" }
    password { "bobpassword" }
    first_name { "Bob" }
    last_name { "Johnson" }
    first_street_address { "9876 Example Rd." }
    second_street_address { "Apt 3" }
    city { "Exampletown" }
    state { "Example" }
    zipcode { 12345 }
    role { "owner" }
  end
end