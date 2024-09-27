class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    self.save
    @songs = []
  end

  def artists
    artists_of_songs = @songs.collect {|song| song.artist}
    artists_of_songs.flatten.uniq
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
    self.new(name)
  end
end
