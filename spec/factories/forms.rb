FactoryBot.define do
  factory :form do
    postal_code           { '123-4567' }
    prefecture_id         { 2 }
    municipality          { '横浜市緑区' }
    address               { '青山1-1-1' }
    building_name         { 'グランハイツ青山' }
    phone_nu              { '01112345679' }
    token                 { 'tok_abcdefghijk000000000000000000' }
  end
end
