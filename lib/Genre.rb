class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name
    @name.dup.freeze
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(genre)
    x = Genre.new(genre)
    x.save
    x
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless songs.detect {|x| x == song}
  end

  def artists
    self.songs.map {|x| x.artist}.uniq
  end
end
