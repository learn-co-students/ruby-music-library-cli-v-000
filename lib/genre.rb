class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  def save
    @@all << self
  end

  def to_s
    "#{self.name}"
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.destroy_all
    @@all.clear
  end

end
