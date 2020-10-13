# == Schema Information
#
# Table name: assembly_lines
#
#  id             :bigint           not null, primary key
#  assembly_order :integer
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  factory_id     :bigint
#
# Indexes
#
#  index_assembly_lines_on_factory_id  (factory_id)
#
require 'rails_helper'

RSpec.describe AssemblyLine, type: :model do
  describe "Validations" do
    subject { build(:assembly_line) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    [:assembly_order, :name].each do |selector|
      it { should validate_presence_of(selector) }

      it "is not valid without #{selector}" do
        subject.send("#{selector}=", nil)
        expect(subject).to_not be_valid
      end
    end
  end
end
