FactoryBot.define do
  factory :appointment do
    datetime { "2019-01-06T16:30:00" }
    pet_id { 1 }
    doctor_id { 1 }
  end
end