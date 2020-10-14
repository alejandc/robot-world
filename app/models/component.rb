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
class Component < ApplicationRecord
  belongs_to :car

  validates :type_cd, presence: true

  as_enum :type, %w{wheels chasis laser computer engine seats}, prefix: true

  scope :with_error, -> { where(error: true) }
  scope :computer, -> { find_by(type_cd: self.klass.types["computer"]) }
end
