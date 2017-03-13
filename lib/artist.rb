class Artist
  #attributes & variables
  attr_accessor :name, :songs
  @@all = Array.new

  #Modules
  extend Concerns::Findable

  #initialize
  def initialize(name)
    @name = name
    @songs = Array.new
  end

  #class methods
  def self.all
    @@all
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.destroy_all
    self.all.clear
  end

  #instance methods
  def save
    self.class.all.push(self) unless self.class.all.include?(self)
  end

  def add_song(song)
    self.songs.push(song) unless self.songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.map{|song| song.genre}.uniq
  end

end
