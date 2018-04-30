class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name, :artist
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
  
  def self.create(genre)
    genre = self.new(genre)
    @@all << genre
    genre
  end
  
  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
    end
  end
  
  def artists
    @songs.collect{|s| s.artist}.uniq
  end
    
  

end
