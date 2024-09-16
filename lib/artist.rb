class Artist
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
  
  def add_song(song)
    songs << song unless songs.include? song
    song.artist = self if song.artist == nil
  end
  
  def genres
    songs.map { |song| song.genre }.uniq
  end
  
end