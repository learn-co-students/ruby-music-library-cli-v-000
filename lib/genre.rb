class Genre
  extend Concerns::Findable

  attr_accessor :name, :song, :songs

  @@all = []

  def initialize (name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def artists
    artists = @songs.collect{|song|song.artist}
    artists.uniq
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

  def self.create(name)
    Genre.new(name).tap{|genre| genre.save}
  end
end
