class Artist

  extend Concerns::Findable 

  attr_accessor :name, :songs 
    
    @@all = []
    
  

  def initialize(name, song = nil, genre = nil)
    @name = name
    @songs = []
    self.song = song if song  
  end



  def self.all
    @@all
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s|s.save}
  end


  def self.destroy_all
   @@all.clear
  end



  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

   def to_s
    self.name
  end

 def self.find_by_name(name)
   self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
  end
  

  def genres
    self.songs.collect{|s| s.genre}.uniq
    end



  def save
    @@all << self
  end



end#class
