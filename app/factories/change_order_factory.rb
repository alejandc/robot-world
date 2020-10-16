class ChangeOrderFactory

  # @param [Integer] order_id original order reference
  # @param [Integer] model_id model reference to change
  # @param [Integer] new_order_id new order reference
  #
  # @return ChangeOrder object
  def self.build(order_id, model_id, new_order_id)
    ChangeOrder.new(
      order_id: order_id,
      new_order: new_order_id,
      model_id: model_id,
    )
  end
end
