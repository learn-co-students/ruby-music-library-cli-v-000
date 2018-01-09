class Genre
  attr_accessor :name
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def self.create(name)
    #song = Song.new(name)
    #song.save
    #song
    self.new(name).tap {|genre| genre.save}
  end

  def artists
    artists = self.songs.collect{|song| song.artist}
    artists.uniq
  end
end
