require 'freckle'

module StarTrack
  module TimeTracker
    class Freckle
      attr_reader :client

      def initialize
        config = YAML.load_file("#{ENV['HOME']}/.star_track.yaml")["freckle"]

        @token      = config["token"]
        @project_id = config["project_id"].to_i

        @client = ::Freckle::Client.new(token: @token)
      end

      def track(tasks)
        params = {
          description: tasks.join(" - "),
          project_id:  @project_id,
          minutes:     billable_time,
          date:        Date.today.to_s,
        }

        client.create_entry(params)
      end

      private

      def billable_time
        validate_given_time!

        args          = ARGV[0].split(":")
        given_hours   = args[0].to_i
        given_minutes = args[1].to_i

        (given_hours * 60) + given_minutes
      end

      def validate_given_time!
        unless ARGV[0]
          abort "[ERROR] Missing billable time parameter!".colorize(:red)
        end
      end
    end
  end
end
