class Song
  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist

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

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def save
    @@all << self if !@@all.include?(self)
  end

  def artist=(artist)
    artist.add_song(self) if artist.songs.none? {|s| s == self}
    @artist = artist if !self.artist
  end

  def genre=(genre)
    genre.add_song(self) if genre.songs.none? {|s| s == self}
    @genre = genre if !self.genre
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename[0...filename.index(".mp3")].split(" - ")
    self.create(name).tap do |song|
      song.artist = Artist.find_or_create_by_name(artist)
      song.genre = Genre.find_or_create_by_name(genre)
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap {|song| song.save}
  end

end
