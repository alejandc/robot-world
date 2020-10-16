require "rails_helper"
require "sidekiq/testing"
Sidekiq::Testing.fake!

describe RobotBuilderJob, type: :job do
  let!(:factory) { create(:factory) }
  let!(:models) { create_list(:model, 5) }
  let!(:assembly_lines) { create_list(:assembly_line, 2, factory_id: factory.id) }

  describe "robot builder process" do
    context "defaul sidekiq behavior" do
      it "job in correct queue" do
        described_class.perform_async
        assert_equal "builder", described_class.queue
      end

      it "goes into the jobs array for testing environment" do
        expect do
          described_class.perform_async
        end.to change(described_class.jobs, :size).by(1)

        described_class.new.perform
      end
    end

    context "car builder" do
      it "should exists cars" do
        described_class.new.perform
        expect(Car.count).to be > 0
      end
    end
  end
end