class Artist  
  extend Concerns::Findable
  attr_accessor :name, :song, :genre 
  
  @@all = []
  @@song_count = 0 
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
   def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end 
  
  def songs
    @songs
  end 
  
  def self.all
    @@all
  end
  
   def add_song(song)
    @songs << song unless songs.include?(song)
    song.artist = self unless song.artist
    @@song_count += 1 
  end 
  
  def save
    @@all << self
  end
  
  def genres
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end
  
  def self.destroy_all
  @@all.clear
 end 
  
end 