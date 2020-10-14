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
  validate :status_by_assembly_line

  as_enum :status, %w{in_process ready}, prefix: true


  def completed?
    self.status_ready?
  end

  def computer
    self.components.computer.extend(ComputerComponentDecorator)
  end

  private

    def status_by_assembly_line
      if !assembly_line_id.blank? && status_cd == self.klass.statuses["ready"]
        errors.add(:status_cd, "cannot be ready if it assigned to assembly line")
      end
    end
end
