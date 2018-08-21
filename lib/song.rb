class Song

  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def genre
    @genre
  end

  def self.all # Class Reader
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name}
  end

  def self.create(name, artist = nil, genre = nil)
    song = self.new(song, artist, genre)
    song.name = name
    song.save
    song
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    song = filename.chomp(".mp3").split(" - ")
    new_song = Song.new(song[1])
    new_song.artist = Artist.find_or_create_by_name(song[0])
    new_song.genre = Genre.find_or_create_by_name(song[2])
    new_song.save
    new_song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

end
