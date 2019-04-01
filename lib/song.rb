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
    song = self.new(file[1], Artist.find_or_create_by_name(file[0]), Genre.find_or_create_by_name(file[2]))
    # => ["Thundercat", "For Love I Come", "dance", ".mp3"]
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    # => ["Thundercat", "For Love I Come", "dance", ".mp3"]
    song.save
  end

end