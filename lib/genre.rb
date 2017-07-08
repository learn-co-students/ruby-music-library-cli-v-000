class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap { |genre| genre.save }
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.print_genres
    Genre.all.collect { |g| puts g.name }
  end

  def self.print_genre_songs(genre)
    find_by_name(genre).songs.each { |s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" }
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
  end

  def artists
    @songs.collect { |song| song.artist }.uniq
  end
end
