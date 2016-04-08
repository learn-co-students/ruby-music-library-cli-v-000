class Song
  extend Concerns::Findable
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    artist_name, name, genre = filename.chomp(".mp3").split(" - ")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre)
    song = Song.new(name, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def artist=(artist)
    unless self.artist == artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
end