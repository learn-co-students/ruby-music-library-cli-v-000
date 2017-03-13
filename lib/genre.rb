class Genre
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
    genre = self.new(name)
    genre.save
    genre
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
    song.genre = self unless song.genre == self
  end

  def artists
    self.songs.map{|song| song.artist}.uniq
  end

end
