class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre if !@genre
    @genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.new_from_filename(name)
    artist, name, genre = name.split(' - ')
    Song.new(name, Artist.find_or_create_by_name(artist), Genre.find_or_create_by_name(genre.gsub!('.mp3', '')))
  end

  def self.create_from_filename(name)
    new_song = self.new_from_filename(name)
    new_song.save
    new_song
  end

end
