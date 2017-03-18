class Song
  extend Concerns::Findable

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
    # @artist.songs << self
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end

  # def self.find_by_name(name)
  #   self.all.find {|song| song.name == name }
  # end

  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  # end

  def self.new_from_filename(filename)
    artist, name, genre = filename.gsub(".mp3", "").split(" - ")
    new_song = self.new(name)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song
  end

  def self.create_from_filename(filename)
    artist, name, genre = filename.gsub(".mp3", "").split(" - ")
    new_song = self.new(name)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song.save
    new_song
  end
end
