FactoryBot.define do
  factory :order_shipping_address do
    postal_code { "060-8611" }
    prefecture_id { 2 }
    city { "札幌市中央区" }
    street_address { "北1条西2丁目" }
    building_name { "札幌市役所庁舎" }
    phone_number { "0112112111" }
  end
end
