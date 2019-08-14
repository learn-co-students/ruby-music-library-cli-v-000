module Concerns::Findable

    def find_by_name(name)
      return_song = nil
      self.all.each do |song|
        if song.name == name
          return_song = song
        end
      end
      return_song
    end

    def find_or_create_by_name(name)
      test_song = self.find_by_name(name)
      if test_song != nil
        test_song
      else
        return_song = self.create(name)
      end
    end

end
