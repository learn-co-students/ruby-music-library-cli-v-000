class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  #CLASS METHODS
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
  self.new(name).tap {|genre| genre.save}
  end

  #INSTANCE METHODS
  def save
    self.class.all << self
  end

  def artists
    self.songs.map {|s| s.artist}.uniq
  end

end
