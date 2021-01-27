FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example.com' }
    password              { 'test1234' }
    password_confirmation { 'test1234' }
    last_name             { '太郎' }
    first_name            { '手巣都' }
    last_name_kana        { 'タロウ' }
    first_name_kana       { 'テスト' }
    birth_id              { '1950-01-01' }
  end
end
