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
FactoryBot.define do
  factory :car do
    status_cd { 0 }
    assembly_line { nil }
    model { create(:model) }
  end
end
