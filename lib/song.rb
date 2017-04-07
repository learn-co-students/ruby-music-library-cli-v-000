class Song
  attr_accessor :name
  attr_reader :artist

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

  def self.create(name)
    song = self.new(name).tap do |song|
      song.save
    end
  end

  def artist=(artist_name)
    artist_name.songs << self unless artist_name.songs.include?(self)
    @artist = artist_name
  end

end
