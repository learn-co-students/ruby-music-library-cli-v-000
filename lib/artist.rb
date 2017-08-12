class Artist 
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :genre


  @@all = []

  def initialize(name)
    @name = name
    @@all = []
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  # def genres
  #   self.songs.collect {|song| song.genre}
  # end
  #end
  
  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
  def genres
    # binding.pry
    songs.collect{ |s| s.genre }.uniq
  end
  
  
end