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
class Car < ApplicationRecord

  belongs_to :model
  belongs_to :assembly_line, optional: true
  has_many :components, dependent: :destroy

  validates :status_cd, presence: true
  validate :status_by_assembly_line

  as_enum :status, %w{in_process finished ready_to_sell sold}, prefix: true



  def completed?
    self.status_finished?
  end

  def computer
    self.components.computer.extend(ComputerComponentDecorator)
  end

  private

    def status_by_assembly_line
      if !assembly_line_id.blank? && status_cd != self.class.statuses["in_process"]
        errors.add(:status_cd, "only can be in_process when has assembly line")
      end
    end
end
