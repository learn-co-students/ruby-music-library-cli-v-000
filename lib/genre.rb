# Genre Class
class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|genre| genre.save}
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

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

  def add_song(song)
    song.genre = self if song.genre.nil?
    @songs << song unless @songs.include?(song)
  end
  
  def to_s
    self.name
  end
end
