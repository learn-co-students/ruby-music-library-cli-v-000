class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
  end

  def artists
    artists = self.songs.collect {|s| s.artist}
    artists.uniq
  end

end 