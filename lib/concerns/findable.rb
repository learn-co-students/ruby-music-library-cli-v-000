module Concerns
  module Findable
    def find_by_name(name)
      all.find{|a| a.name == name}
    end

    def find_or_create_by_name(song_name)
      song_match = find_by_name(song_name)
      if song_match == nil
        song_match = create(song_name)
      end
      song_match
    end

  end
end
