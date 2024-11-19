
class Genre
  attr_accessor :name
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    @name = self.new(name)
    self.all << @name
    @name
  end

  def self.destroy_all
    self.all.clear
  end

  def songs
    @songs
  end

  def artists
    artist_collection = self.songs.collect {|song_instance| song_instance.artist}
    artist_collection.uniq
  end

end
