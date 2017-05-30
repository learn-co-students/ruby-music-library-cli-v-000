#require 'pry'

class Song
  extend Concerns::Findable # to add all findable methods as class methods
  extend  Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name

    if artist!=nil
      self.artist=artist
    end

    if genre!=nil
      self.genre=genre
    end

    @songs = []
  end

  def self.all
    @@all
  end

  def self.create(name, artist = nil, genre=nil)
   song = Song.new(name, artist, genre)
   song.save
   song
 end

 def artist=(name)
   @artist = name
   artist.add_song(self)
 end

 def genre=(genre)
  @genre = genre
  if !self.genre.songs.include?(self)
    self.genre.songs << self
  end
end

def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    title = song_info[1]
    artist_name = song_info[0]
    genre_name = song_info[2].split(".")[0]
    song = Song.find_or_create_by_name(title)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

end
