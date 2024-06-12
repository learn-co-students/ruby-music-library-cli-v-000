class Song

  extend Concerns::Findable

  attr_accessor :name, :songs, :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist_name=nil, genre_name=nil)
    @name = name
    @artist = artist_name

    if artist_name != nil
    self.artist = artist_name
  end

  if genre_name != nil
    self.genre = genre_name
  end
end

  def save
    @@all << self
  end

  def self.create(song)
    new_song = self.new(song)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def self.new_from_filename(file_name)
    s = file_name.split(" - ")
    song_name = s[1]
    artist_name = s[0]
    x = s[2].split(".")
    genre_name = x[0]
    new_song = Song.new(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.genre = Genre.find_or_create_by_name(genre_name)
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
    new_song
  end

end
