class Song

  extend Concerns::Findable

attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre=(genre) if genre
    self.artist=(artist) if artist
  end

  def genre=(genre)
   @genre = genre
   genre.songs << self unless genre.songs.include?(self)
 end

  def genre
    @genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

end
