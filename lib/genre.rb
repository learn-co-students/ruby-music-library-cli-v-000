class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def self.all
    @@all
  end

  def initialize (name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(genre_name)
    genre = self.new(genre_name)
    genre.save
    genre
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
  end

  def artists
    artists = self.songs.collect {|song| song.artist}
    artists.uniq
  end
end
