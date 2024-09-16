# Song Class
class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def self.create(title, artist = nil, genre = nil)
    new(title, artist, genre).tap{ |song| song.save }
  end

  def self.new_from_filename(filename)
    artist, title, genre = filename.gsub!('.mp3', '').split(' - ')

    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)

    song = self.new(title, artist, genre)
  end

  def self.create_from_filename(filename)
    artist, title, genre = filename.gsub!('.mp3', '').split(' - ')

    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)

    song = self.create(title, artist, genre)
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

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
end
