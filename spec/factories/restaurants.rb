  FactoryBot.define do
    factory :restaurant do
      name { 'test' }
      city  { 'Random' }
      address { '123 RUE ' }
      lon { 2.305783 }
      lat { 48.859301 }
    end
  end
