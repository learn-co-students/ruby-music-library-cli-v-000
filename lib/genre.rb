class Genre
  attr_accessor :name
  attr_reader :songs
  @@all = []
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    unless self.songs.include?(song) then self.songs << song
    end
  end

  def artists
    self.songs.map {|song| song.artist}.uniq
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
