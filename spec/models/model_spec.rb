# == Schema Information
#
# Table name: models
#
#  id         :bigint           not null, primary key
#  cost_price :decimal(10, 2)
#  name       :string
#  price      :decimal(10, 2)
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Model, type: :model do
  describe "Validations" do
    subject { build(:model) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it { should validate_uniqueness_of(:name).case_insensitive }

    [:cost_price, :price, :name, :year].each do |selector|
      it { should validate_presence_of(selector) }

      it "is not valid without #{selector}" do
        subject.send("#{selector}=", nil)
        expect(subject).to_not be_valid
      end
    end
  end
end
