module StarTrack
  class Commands
    def self.help
      puts ""
      print "> star_track help   ".colorize(:green)
      puts "- pretty obvious, isn't it?"

      print "> star_track config ".colorize(:green)
      puts "- creates a new .star_track.yaml file at your user's root path (to be implemented)"

      print "> star_track hh:mm  ".colorize(:green)
      puts "- time tracks hh hours and mm minutes, ex: star_track 8:00"
      puts ""
    end

    def self.runner
      task_manager = StarTrack::TaskManager::Wunderlist.new
      time_tracker = StarTrack::TimeTracker::Freckle.new

      print "Task manager: ".colorize(:blue)
      puts "Wunderlist"

      print "Time tracker: ".colorize(:blue)
      puts "Freckle"
      puts ""

      puts "=> Loading today tasks...".colorize(:green)
      today_tasks = task_manager.today_tasks

      puts "==> Here is what you did today:".colorize(:green)
      today_tasks.each { |task| puts "- #{task}" }
      puts ""

      puts "=> Now creating entry on the time tracker...".colorize(:green)
      time_tracker.track(today_tasks)
      puts ""

      puts "==> Entry created successfully!".colorize(:green)
    end
  end
end
