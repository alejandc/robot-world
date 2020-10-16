class RobotChangeRequestJob
  include Sidekiq::Worker
  sidekiq_options queue: "change_request"

  # Move cars from factory stock to sales/store stock
  def perform(order_id, model_id)
    order = Order.find(order_id)

    if order.status_change_request!
      change_order = ChangeOrder.create!(
        order_id: order_id,
        model_id: model_id,
        status_cd: ChangeOrder.statuses["pending"]
      )

      car = Salehouse.instance.cars_by_model(model_id).last
      if car.present?
        Order.create!(car: car)
        car.update_attribute(status_cd: Car.statuses["sold"])
        change_order.status_finished!
      end
    end
  end
end