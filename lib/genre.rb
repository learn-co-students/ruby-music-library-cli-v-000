class Genre
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
    song.genre = self unless song.genre == self
    @songs << song unless self.songs.include? song
  end
  
  def artists
    self.songs.collect{|song| song.artist}.uniq
  end
  
  def save
    @@all << self
  end
  
end