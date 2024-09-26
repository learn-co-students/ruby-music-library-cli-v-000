class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
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
  
  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end
  
  def save
    self.class.all << self
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    exists = false
    @songs.each do |target_song|
      if target_song == song
        exists = true
      else
        
      end
    end
    
    if exists == false
      @songs << song
      if song.artist == nil
        song.artist = self
      else
        
      end
    end
  end
  
  def genres
    unique_genre = []
    
    @songs.collect do |song|
      unique_genre << song.genre
    end
    
    unique_genre.uniq
  end
  
end