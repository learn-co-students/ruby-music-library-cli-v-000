class Genre
  
  attr_accessor :name, :songs
  @@all = []

   extend Concerns:: Findable
   
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
    @@all << self.new(genre)
    self
  end
  
  def add_song(song)
    @songs << song unless self.songs.include?song
  end
  
  def artists
    self.songs.collect do |song|
      song.artist
    end
      .uniq
  end
end
  

  
  