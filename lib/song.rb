class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
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
    self.new(name)
  end

  def artist=(name)
    @artist = name
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(file_name)
    split = file_name.split(" - ") 
    artist = split[0]
    song = split[1]
    genre = split[2].gsub(".mp3", "")
    artist_create = Artist.find_or_create_by_name(artist)
    genre_create = Genre.find_or_create_by_name(genre)
    self.new(song, artist_create, genre_create)
  end

  def self.create_from_filename(file_name)
    split = file_name.split(" - ") 
    artist = split[0]
    song = split[1]
    genre = split[2].gsub(".mp3", "")
    artist_create = Artist.find_or_create_by_name(artist)
    genre_create = Genre.find_or_create_by_name(genre)
    self.new(song, artist_create, genre_create)
  end



end

