class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = "", genre = "")
    @name = name

    artist != "" ? self.artist=(artist) : @artist = artist
    genre != "" ? self.genre=(genre) : @genre = genre
  end

  def genre=(genre)
    @genre = genre

    unless genre.songs.include?(self)
      genre.songs << self
    end
  end

  def artist=(artist_name)
    @artist = artist_name
    artist_name.add_song(self)
  end

  #CLASS METHOD

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    song = filename.split(" - ")[1]
    genre = filename.split(" - ")[2].gsub(/\..*/,"")

    new_song = Song.new(song)
    new_song.tap do |song|
      song.artist = Artist.find_or_create_by_name(artist)
      song.genre = Genre.find_or_create_by_name(genre)
    end
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end

  def self.create(name)
    Song.new(name).tap do |song|
      song.save
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

end
