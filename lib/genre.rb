class Genre

  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name) #!!Very important to RETURN the instance created otherwise test fails!!
    genre_new = self.new(name).tap {|g| g.save}
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
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

end
