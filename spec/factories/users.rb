FactoryBot.define do
  factory :user do
    id                    {"1"}
    nickname              {"さと太郎"}
    email                 {"satotaro@test"}
    password              {"sato1111"}
    password_confirmation {"sato1111"}
    family_name            {"佐藤"}
    last_name             {"太郎"}
    j_family_name          {"サトウ"}
    j_last_name           {"タロウ"}
    birthday              {"2000-01-01"}
  end
end