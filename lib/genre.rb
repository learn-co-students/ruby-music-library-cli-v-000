class Genre
  extend Concerns::Findable

  @@all = []

  attr_accessor :name
  attr_reader   :songs

  def initialize(name)
    @name  = name
    @songs = []
  end

  def songs=(song)
    add_song(song)
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
  end

  def artists
    artists = []
    @songs.each { |song|
      artists << song.artist unless artists.include?(song.artist)
    }
    artists
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.destroy_all
    @@all.clear
  end

  def self.list_all
    all.each { |genre|
      puts "#{genre.name}"
    }
  end

  def self.list_songs(genre_name)
    genre = find_by_name(genre_name)
    genre.songs.each { |song| song.print }
  end
end
