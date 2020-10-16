# == Schema Information
#
# Table name: cars
#
#  id               :bigint           not null, primary key
#  status_cd        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  assembly_line_id :bigint
#  model_id         :bigint
#
# Indexes
#
#  index_cars_on_assembly_line_id  (assembly_line_id)
#  index_cars_on_model_id          (model_id)
#  index_cars_on_status_cd         (status_cd)
#
require 'rails_helper'

RSpec.describe Car, type: :model do
  describe "Validations" do
    subject { build(:car) }

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

    it "is not valid with invalid status finished and assembly line assigned" do
      subject.status_cd = Car.statuses["finished"]
      subject.assembly_line_id = create(:assembly_line).id

      expect(subject).to_not be_valid
    end
  end
end
