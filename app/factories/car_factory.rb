class CarFactory

  # @param [Model] model for car
  # @param [AssemblyLine] assembly line stage
  # @param [Integer] status for car (Car.statuses)
  #
  # @return Car object
  def self.build(model, assembly_line, status)
    Car.new(
      model: model,
      assembly_line: (Car.statuses[:in_process] === status) ? assembly_line : nil,
      status_cd: status
    )
  end
end
