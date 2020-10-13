# == Schema Information
#
# Table name: factories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Factory < ApplicationRecord

  has_many :assembly_lines

  validates :name, presence: true
end
