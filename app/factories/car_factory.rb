class CarFactory

  # @param [Model] model for car
  # @param [AssemblyLine] assembly line stage
  # @param [Integer] status for car (Car.statuses)
  #
  # @return Car object
  def self.build(model, assembly_line, status)
    Car.new(
      model: model,
      assembly_line: (Car.statuses[:ready] === status) ? nil : assembly_line,
      status: status.to_sym
    )
  end
end
