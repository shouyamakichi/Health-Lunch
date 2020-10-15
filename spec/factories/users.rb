FactoryBot.define do
  factory :user do
    email                 {"aaa@gmail.com"}
    password              {'taro11111' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
  end
end