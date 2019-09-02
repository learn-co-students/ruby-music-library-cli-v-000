class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
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

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(song)
    @@all.detect { |s| s.name == song }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create(name)
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")
    artist = Artist.find_or_create_by_name(name[0])
    genre = Genre.find_or_create_by_name(name[2].gsub(".mp3", ""))
    self.new(name[1], artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap { |s| s.save }
  end

end
