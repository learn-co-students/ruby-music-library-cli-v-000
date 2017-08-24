class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
      n = filename.split(" - ")
      artist_name = n[0]
      title = n[1]
      genre_name = n[2].gsub(".mp3", "")
      song = Song.new(title)
      song.artist = Artist.find_or_create_by_name(artist_name)
      song.genre = Genre.find_or_create_by_name(genre_name)
      song
  end

  def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
      song
  end

end
