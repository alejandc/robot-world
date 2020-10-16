class RobotChangeOrderRequestJob
  include Sidekiq::Worker
  sidekiq_options queue: "change_request"

  # Move cars from factory stock to sales/store stock
  def perform(order_id, model_id)
    order = Order.find(order_id)

    # Find stock
    new_car = Salehouse.instance.cars_by_model(model_id).last

    # If we have stock to make the change
    if order.present? && new_car.present?
      # Mark car as sold
      mew_card.status_sold!
      # Mark original order as change request
      order.status_change_request!

      # Generate new order for new car model
      new_order = OrderFactory.build(car.id, Order.statuses["finished"])
      new_order.save!

      # Create change order to track the change
      change_order = ChangeOrderFactory.build(order.id, model_id, new_order.id)
      chane_order.save!
    else
      RobotChangeOrderRequestJob.perform_in(1.minutes, order_id, model_id)
    end
  end
end