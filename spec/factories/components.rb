# == Schema Information
#
# Table name: components
#
#  id         :bigint           not null, primary key
#  error      :boolean
#  type_cd    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  car_id     :bigint
#
# Indexes
#
#  index_components_on_car_id  (car_id)
#
FactoryBot.define do
  factory :component do
    error { false }
    type_cd { Component.types.values.sample }
    car { create(:car) }
  end
end
