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
class AssemblyLine < ApplicationRecord

  belongs_to :factory

  validates :assembly_order, :name, presence: true
end
