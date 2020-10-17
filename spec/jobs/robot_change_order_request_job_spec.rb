require "rails_helper"
require "sidekiq/testing"
Sidekiq::Testing.fake!

describe RobotChangeOrderRequestJob, type: :job do
  let!(:model_1) { create(:model) }
  let!(:model_2) { create(:model) }
  let!(:car_ready_to_sell) { create(:car, model: model_1, status_cd: Car.statuses[:ready_to_sell])}
  let!(:car_sold) { create(:car, model: model_2, status_cd: Car.statuses[:sold])}
  let!(:order) { create(:order, car: car_sold) }

  describe "robot change request process" do
    it "generate change request and change order" do
      described_class.new.perform(order.id, model_1.id)
      order.reload
      car_sold.reload
      car_ready_to_sell.reload

      expect(ChangeOrder.count).to eq(1)
      expect(Order.count).to eq(2)
      expect(order.status_cd).to eq(Order.statuses["change_request"])

      expect(car_sold.status_cd).to eq(Car.statuses["ready_to_sell"])
      expect(car_ready_to_sell.status_cd).to eq(Car.statuses["sold"])
    end
  end
end