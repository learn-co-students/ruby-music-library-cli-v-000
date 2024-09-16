class Genre
  extend Concerns::Findable
  attr_accessor :name, :song, :artist

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    artists = self.songs.collect {|song| song.artist}
    artists.uniq
  end

end
