class OrderFactory

  # @param [Integer] car_id car reference
  # @param [Integer] status for new order
  #
  # @return Order object
  def self.build(car_id, status)
    Order.new(
      car_id: car_id,
      status_cd: status
    )
  end
end
