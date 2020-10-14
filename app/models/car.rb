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
#
class Car < ApplicationRecord

  belongs_to :model
  belongs_to :assembly_line, optional: true
  has_many :components, dependent: :destroy

  validates :status_cd, presence: true

  as_enum :status, %w{in_process ready}, prefix: true
end
