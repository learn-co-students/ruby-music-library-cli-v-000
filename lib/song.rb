class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    self.artist = artist if artist
    @genre = genre
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

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    song_artist = file[0]
    song_name = file[1]
    song_genre = file[2].chomp(".mp3")
    #binding.pry
    a = Artist.find_or_create_by_name(song_artist)
    g = Genre.find_or_create_by_name(song_genre)
    self.new(song_name, a, g)
  end

  def self.create_from_filename(files)
    song = self.new_from_filename(files)
    song.save
    song
  end


end
