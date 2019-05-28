require 'pry'

class Song 
  attr_accessor :name, :genre  
  attr_reader :artist
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre
    if artist != nil
    self.artist = artist
  end
    if genre != nil
      self.genre = genre 
  end
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    self.new(name).tap { |s| s.save }
    #new_instance = self.new(name)
    #new_instance.save
    #new_instance
  end
  
  def save
  @@all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
    
  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end
    
  def self.find_or_create_by_name(song_name)
  if self.find_by_name(song_name) 
    @@all.detect {|song| song.name == song_name}
  else 
    self.create(song_name)
  end
end

  def self.new_from_filename(some_filename)
    artist = Artist.find_or_create_by_name(some_filename.split(" - ")[0])
    genre = Genre.find_or_create_by_name(some_filename.split(" - ")[2].gsub!(".mp3", ""))
    self.new(some_filename.split(" - ")[1], artist, genre)
  end
  
  def self.create_from_filename(some_filename)
    self.new_from_filename(some_filename).save
  end
end