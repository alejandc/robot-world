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
FactoryBot.define do
  factory :assembly_line do
    assembly_order { 1 }
    name { Faker::Name.unique.name }
    factory_id { create(:factory).id }
  end
end
