FactoryBot.define do
  factory :pet, class: "Pet" do
    name { "Casey" }
    animal_type { "Dog" }
    breed { "German Shepherd Dog" }
    gender { "Female" }
    color { "Black and Tan" }
    weight { 50 }
    age { 7 }
    user_id { 1 }
  end

  factory :spot, class: "Pet" do
    name { "Spot" }
    animal_type { "Dog" }
    breed { "Beagle" }
    gender { "Male" }
    color { "Brown and White" }
    weight { 35 }
    age { 8 }
  end
end