class Song
  attr_accessor :name, :artist
  @@all = []
  def initialize(name, artist = nil)
    @name = name
    @artist = artist
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
    self.new(name).tap {|new_song| new_song.save}
  end
end
