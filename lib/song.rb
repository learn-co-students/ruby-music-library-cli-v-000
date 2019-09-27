require "pry"
class Song 
  #attr_reader :artist
  attr_accessor :name, :artist
  #attr_writer :artist
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre 
    self.artist = @artist 
    self.genre = @genre
  end
  
  def name
    @name
  end
  
  def artist 
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    if artist != nil
      artist.add_song(self)
    end
  end
  
  def name=(name)
    @name = name
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
    @name = name
    self.new(name).save
    self
  end
  
  def genre 
    @genre
  end
  
  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
      else 
        self.find_by_name(name)
    end
  end
    
  def self.find_by_name(name)
    thing = []
    @@all.each do |item|
      if item.name == name
        thing << item.class
      end
    end
    thing[0]
  end
  
  def genre=(genre)
    @genre = genre
    if genre != nil
      if !genre.songs.include?(self)
        genre.songs << self
      end
    end
  end
end