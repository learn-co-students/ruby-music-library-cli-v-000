class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
    songs.collect{|s| s.artist}.uniq
  end


  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    self.all << genre
    genre
  end

end
