module Concerns
  module Findable

    def find_by_name(name)
      # finds an instance in @@all by the name property of the song
      self.all.detect { |song| song.name == name }
    end

    def find_or_create_by_name(name)
      # returns (does not recreate) an existing song with the provided name if one exists in @@all
      # invokes .find_by_name instead of re-coding the same functionality
      # creates a song if an existing match is not found
      # invokes .create instead of re-coding the same functionality
      # detect {} returns the first for which block isn't false. If it can't find a true block it creates
      # a new song with self.create
      self.find_by_name(name) || self.create(name)
    end

  end
end
