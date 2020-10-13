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
require 'rails_helper'

RSpec.describe Component, type: :model do
  describe "Validations" do
    subject { build(:component) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    [:type_cd].each do |selector|
      it { should validate_presence_of(selector) }

      it "is not valid without #{selector}" do
        subject.send("#{selector}=", nil)
        expect(subject).to_not be_valid
      end
    end
  end
end
