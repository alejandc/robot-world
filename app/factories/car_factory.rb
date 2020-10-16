class CarFactory

  # @param [Model] model for car
  # @param [AssemblyLine] assembly line stage
  # @param [Integer] status for car (Car.statuses)
  #
  # @return Car object
  def self.build(model_id, assembly_line_id, status)
    Car.new(
      model_id: model_id,
      assembly_line_id: (Car.statuses[:in_process] === status) ? assembly_line_id : nil,
      status_cd: status
    )
  end
end
