class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    new_from_filename = self.new(name)
    new_from_filename.save
    new_from_filename
  end

  def add_song(song)
    @songs << song
  end

  def artists
    @songs.collect { |song| song.artist }.uniq
  end

end
