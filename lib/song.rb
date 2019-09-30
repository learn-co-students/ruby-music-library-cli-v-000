class Song 
  attr_accessor :name, :artist
  #attr_writer :genre, :artist
  #attr_accessor :name, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist 
    self.genre = genre
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
    if !self.find_by_name(name)
      self.create(name)
      self.find_by_name(name)
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
      thing[0]
    end
  end
  
  def genre=(genre)
    @genre = genre
    #binding.pry
    if genre != nil
      if !genre.songs.include?(self)
        genre.songs << self
      end
    end
  end
end
end