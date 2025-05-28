FactoryBot.define do
  factory :user do
    transient do
      name_base_first { Faker::Japanese::Name.first_name }
      name_base_last { Faker::Japanese::Name.last_name }
    end
    nickname { Faker::Name.initials }
    first_name { name_base_first }
    first_name_kana { name_base_first.yomi }
    last_name { name_base_last }
    last_name_kana { name_base_last.yomi }
    email { Faker::Internet.email }
    password { generate_password }
    password_confirmation { password }
    birth_date { Faker::Date.birthday }
  end
end

def generate_password
  loop do
    pw = Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false)
    return pw if pw.match?(/[a-zA-Z]/) && pw.match?(/\d/)
  end
end
