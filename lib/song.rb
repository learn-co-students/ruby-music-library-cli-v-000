class Song
  extend Concerns::Findable 
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.artist = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap{|s| s.save}
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
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    row = filename

    data = row.split(" - ")
    artist_name = data[0]
    song_name = data[1]
    song_genre = data[2].chomp(".mp3")

    song = self.new
    song.name = song_name
    song.artist = artist_name
    song.genre = song_genre
    self.new(song_name,song_artist,song_genre)
  end

end
