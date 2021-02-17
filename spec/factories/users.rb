FactoryBot.define do
  factory :user do
    nickname              { 'hikaru' }
    email                 { 'hikaru@gmail.com' }
    password              { 'aaa111' }
    password_confirmation { password }
    last_name_kanji       { '小松' }
    first_name_kanji      { 'ひかる' }
    last_name_katakana    { 'コマツ' }
    first_name_katakana   { 'ヒカル' }
    birth_day             { '1999-01-01' }
  end
end
