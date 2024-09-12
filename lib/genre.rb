class Genre
  attr_accessor :name, :songs, :artists
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
   name = Genre.new(name)
   name.save
   name
  end

  def songs
    @songs
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end

end
