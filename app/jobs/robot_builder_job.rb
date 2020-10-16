class RobotBuilderJob
  include Sidekiq::Worker
  sidekiq_options queue: "builder"

  def perform
    models = Model.all
    assembly_lines = AssemblyLine.all
    components_list = Component.types.keys

    10.times do |index|
      status = [Car.statuses["in_process"], Car.statuses["finished"]].sample

      car = CarFactory.build(
        models.sample.id,
        assembly_lines.sample.id,
        status
      )
      car.save!

      # Random index to set errors dynamically
      random_index = rand(8)
      components_list.each_with_index do |component, index|
        component = ComponentFactory.build(
          component,
          car.id,
          (index == random_index),
        )
        component.save!
      end
    end
  end
end