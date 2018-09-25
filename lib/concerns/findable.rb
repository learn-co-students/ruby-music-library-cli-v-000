module Concerns
  module Findable
    def find_by_name(thing_name)
      # detect stops on the first thing it finds that matches the condition and returns that value
      self.all.detect do |thing|
        thing.name == thing_name
      end
    end

    def find_or_create_by_name(thing_name)
      if self.find_by_name(thing_name) == nil #if the song isn't in there
          self.create(thing_name)              #make a new song
      else self.find_by_name(thing_name) != nil #if the song is in there
        self.find_by_name(thing_name)            # find it and return it
      end
    end
  end

end
