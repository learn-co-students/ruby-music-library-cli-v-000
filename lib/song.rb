
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    # @songs << song if !@songs.include?(song)
    # song.artist = self if song.artist != self
    @genre = genre
    @genre.songs << self if !@genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    name = file.match(/(.*)[.]mp3/)[1].split(/\s+-\s+/)
    song = Song.new(name[1])
    song.artist = Artist.find_or_create_by_name(name[0])
    song.genre = Genre.find_or_create_by_name(name[2])
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
  end

  def self.create(name)
    ans = self.new(name)
    ans.save
    ans
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

end