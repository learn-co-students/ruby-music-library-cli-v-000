class Song
  attr_accessor :name
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    if artist != nil
     self.artist = artist
    end
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

  def self.create(name)
    new_object = self.new(name)
    new_object.save
    new_object
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

end
