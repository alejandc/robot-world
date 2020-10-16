# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  status_cd  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  car_id     :bigint
#
# Indexes
#
#  index_orders_on_car_id  (car_id)
#
FactoryBot.define do
  factory :order do
    car { create(:car) }
    status_cd { Order.statuses["finished"] }
  end
end
