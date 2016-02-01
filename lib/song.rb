class Song
  attr_accessor :name, :genre, :artist
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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
    newsong = Song.new(name)
    newsong.save
    newsong
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(name)
    songfilename = name.chomp(".mp3")
    songarray = songfilename.split(" - ")
    artist = Artist.find_or_create_by_name(songarray[0])
    genre = Genre.find_or_create_by_name(songarray[2])
    self.new(songarray[1], artist, genre)
  end

  def self.create_from_filename(name)
    song = new_from_filename(name)
    song.save
    song
  end

  def self.sort_by_artist

  end

end