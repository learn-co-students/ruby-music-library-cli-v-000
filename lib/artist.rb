class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(name)
    new(name).tap{|o| o.save}
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless self.songs.include? song
  end
  
  def genres
    self.songs.collect{|song| song.genre}.uniq
  end
  
  def save
    @@all << self
  end
  
end