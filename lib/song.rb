class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
      self.find_by_name(song_name) || self.create(song_name)
  end

  def self.new_from_filename(filename)
    names = filename.split(" - ")
    song = self.new(names[1])
    song.artist = Artist.find_or_create_by_name(names[0])
    song.genre = Genre.find_or_create_by_name(names[2].gsub(".mp3", ""))
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save

  end
end
