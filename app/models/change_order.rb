# == Schema Information
#
# Table name: change_orders
#
#  id         :bigint           not null, primary key
#  status_cd  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  model_id   :bigint
#  order_id   :bigint
#
# Indexes
#
#  index_change_orders_on_model_id  (model_id)
#  index_change_orders_on_order_id  (order_id)
#
class ChangeOrder < ApplicationRecord

  belongs_to :model
  belongs_to :order

  as_enum :status, %w{pending finished}, prefix: true
end
