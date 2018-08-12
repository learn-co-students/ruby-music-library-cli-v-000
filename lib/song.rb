require 'pry'

class Song #have one genre
  attr_accessor :name, :artist
  attr_reader :genre

  @@all= []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist != nil
    self.genre= genre if genre != nil
  end

   def artist= (artist)
     @artist = artist
     artist.add_song(self) 
   end

  def genre= (genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
      @@all << self
  end

  def self.create(name)
     song = self.new(name)
     song.save
     song
   end
  
   def self.find_by_name(name)
    all.detect{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

end
