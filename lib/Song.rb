require 'pry'

class Song
  attr_accessor :artist, :name, :genre, :songs, :title
  extend Concerns::Findable

    @@all = []
    @@count = 0

    def initialize(name, artist=nil, genre=nil)
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
      self
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
      genre.songs << self unless genre.songs.include?(self)
    end

    def self.new_from_filename(filename)
      new_song = filename.split("-") #splits the string at the hyphen
      name = new_song[1].strip #returns the second element in the array at index 1 = song title
      song = Song.new(name) #new instance of a song with ne song title as name
      song.artist = Artist.find_or_create_by_name(new_song[0].strip) #pushes artist to new instnace of and Artist in new instance of Song
      song.genre = Genre.find_or_create_by_name(new_song[2].split(".")[0].strip) #splits element at period, returns first element at index 0
      song #returns new song
    end

    def self.create_from_filename(filename)
      new_song = filename.split(" - ")
      name = new_song[1].strip
      song = Song.new(name)
      song.artist = Artist.find_or_create_by_name(new_song[0].strip)
      song.genre = Genre.find_or_create_by_name(new_song[2].split(".")[0].strip)
      song.save #this method has to be saved
    end

  end
