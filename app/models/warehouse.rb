class Warehouse
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def parked_cars
    Car.includes(:model, :components).status_finisheds
  end

  def parked_cars_by_model
    parked_cars.group_by {|car| car.model.name}
  end
end