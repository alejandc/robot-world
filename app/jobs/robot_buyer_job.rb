class RobotBuyerJob
  include Sidekiq::Worker
  sidekiq_options queue: "default"

  # Buy cars
  def perform
    cars_to_buy = rand(1..10)
    cars = Car.status_ready_to_sells.limit(cars_to_buy)

    # Notify no cars to buy
    logger.error("No cars available to buy...") if cars.empty?

    # Create orders for cars
    cars.each do |car|
      Order.create!(
        car: car,
        status_cd: Order.statuses["finished"]
      )
      car.update_attribute(status_cd: Car.statuses["sold"])
    end
  end
end