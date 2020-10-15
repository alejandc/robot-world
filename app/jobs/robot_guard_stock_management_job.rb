class RobotGuardStockManagementJob
  include Sidekiq::Worker
  sidekiq_options queue: "default"

  # Move cars from factory stock to sales/store stock
  def perform
    Warehouse.parked_cars.update_all(status_cd: Car.statuses["ready_to_sell"])
  end
end