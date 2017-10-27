class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  # don't need to add def songs if you add as attr_reader
  # def songs
  #   @songs
  # end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
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
    genre = self.new(name)
    genre.save
    genre

    # OR
    # new(name).tap { |g| g.save }
  end

  def artists
    songs.collect { |song| song.artist }.uniq
  end
end
