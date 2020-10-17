require "rails_helper"
require "sidekiq/testing"
Sidekiq::Testing.fake!

describe RobotGuardNotificationJob, type: :job do
  before(:all) do
    ENV['URL_ERROR_NOTIFICATION'] = 'descending'
    ENV['ERROR_NOTIFICATIONS'] = 'descending'
  end
  let!(:component_with_error) { create(:component, error: true) }
  let!(:component_without_error) { create(:component, error: false) }

  describe "robot guard notification" do
    it "send notification" do
      expect(HTTParty).to receive(:post)
      described_class.new.perform(component_with_error.id)
    end

    it "not send notification" do
      expect(HTTParty).not_to receive(:post)
      described_class.new.perform(component_without_error.id)
    end
  end
end