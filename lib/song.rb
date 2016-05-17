class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
  	@name = name
  	artist.add_song(self) if artist != nil
  	genre.add_song(self) if genre != nil
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name, artist = nil, genre = nil)
  	song = self.new(name, artist, genre)
  	self.all << song
  	song
  end

  def artist=(artist)
  	@artist = artist
  	artist.songs << self unless artist.songs.include?(self)
  	artist.add_song(self)
  end

  def genre=(genre)
  	@genre = genre
  	genre.songs << self unless genre.songs.include?(self)
  	genre.add_song(self)
  end

  def self.find_by_name(name)
  	self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
  	artist_name = filename.split(" - ")[0]
  	song_name = filename.split(" - ")[1]
  	genre_name = filename.split(" - ")[2].gsub(".mp3", "")
  	artist = Artist.find_or_create_by_name(artist_name)
  	genre = Genre.find_or_create_by_name(genre_name)
  	self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
  	artist_name = filename.split(" - ")[0]
  	song_name = filename.split(" - ")[1]
  	genre_name = filename.split(" - ")[2].gsub(".mp3", "")
  	artist = Artist.find_or_create_by_name(artist_name)
  	genre = Genre.find_or_create_by_name(genre_name)
  	self.create(song_name, artist, genre)
  end

end