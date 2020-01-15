FactoryBot.define do
  factory :invoice, class: "Invoice" do
    cents { 13719 }
    appointment_id { 1 }
  end
end