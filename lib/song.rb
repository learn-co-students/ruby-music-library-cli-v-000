class Song
  attr_accessor :name, :artist, :genre
  @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist = artist if artist
      self.genre = genre if genre
      #  binding.pry
    end

    def save
      @@all << self
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def self.create(name)
      new_song = self.new(name)
      @@all << new_song
      new_song
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.add_song(self)
    end

    def self.find_by_name(name)
      @@all.detect {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
      if song = @@all.detect {|song|song.name == name}
          song
      else
          song = self.new(name)
          # binding.pry
          new_song = song.save
          new_song.uniq
        end
    end

end
