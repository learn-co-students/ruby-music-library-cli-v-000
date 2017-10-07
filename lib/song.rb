class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name)
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre unless @genre
  end

  def self.new_from_filename(filename)
    filename_arr = filename.split(" - ")
    artist_name = filename_arr[0]
    song_name = filename_arr[1]
    genre_name = filename_arr[2].chomp(".mp3")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    all << song
    song
  end



end
