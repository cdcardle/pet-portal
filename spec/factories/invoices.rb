FactoryBot.define do
  factory :invoice_one, class: "Invoice" do
    total { 137 }
  end

  factory :invoice_two, class: "Invoice" do
    total { 597 }
  end
end