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
    array = name.gsub(" - ", ',').split(',')
    #binding.pry
    song = Song.create(array[1].strip)
    song.artist = Artist.find_or_create_by_name(array[0].strip)
    song.genre = Genre.find_or_create_by_name(array[2].strip.slice(0, array[2].size-4))
    song
  end
  def self.create_from_filename(name)
    self.new_from_filename(name)
  end
end
#binding.pry
