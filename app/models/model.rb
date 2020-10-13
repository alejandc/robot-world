# == Schema Information
#
# Table name: models
#
#  id         :bigint           not null, primary key
#  cost_price :decimal(10, 2)
#  name       :string
#  price      :decimal(10, 2)
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Model < ApplicationRecord

  has_many :cars

  validates :cost_price, :price, :name, :year, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
