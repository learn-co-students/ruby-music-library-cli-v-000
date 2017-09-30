class Genre
  extend Concerns::Findable 
  attr_accessor :name, :artists, :songs

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

  def save
    @@all << self
  end

  def self.create(name)
    created_genre = Genre.new(name)
    created_genre.save
    created_genre
  end

  def add_song(song)
    song.genre = self unless song.genre #assigns the current genre to the song's 'genre' property
    songs << song unless songs.include?(song)
  end

  def artists
    artists = []
    songs.collect do |song|
      artists << song.artist unless artists.include?(song.artist)
    end
    artists
  end

end
