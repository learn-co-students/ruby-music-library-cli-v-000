class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable
  @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist=(artist) if artist
      self.genre=(genre) if genre
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
      !genre.songs.include?(self) ? genre.songs << self : self
    end

    def self.new_from_filename(file)
      fixed = file.chomp(".mp3").split(" - ")
      song = Song.new(fixed[1])
      song.artist = Artist.find_or_create_by_name(fixed[0])
      song.genre = Genre.find_or_create_by_name(fixed[2])
      song
    end

    def self.create_from_filename(file)
      new_song = self.new_from_filename(file).save
    end
end
