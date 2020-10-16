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
require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "Validations" do
    subject { build(:order) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it { should validate_uniqueness_of(:car_id) }
  end
end
