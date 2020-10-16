class RobotChangeRequestJob
  include Sidekiq::Worker
  sidekiq_options queue: "change_request"

  # Move cars from factory stock to sales/store stock
  def perform(order_id, model_id)
    order = Order.find_by(id: order_id)

    if order.present?
      model = Model.find(model_id)
      #PENDING TO FINISH...
    end
  end
end