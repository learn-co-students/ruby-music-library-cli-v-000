class Genre
  attr_accessor :name
  attr_reader :artist, :song

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.genre = self unless song.genre
  end

  def songs
    @songs
  end

  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end


  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

end
