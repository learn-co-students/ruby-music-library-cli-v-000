#song class definition
require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !self.genre.songs.any? {|song| song == self}
      self.genre.songs << self
    end
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name

    #If artist argument given, then call Song#artist=
    if artist != nil
      self.artist = artist
    end

    #If genre argument given, then call Song#genre=
    if genre != nil
      self.genre = genre
    end
  end

#CLASS METHODS
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    object = self.new(name)
    object.save
    object
  end

  # def self.find_by_name(name)
  #   @@all.find do |song|
  #     song.name == name
  #   end
  # end

  # def self.find_or_create_by_name(name)
  #   song = self.find_by_name(name)
  #   if song == nil
  #     song = self.create(name)
  #   end
  #   song
  # end

  def self.new_from_filename(filename)
    file_array = filename.split(/.mp3| - /)
        #Filename format is as follows: [artist - song - genre].mp3
        artist_name = file_array[0]
        song_name = file_array[1]
        genre_name = file_array[2]

        song = Song.find_or_create_by_name(song_name)
        song.artist = Artist.find_or_create_by_name(artist_name)
        song.genre = Genre.find_or_create_by_name(genre_name)
        song
  end

  def self.create_from_filename(name)
    Song.new_from_filename(name)
  end

  



#INSTANCE METHODS

  def save
    @@all << self
  end

end
