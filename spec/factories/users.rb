FactoryBot.define do
  factory :user do
    id                    { '' }
    nickname              { 'さと太郎' }
    email                 { Faker::Internet.free_email }
    password              { 'sato1111' }
    password_confirmation { 'sato1111' }
    family_name           { '佐藤' }
    last_name             { '太郎' }
    j_family_name         { 'サトウ' }
    j_last_name           { 'タロウ' }
    birthday              { '2000-01-01' }
  end
end
