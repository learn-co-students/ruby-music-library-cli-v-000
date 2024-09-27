class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
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

  def genres
    g = @songs.collect {|song| song.genre}
    return g.uniq
  end

end
