class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    artist.add_song(self) if !artist.nil?
    genre.songs << self if !(genre.nil? || genre.songs.include?(self))
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    song = Song.find_or_create_by_name(file.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(file.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(file.split(" - ")[2].gsub(".mp3", ""))
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

end