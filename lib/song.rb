
class Song
  attr_accessor :name
  attr_reader :artist, :genre


  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

    @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song)
    song = self.new(song)
    song.save
    song
  end

  def self.find_by_name(song)
    @@all.detect {|s| s.name == song}
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song) == nil
    self.create(song)
  else self.find_by_name(song)
  end
  end

  def self.new_from_filename(file)
    song_name = file.split(" - ")[1]
    artist_name = file.split(" - ")[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre_name = file.split(/\ - |\.mp3/)[2]
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    new_from_filename(file).save
  end



end
