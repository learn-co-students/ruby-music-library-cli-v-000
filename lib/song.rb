require 'pry'

class Song 
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    # song.new.tap {|o| o.name = name}
    song = self.new(name)
    song.save
    song
  end
  
  def save
    self.class.all << self
  end
  
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist = artist
      artist=(artist)
    end
    if genre != nil
      self.genre = genre
      genre=(genre)
    end
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end
  
  def self.new_from_filename(f)
    a, s, g = f.split(" - ")
    genre = g.gsub(".mp3", "")
    song = self.new(s)
    song.artist = Artist.find_or_create_by_name(a) 
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end
  
  def self.create_from_filename(f)
    new_from_filename(f).save
  end
end