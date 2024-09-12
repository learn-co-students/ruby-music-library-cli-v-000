class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all =[]

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre= genre if genre
end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs<< self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    self.class.all<<self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    # artist = parts[0]
    # song = parts[1]
    # genre = parts[2].gsub(".mp3","")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)

      Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
      new_song = self.new_from_filename(filename)
      new_song.save
      new_song
  end 




end
