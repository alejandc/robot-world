require "rails_helper"
require "sidekiq/testing"
Sidekiq::Testing.fake!

describe RobotBuyerJob, type: :job do
  let!(:factory) { create(:factory) }
  let!(:model) { create(:model) }
  let!(:car_ready_to_sell) do
    create(:car, status_cd: Car.statuses["ready_to_sell"], assembly_line: nil)
  end
  let!(:car_finished) do
    create(:car, status_cd: Car.statuses["finished"], assembly_line: nil)
  end

  describe "robot buyer process" do
    context "defaul sidekiq behavior" do
      it "job in correct queue" do
        described_class.perform_async
        assert_equal "default", described_class.queue
      end

      it "goes into the jobs array for testing environment" do
        expect do
          described_class.perform_async
        end.to change(described_class.jobs, :size).by(1)

        described_class.new.perform
      end
    end

    context "buy process ok" do
      it "should buy just one car" do
        described_class.new.perform

        order = Order.last
        car_ready_to_sell.reload

        expect(Order.count).to eq(1)
        expect(order.car_id).to eq(car_ready_to_sell.id)
        expect(order.status_cd).to eq(Order.statuses["finished"])
        expect(car_ready_to_sell.status_cd).to eq(Car.statuses["sold"])
      end
    end

    context "buy process fail" do
      it "should log no cars in stock" do
        Car.where(status_cd: Car.statuses["ready_to_sell"]).delete_all
        expect(Rails.logger).to receive(:error).with("No cars available to buy...")

        described_class.new.perform

        expect(Order.count).to eq(0)
      end
    end
  end
end