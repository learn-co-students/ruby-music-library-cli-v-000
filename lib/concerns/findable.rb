module Concerns

  module Findable

    #.find_by_name finds a song instance in @@all by the name property of the song

    def find_by_name(name)
      self.all.detect {|entry| entry.name == name}
    end

    # returns (does not recreate) an existing song with the provided name if one exists in @@all
    # invokes .find_by_name instead of re-coding the same functionality
    # creates a song if an existing match is not found
    # invokes .create instead of re-coding the same functionality

    def find_or_create_by_name(name)
      self.find_by_name(name)? self.find_by_name(name) : self.create(name)
    end

  end
end
