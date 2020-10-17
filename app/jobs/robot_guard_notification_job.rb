class RobotGuardNotificationJob
  include Sidekiq::Worker
  sidekiq_options queue: "default"

  def perform(component_id)
    component = Component.find_by(id: component_id)

    if component.present? && component.error
      message = "Compoment(#{component_id}) #{component.type} with error (Car #{component.car_id})"

      response = HTTParty.post(
        ENV["URL_ERROR_NOTIFICATION"],
        body: { "text" => message }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )

      logger.info response.to_s
    end
  end
end