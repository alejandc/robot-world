# == Schema Information
#
# Table name: factories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Factory, type: :model do
  describe "Validations" do
    subject { build(:factory) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    [:name].each do |selector|
      it { should validate_presence_of(selector) }

      it "is not valid without #{selector}" do
        subject.send("#{selector}=", nil)
        expect(subject).to_not be_valid
      end
    end
  end
end
