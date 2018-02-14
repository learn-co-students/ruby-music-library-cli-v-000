class Song

  @@all = []

  attr_accessor :name, :artist

  def initialize(name, artist=nil)
    @name = name
    @artist = artist if artist != nil
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

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end


end
