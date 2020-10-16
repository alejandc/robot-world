desc "Factory actions"
namespace :factory do
  desc "Start builder process for cars factory"
  task start: :environment do
    if Sidekiq::Queue.new("default").size == 0
      Component.delete_all
      Car.delete_all

      puts "Starting robot builder job"
      ((Time.now.end_of_day - Time.now) / 60).round.times do |index|
        RobotBuilderJob.perform_in(index.minutes)
      end
    else
      puts "....Robot builder already started..."
    end
  end

  desc "Execute robot guard stock management"
  task stock_management: :environment do
    RobotGuardStockManagementJob.perform_async
  end

  desc "Execute robot buyer"
  task stock_management: :environment do
    RobotGuardStockManagementJob.perform_async
  end
end
