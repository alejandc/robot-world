class ComponentObserver < ActiveRecord::Observer
  def after_create(component)
    if component.error
      RobotGuardNotificationJob.perform_async(component.id)
    end
  end
end