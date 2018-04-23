class Artist
  extend Concerns::Findable 
  attr_accessor :name
@@all = []



  def initialize(name)
    @name = name
    @songs = []
  end

def songs
  @songs
end

def genres
  collection = []
self.songs.each do |song|
  collection <<song.genre unless collection.include?(song.genre)
  end
  collection
end



  def self.all
    @@all
  end

  def save
    @@all<< self
  end


  def add_song(song)
    song.artist = self unless song.artist != nil
    @songs << song unless @songs.include?(song)

  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

end
