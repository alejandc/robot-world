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
require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "Validations" do
    subject { build(:order) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    [:status_cd].each do |selector|
      it { should validate_presence_of(selector) }

      it "is not valid without #{selector}" do
        subject.send("#{selector}=", nil)
        expect(subject).to_not be_valid
      end
    end
  end
end
