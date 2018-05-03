class Genre
  attr_accessor :name
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
  def self.create(name)   #initializes and saves the genre
    genre = new(name)
    genre.save
    genre
  end

  def save                # adds the Genre instance to the @@all class variable
    @@all << self
  end
  def songs               # returns the genre's 'songs' collection (artist has many songs)
    @songs
  end
  def add_song(song)
    song.genre = self unless song.genre
    songs << song unless songs.include?(song)
  end
  def artists
    songs.collect { |song| song.artist }.uniq      # returns a collection of genres ; does not return duplicate genres ; collects genres through its songs
  end
end
