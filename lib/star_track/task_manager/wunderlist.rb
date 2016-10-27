require 'wunderlist'

module StarTrack
  module TaskManager
    class Wunderlist
      attr_reader :client

      def initialize
        config = YAML.load_file("#{ENV['HOME']}/.star_track.yaml")["wunderlist"]

        @access_token = config["access_token"]
        @client_id    = config["client_id"]
        @list_name    = config["list_name"]

        @client = ::Wunderlist::API.new(
          access_token: @access_token,
          client_id:    @client_id
        )
      end

      def today_tasks
        @list ||= client.list(@list_name)

        @list.tasks(completed: true).select do |task|
          Date.parse(task.completed_at) == Date.today
        end.map(&:title)
      end
    end
  end
end
