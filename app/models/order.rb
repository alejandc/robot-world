# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  car_id     :bigint
#
# Indexes
#
#  index_orders_on_car_id  (car_id)
#
class Order < ApplicationRecord

  belongs_to :car

  validates :car_id, uniqueness: true
end
