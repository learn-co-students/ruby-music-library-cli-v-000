class Artist
  
  attr_accessor :name, :songs
  @@all = []
  
   extend Concerns::Findable
  
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
  
  def self.create(artist_name)
    new_artist = self.new(artist_name) 
      new_artist.save
      new_artist
   end
   
  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?song
  end
  
  def genres
    self.songs.collect do |song|
      song.genre
    end
      .uniq
  end
end
  
  
