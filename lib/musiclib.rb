#SongArtist module
module SongArtists
  module InstanceMethods
    def save
      self.class.all<<self
    end
  end

  module ClassMethods

    def create(name)
      new_instance = self.new(name)
      new_instance.save
      self.all[0]
    end

    def destroy_all
      self.all.clear
    end
  end
end

#findable module

#song class
class Song
  attr_accessor :name
  include SongArtists::InstanceMethods
  extend SongArtists::ClassMethods

  @@all = []

  def initialize(name, artist = nil, genre = nil)

    @name = name
    if genre != nil
      self.genre = genre
    end
    if artist != nil
      self.artist = artist
    end
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def artist
    if @artist!=nil
      @artist
    else
      return nil
    end
  end

  def genre=(genre)
    @genre = genre
    if !@genre.songs.include?(self)
      @genre.songs<<self
    end
  end

  def genre
    @genre
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      new_song = self.create(name)
    else
      return self.find_by_name(name)
    end
  end

end

#artist class
class Artist
  attr_accessor :name, :songs
  include SongArtists::InstanceMethods
  extend SongArtists::ClassMethods

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def self.all
    @@all
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end

  def genres
    genre_array = self.songs.collect {|song| song.genre}
    genre_array.uniq
  end
end

#Genre class
class Genre
  attr_accessor :name, :songs
  include SongArtists::InstanceMethods
  extend SongArtists::ClassMethods

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  # def songs=(song)
  #   if !@songs.include?(song)
  #     @songs<<song
  #   end
  # end

  def artists
    artists_array = self.songs.collect{|song|song.artist}
    artists_array.uniq
  end
end
