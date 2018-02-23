class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs, :artists

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

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless self.songs.detect{|song_object| song_object == song}
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

end
