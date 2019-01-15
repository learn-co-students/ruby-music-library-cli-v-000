require_relative './concerns/findable'

class Song

  extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre
  
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def artist=(artist)
    # binding.pry
    @artist = artist
    artist.add_song(self)
    end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self
  end
  
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.new_from_filename(filename)
    file = filename.split(/ - |(.mp3)/)
    song = self.new(file[1], Artist.new(file[0]), Genre.new(file[2]))
    # => ["Thundercat", "For Love I Come", "dance", ".mp3"]
  end


end