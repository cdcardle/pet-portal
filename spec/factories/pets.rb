FactoryBot.define do
  factory :spot, class: "Pet" do
    name { "Spot" }
    animal_type { "dog" }
    breed { "Beagle" }
    weight { 35 }
    age { 8 }
    color { "brown and white" }
    gender { "male" }
  end

  factory :sassy, class: "Pet" do
    name { "Sassy" }
    animal_type { "cat" }
    breed { "Calico" }
    weight { 13 }
    age { 36 }
    color { "orange and brown" }
    gender { "female" }
  end
end