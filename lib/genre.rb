class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

   @@all = [] 

  def initialize(name)
    @name = name
    @songs = []
    
  end

  def self.create(name)
    new(name).tap{|s|s.save}
  end

  def self.all
    @@all
  end

  def artists
    self.songs.collect{|a| a.artist}.uniq
  end

  def self.destroy_all
   @@all.clear
  end

  # def artist=(artist)
  #   @artist = artist
  #   artist.add_song(self)
  # end

 def self.find_by_name(name)
   self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
  end

  def to_s
    self.name
  end

  def save
  @@all << self
  end


end#class
