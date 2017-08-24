class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
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
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    all.detect {|match| match.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file_name)
    song_data = file_name.gsub(".mp3", "").split(" - ")
    song_artist = Artist.find_or_create_by_name(song_data[0])
    song_name = song_data[1]
    song_genre = Genre.find_or_create_by_name(song_data[2])
    song = Song.new(song_name,song_artist,song_genre)
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

end
