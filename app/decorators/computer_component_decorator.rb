module ComputerComponentDecorator
  def components_with_error
    self.car&.components&.with_error || []
  end

  def any_error?
    components_with_error.count > 0
  end
end
