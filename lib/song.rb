class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist = artist if artist
      self.genre = genre if genre
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def save
      @@all << self
    end

    def self.create(name)
      song = self.new(name)
      song.save
      song
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.add_song(self)
    end

    def self.new_from_filename(filename)
      file_data = filename.split(" - ")
      song = Song.new(file_data[1])
      song.artist_name = file_data[0]
      song.genre_name = file_data[2].gsub(".mp3","")
      song
    end

    def artist_name=(name)
      artist = Artist.find_or_create_by_name(name)
      self.artist = artist
      artist.add_song(self)
    end

    def genre_name=(name)
      genre = Genre.find_or_create_by_name(name)
      self.genre = genre
    end

    def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
      song
    end
end
