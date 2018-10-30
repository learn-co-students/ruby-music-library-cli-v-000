class Genre
  attr_accessor :name

  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
    #@artists = Array.new
    @@all << self
  end

  #START OF CLASS METHODS
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).save
    return self
  end
  #END OF CLASS METHODS

  def save
    @@all << self
  end

  # def artists
  #   @artists.uniq
  # end

  def songs
    @songs
  end

  def artists
    @songs.map { |song| song.artist }.uniq
  end

end
