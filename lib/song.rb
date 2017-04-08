class Song
  #Songs belongs to an artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def artist=(artist_name)
    @artist = artist_name
  end

  def artist
    @artist
  end

  def self.create(name)
    song = self.new(name).tap do |song|
      song.save
    end
  end

end
