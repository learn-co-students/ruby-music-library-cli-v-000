class Genre
  attr_reader :songs
  attr_accessor :name
  
  @@all = []
  
  extend Concerns::Findable
  
  def initialize(name)
    @name  = name
    @songs = []
  end
  
  class << self
    def all
      @@all
    end
    
    def destroy_all
      @@all.clear
    end
    
    def create(name)
      instance = self.new(name)
      instance.save
      
      instance
    end
  end
  
  def save
    self.class.all << self
  end
  
  def artists
    songs = self.songs.select { |song| song.genre == self }
    songs.map { |song| song.artist }.uniq
  end
  
end