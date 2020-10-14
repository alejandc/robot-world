module ComputerComponentDecorator
  def any_error?
    car.components.with_error.count > 0
  end

  def components_with_error
    car.components.with_error
  end
end
