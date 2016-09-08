class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist
  attr_reader :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name

    if artist
      @artist = artist
      artist.add_song(self)
    end

    if genre
      @genre = genre
      genre.songs << self
    end
  end

  def save
    @@all << self
    self
  end

  def artist=(artist)
    @artist = artist unless @artist
    artist.add_song(self)
  end

  def genre=(genre)
    unless self.genre
      genre.songs << self
      @genre = genre
    end
  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.chomp(".mp3").split(" - ")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).save
  end
end

