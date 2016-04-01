module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect{|x| x.name == name}
    end

    def find_or_create_by_name(name)
      self.all.detect{|x| x.name == name} || self.create(name)
    end
  end

  module Parse
    def parse_file_name(file_name)
      file_arr = name.split("-")
      song_name = file_arr[1].strip
      artist_name = file_arr[0].strip
      genre_name = file_arr[2].gsub(".mp3"," ").strip

      return song_name, artist_name, genre_name
    end
  end
end