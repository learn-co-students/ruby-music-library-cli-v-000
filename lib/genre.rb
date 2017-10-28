
class Genre
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << name
  end

  def self.create(created_genre)
    created_genre = Genre.new(created_genre)
    created_genre.save
    created_genre
  end

  def songs
    @songs
  end

  def add_song(song)
    if (song.artist.nil?)
      @songs << song
      song.artist = self
    end
  end

end
