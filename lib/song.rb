class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist if true
    @genre = genre if true
  end

def self.all
    @@all
  end

  def self.destroy_all
      @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap { |s| s.save}
  end

end
