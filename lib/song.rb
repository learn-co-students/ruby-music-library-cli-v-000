class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(file_name)
    song_name = file_name.split(" - ")[1]
    artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].split(".")[0])
    # binding.pry
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

end
