FactoryBot.define do
  factory :appt_one, class: "Appointment" do
    datetime { "2019-01-06T16:30:00" }
  end

  factory :appt_two, class: "Appointment" do
    datetime { "2019-01-20T10:30:00" }
  end
end