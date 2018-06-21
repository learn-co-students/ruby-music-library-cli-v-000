class Song
  @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name:, artist: = nil, genre: = nil)
    @name = name
    self.artist=(artist) if artist
    @genre = genre
  end

  def artist=(artist_name)
    if Artist.find_by_name(artist_name)
      Artist.find_by_name(artist_name).songs << self
      @artist = Artist.find_by_name(artist_name)
    else
      new_artist = Artist.create(artist_name)
      new_artist.songs << self
      @artist = new_artist
    end
  end

  def genre=(genre_name)
    if Genre.find_by_name(genre_name)
      Genre.find_by_name(genre_name).songs << self
      @genre = Genre.find_by_name(genre_name)
    else
      new_genre = Genre.create(genre_name)
      new_genre.songs << self
      @genre = new_genre
    end
  end

  def self.find_by_name(name)
    self.all.find do |song_name|
      song_name.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) if self.find_by_name(name)
    self.create(name) if !self.find_by_name(name)
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end
