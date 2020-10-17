require "rails_helper"
require "sidekiq/testing"
Sidekiq::Testing.fake!

describe RobotGuardStockManagementJob, type: :job do
  let!(:car) { create(:car, status_cd: Car.statuses["finished"]) }
  let!(:components) {
    car_components = []

    Component.types.values.each do
      car_components.push(
        create(:component, error: false, car: car)
      )
    end

    car_components
  }

  describe "robot guard stock management process" do
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

    context "with stock" do
      it "should move stock from factory stock to store stock" do
        expect(car.status_cd).to eq(Car.statuses["finished"])
        expect(Warehouse.instance.parked_cars.count).to eq(1)
        expect(Salehouse.instance.parked_cars.count).to eq(0)

        described_class.new.perform
        car.reload

        expect(car.status_cd).to eq(Car.statuses["ready_to_sell"])
        expect(Warehouse.instance.parked_cars.count).to eq(0)
        expect(Salehouse.instance.parked_cars.count).to eq(1)
      end
    end
  end
end