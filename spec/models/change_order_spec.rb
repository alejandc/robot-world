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
require 'rails_helper'

RSpec.describe ChangeOrder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
