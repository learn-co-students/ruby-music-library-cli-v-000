require 'pry'

module Concerns::Findable
    def find_by_name(song)
      self.all.detect {|each_song| return each_song if each_song.name == song}
    end

    def find_or_create_by_name(song)
      self.find_by_name(song) ? self.find_by_name(song) : self.create(song)
    end
end
