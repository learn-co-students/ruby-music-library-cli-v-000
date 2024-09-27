class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    song = Song.new(name)
    song.save
    return song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.new_from_filename(file_name)
    name = file_name.split(" - ")[1]
    artist = file_name.split(" - ")[0]
    genre = file_name.split(" - ")[2].chomp(".mp3")

    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    song = self.find_or_create_by_name(name)

    song.artist = artist
    song.genre = genre

    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

end
