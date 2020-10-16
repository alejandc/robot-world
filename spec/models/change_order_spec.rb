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
require 'rails_helper'

RSpec.describe ChangeOrder, type: :model do
  describe "Validations" do
    subject { build(:change_order, model: nil, order: nil, new_order: nil) }

    it "is valid with valid attributes" do
      expect(subject).to_not be_valid
    end

    it "is valid with valid attributes" do
      subject.assign_attributes({
        model: create(:model),
        order: create(:order),
        new_order: create(:order)
      })
      expect(subject).to be_valid
    end
  end
end
