module StarTrack
  module TaskManager
    class Terminal
      attr_reader :io

      def today_tasks
        puts "Insert what you did today (separated by new lines):".colorize(:yellow)
        puts "Type END when you are done".colorize(:yellow)

        $/ = "END"
        tasks = STDIN.gets.chomp.split("\n")
        $/ = "\n"
        tasks
      end
    end
  end
end
