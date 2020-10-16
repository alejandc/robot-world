# == Schema Information
#
# Table name: change_orders
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  model_id     :bigint
#  new_order_id :integer
#  order_id     :bigint
#
# Indexes
#
#  index_change_orders_on_model_id  (model_id)
#  index_change_orders_on_order_id  (order_id)
#
class ChangeOrder < ApplicationRecord

  belongs_to :model
  belongs_to :order
  belongs_to :new_order, class_name: "Order", foreign_key: :new_order_id

end
