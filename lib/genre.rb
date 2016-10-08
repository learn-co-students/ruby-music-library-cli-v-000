class Genre

  attr_accessor :name, :song, :artist
  @@all = []
  extend Concerns::Findable

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

  def self.create(genre)
    genre = Genre.new(genre)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.genre = self if song.genre != self
  end

  def artists
    artists = @songs.collect {|song| song.artist}
    artists.uniq
  end

end
