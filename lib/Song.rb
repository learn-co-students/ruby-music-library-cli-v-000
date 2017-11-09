class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    @songs = []
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self) unless @artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self) unless @genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
    artistname = filename.split(" - ")[0]
    songname = filename.split(" - ")[1]
    genrename = File.basename(filename.split(" - ")[2], ".mp3")
    artist = Artist.find_or_create_by_name(artistname)
    genre = Genre.find_or_create_by_name(genrename)
    self.new(songname, artist, genre) unless self.find_by_name(songname)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save unless self.all.include?(song)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
end
