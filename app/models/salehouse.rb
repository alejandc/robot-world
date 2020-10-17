class Salehouse
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def parked_cars
    Car.includes(:model).status_ready_to_sells
  end

  def cars_by_model(model_id)
    parked_cars.by_model(model_id)
  end

  def cars_grouped_by_model
    parked_cars.group_by {|car| car.model.name}
  end
end