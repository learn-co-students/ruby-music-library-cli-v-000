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

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song_instance)
    song_instance.genre = self if song_instance.genre != self
    @songs << song_instance unless @songs.include?(song_instance)
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    created_genre = Genre.new(name)
    @@all << created_genre unless @@all.include?(created_genre)
    created_genre
  end

end
