class ComponentFactory

  # @param [String] component_type
  # @param [Integer] car_reference
  # @param [Bool] with_error
  #
  # @return Component object
  def self.build(component_type, car_reference, with_error)
    Component.new(
      type: component_type.to_sym,
      car_id: car_reference,
      error: with_error,
    )
  end
end
