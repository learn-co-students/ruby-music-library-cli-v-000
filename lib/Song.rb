require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      @artist = artist
      artist.add_song(self)
    end
    if genre != nil
      @genre = genre
      genre.add_song(self)
    end
  end
  @@all = []
  def self.all
   @@all
  end
  def self.destroy_all
    @@all = []
  end
  def save
    @@all << self
  end
  def self.create(name)
  song = Song.new(name)
  song.save
  song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    genre.add_song(self) if !genre.songs.include?(self)
  end

  def self.new_from_filename(name)
    array = name.gsub(/-/, ',').split(',')
    song = Song.new(name: array[1])
    #binding.pry
    song.artist = Artist.new(array[0].strip)
    #binding.pry
  end
end
#binding.pry
