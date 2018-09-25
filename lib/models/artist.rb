class Artist
  attr_accessor :name, :songs
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end
  
  def genres
    songs.collect {|song| song.genre}.uniq
  end
    
  def self.create(name)
    Artist.new(name).save
    self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end