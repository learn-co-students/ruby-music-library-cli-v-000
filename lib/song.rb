require 'pry'
class Song
    extend Concerns::Findable
    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.send("artist=", artist) if !artist.nil?
      self.send("genre=", genre) if !genre.nil?
    end

    def save
      @@all << self
    end

    def self.create(name)
      song = Song.new(name)
      song.save
      song
    end

    def self.all
      @@all
    end

    def self.destroy_all
      self.all.clear
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.songs << self if !genre.songs.include?(self)
    end

    def self.new_from_filename(filename)
      names = filename.split(" - ")
      artist = Artist.find_or_create_by_name(names[0])
      genre = Genre.find_or_create_by_name(names[2].chomp('.mp3'))
      Song.new(names[1], artist, genre)
    end

    def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
      song
    end

end
