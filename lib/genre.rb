class Genre
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    # self.new(name).tap {|s| s.save}
    genre = self.new(name)
    genre.save
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
