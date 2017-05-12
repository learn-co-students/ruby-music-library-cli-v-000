class Genre

  extend Concerns::Findable
  extend Concerns::ClassMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    self.all << genre
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
    artists = []
    self.songs.each do |song|
      artists << song.artist unless artists.include?(song.artist)
    end
    artists
  end

end
