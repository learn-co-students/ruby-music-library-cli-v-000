class Genre
  attr_accessor :name, :songs, :artists
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  #CLASS METHODS
  extend Concerns::Findable


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
    @@all << self
  end

  def artists
    self.songs.map {|s| s.artist}.uniq
  end

end
