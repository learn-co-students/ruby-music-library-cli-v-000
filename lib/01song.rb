class Song

attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    instance = self.new(name)
    instance.save
    instance
  end

  def artist
    Artist.add_song
  end
end
