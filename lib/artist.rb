class Artist extend Concerns::Findable
  attr_accessor :name,:songs, :genres 
 
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
   def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def genres
    @songs.map do |song|
      song.genre
    end.uniq
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    self.songs.include?(song)
      if song.artist != self 
        song.artist = self 
      end
      if !@songs.include?(song)
        @songs << (song)
       end
    end
    
  def self.find_by_name(name)
    @@all.find {|artist| artist.name == name}
  end
    
end