class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      @artist = artist
      artist.songs << self
    end
    if genre != nil
      @genre = genre
      genre.songs << self
    end
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) if !artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.create(name)
    song = Song.new(name)
    song.save

    song
  end

  def self.new_from_filename(filename)
    file = filename.split(/\s-\s|.\w+$/)
    song = self.new(file[1]).tap do |s|
      s.artist = Artist.find_or_create_by_name(file[0])
      s.genre = Genre.find_or_create_by_name(file[2])
    end
  end

  def self.create_from_filename(filename)
    file = filename.split(/\s-\s|.\w+$/)
    song = self.create(file[1]).tap do |s|
      s.artist = Artist.find_or_create_by_name(file[0])
      s.genre = Genre.find_or_create_by_name(file[2])
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end