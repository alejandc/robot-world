# == Schema Information
#
# Table name: factories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :factory do
    name { Faker::Name.unique.name }
  end
end
