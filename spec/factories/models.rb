# == Schema Information
#
# Table name: models
#
#  id         :bigint           not null, primary key
#  cost_price :decimal(10, 2)
#  name       :string
#  price      :decimal(10, 2)
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :model do
    name { Faker::Name.unique.name }
    cost_price { Faker::Number.between(from: 100, to: 1000) }
    price { Faker::Number.between(from: 1000, to: 1500) }
    year { Faker::Number.between(from: 2000, to: 2020) }
  end
end
