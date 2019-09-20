class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=artist if artist
    self.genre=genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    Song.all << self
  end

  def self.create(name)
    Song.new(name).tap {|s| s.save}
  end

  def artist=(artist)
    #binding.pry
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.new_from_filename(file_name)
    artistName = file_name.split(" - ")[0]
    songName = file_name.split(" - ")[1]
    genreName = file_name.split(" - ")[2].chomp(".mp3")
    artist = Artist.find_or_create_by_name(artistName)
    genre = Genre.find_or_create_by_name(genreName)
    song = self.new(songName, artist, genre)
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

end
