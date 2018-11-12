require 'pry'

class Song 
  attr_accessor :name, :songs
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist 
    self.genre = genre if genre
    @@all << self
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self) 
  end
  
  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
    end
  end
  
  def self.all 
    @@all.uniq
  end 

  def self.destroy_all 
    @@all.clear 
  end 
  
  def save 
    @@all << self
  end 
  
  def self.create(song)
    self.new(song).tap {|song| song.save}
  end
  
  def self.find_by_name(name) 
    all.find{ |song| song.name == name }
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end
  
  def self.new_from_filename(file)
    new_file = file.split(" - ")
      artist = new_file[0]
      name = new_file[1]
      genre = new_file[2].gsub(".mp3","")
    new_artist = find_or_create_by_name(artist)
    new_song = Song.new(name, new_artist)
    binding.pry
  end 

end 