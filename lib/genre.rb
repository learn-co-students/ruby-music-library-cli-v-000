class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.create(name)
    s = self.new(name)
    @@all << s
    s
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def artists
    g = @songs.collect {|song| song.artist}
    return g.uniq
  end

end
