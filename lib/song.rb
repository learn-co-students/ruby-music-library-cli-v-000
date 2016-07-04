require 'pry'
class Song
  extend Concerns::Findable
@@all = []

  attr_accessor :artist, :name, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre 
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
    # binding.pry
# binding.pry 
  end

  def new_from_file_name
  end

  def create_from_file_name
  end

end