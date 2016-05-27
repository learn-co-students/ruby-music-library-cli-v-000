require 'pry'
class Song

  attr_accessor :name, :genre
  attr_reader :artist
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name

    if artist != nil
      self.artist = artist
    end

    if genre != nil
      self.genre = genre
    end
  end

  def self.create(name) #!!Very important to RETURN the instance created otherwise test fails!!
    song_new = self.new(name).tap {|s| s.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.find {|song| name == song.name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(name)
    artist, title, genre = name.split(/ - |.mp3/)
    new_song = self.new(title)
    new_song.artist = Artist.find_by_name(artist) ? Artist.find_by_name(artist) : Artist.new(artist)
    new_song.genre = Genre.find_by_name(genre) ? Genre.find_by_name(genre) : Genre.new(genre)
    new_song
  end

  def self.create_from_filename(name)
    artist, title, genre = name.split(/ - |.mp3/)
    new_song = self.new(title)
    new_song.artist = Artist.find_or_create_by_name(artist) ? Artist.find_or_create_by_name(artist) : Artist.new(artist)
    new_song.genre = Genre.find_or_create_by_name(genre) ? Genre.find_or_create_by_name(genre) : Genre.new(genre)
    new_song.save
    new_song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

end
