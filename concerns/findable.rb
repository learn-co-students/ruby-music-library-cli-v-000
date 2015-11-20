require_relative "../lib/artist.rb"
require_relative "../lib/song.rb"
require_relative "../lib/genre.rb"

module Concerns

  module Findable

    def find_by_name(name)
      @@all.each do |a|
        if a.name == name
          return a
        end
      end
    end

    def find_or_create_by_name(name)
      exist = self.find_by_name(name)
      if exist == nil
        self.create
      end
    end
  end

end