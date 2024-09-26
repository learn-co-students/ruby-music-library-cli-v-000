class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
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

  def self.create(name)
    artist = self.new(name)
  end

  def add_song(song)
    @songs << song
    song.artist = self if song.artist != self
    @songs = @songs.uniq
  end


  def genres  
    @songs.collect {|song| song.genre}.uniq
  end
  
end