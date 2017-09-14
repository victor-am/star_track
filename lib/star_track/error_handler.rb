module StarTrack
  class ErrorHandler
    def self.raise(message)
      abort "[ERROR] #{message}".colorize(:red)
    end

    def self.raise_missing_config(config)
      raise("Missing #{config} configuration key on ~/.star_track.yaml")
    end
  end
end
