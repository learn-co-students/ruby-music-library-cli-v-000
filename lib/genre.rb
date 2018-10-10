class Genre
  attr_accessor :name
  attr_reader :songs

  extend Concerns::Findable 

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    song.genre = self if song.genre.nil?
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end
end