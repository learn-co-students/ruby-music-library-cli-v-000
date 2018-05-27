class Song

  attr_accessor :name
  attr_reader :artist

  @@all =[]

  def initialize(name, artist = "nil")
    @name = name
    if artist != "nil"
      @artist = artist
    end
  end

  def artist=(artist)
    @artist = artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
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
