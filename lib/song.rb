class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def save
    @@all << self
  end

  def self.create(name)
     song = Song.new(name)
     @@all << song
     song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(file_name)
    pieces = file_name.split(" - ")
    title = pieces[1]
    artist = Artist.find_or_create_by_name(pieces[0])
    genre = Genre.find_or_create_by_name(pieces[2].gsub(".mp3", ""))
    song = Song.new(title, artist, genre)
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

end
