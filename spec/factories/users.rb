FactoryBot.define do
  factory :user do
    nickname              { 'naki' }
    email                 { Faker::Internet.free_email }
    password              { 'n11111' }
    password_confirmation { password }
    family_name           { '中薗' }
    first_name            { '樹' }
    family_name_kana      { 'ナカゾノ' }
    first_name_kana       { 'タツキ' }
    birth_day             { '1998-11-17' }
  end
end
