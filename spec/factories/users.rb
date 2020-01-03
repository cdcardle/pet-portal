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
    role { 0 }
  end

  factory :admin, class: "User" do
    email { "admin_example@yahoo.com" }
    password { "adminpassword" }
    first_name { "Admin" }
    last_name { "Smith" }
    first_street_address { "1234 Example Dr." }
    city { "Exampletown" }
    state { "Example" }
    zipcode { 12345 }
    role { 1 }
  end
end