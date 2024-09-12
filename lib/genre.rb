class Genre
  attr_accessor :name
  attr_reader :songs

  extend Concerns::Findable
  extend Concerns::Findable::ClassMethods

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
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    song.genre = self if song.genre.nil?
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    @songs.collect { |song| song.artist }.uniq
  end

end
