class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre= genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Song.all << self
  end

  def self.create(name, artist = nil, genre = nil)
    Song.new(name, artist, genre).tap{|s| s.save}
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self if !self.genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    genre_name = filename.split(" - ")[2].chomp(".mp3")

    self.find_or_create_by_name(song_name).tap do |s|
      s.artist = Artist.find_or_create_by_name(artist_name)
      s.genre = Genre.find_or_create_by_name(genre_name)
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
