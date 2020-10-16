class RobotGuardStockManagementJob
  include Sidekiq::Worker
  sidekiq_options queue: "default"

  # Move cars from factory stock to sales/store stock
  def perform
    valid_car_ids = []
    Warehouse.instance.parked_cars.each do |car|
      if !car.computer.any_error?
        valid_car_ids.push(car_id)
      end
    end

    Car.where(id: valid_car_ids).update_all(status_cd: Car.statuses["ready_to_sell"])
  end
end