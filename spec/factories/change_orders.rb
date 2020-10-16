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
FactoryBot.define do
  factory :change_order do
    model { create(:model) }
    new_order { create(:order) }
    order { create(:order) }
  end
end
