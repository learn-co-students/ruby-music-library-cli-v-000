class Song

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(name, artist=nil, genre=nil)
    song = Song.new(name, artist, genre)
    song.save
    return song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = all.detect {|song| song.name == name}
    if song; song; else; Song.create(name); end
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name, song_name, genre_name = data[0], data[1], data[2].split(".").first
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist_name, song_name, genre_name = data[0], data[1], data[2].split(".").first
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    create(song_name, artist, genre)
  end


end