module StarTrack
  class Commands
    def self.help
      puts ""
      print "> star_track help   ".colorize(:green)
      puts "- pretty obvious, isn't it?"

      print "> star_track hh:mm  ".colorize(:green)
      puts "- time tracks hh hours and mm minutes, ex: star_track 8:00"
      puts ""
    end

    def self.runner
      config = YAML.load_file("#{ENV['HOME']}/.star_track.yaml")

      task_manager_name = config["task_manager"]
      time_tracker_name = config["time_tracker"]

      ErrorHandler.raise_missing_config(:task_manager) unless task_manager_name
      ErrorHandler.raise_missing_config(:time_tracker) unless time_tracker_name

      task_manager = build_constant(TaskManager, task_manager_name).new
      time_tracker = build_constant(TimeTracker, time_tracker_name).new

      puts ""
      print "Task manager: ".colorize(:blue)
      puts task_manager_name.capitalize
      print "Time tracker: ".colorize(:blue)
      puts time_tracker_name.capitalize
      puts ""

      puts "=> Loading today tasks...".colorize(:green)
      today_tasks = task_manager.today_tasks

      puts "==> Here is what you did today:".colorize(:green)
      today_tasks.each { |task| puts "- #{task}" }
      puts ""

      puts "=> Now creating entry on the time tracker...".colorize(:green)
      time_tracker.track(today_tasks)
      puts "==> Entry created successfully!".colorize(:green)
      puts ""
    end

    def self.build_constant(namespace, name)
      class_name = name.split(/-|\s|_/).map(&:capitalize).join("")
      const_get "#{namespace}::#{class_name}"
    end
  end
end
