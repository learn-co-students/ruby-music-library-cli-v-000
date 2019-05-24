class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
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
    song.save
    song
  end


  def self.all
    @@all
  end


  def self.destroy_all
    @@all = []
  end


  def artist
    @artist
  end


  def genre
    @genre
  end


  def self.find_by_name(name)
    all.detect do |song| name == song.name
    end
  end


  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : Song.create(name)
  end


  def self.new_from_filename(filename)
    song_split = filename.split(" - ")
    artist = Artist.find_or_create_by_name(song_split[0])
    genre = Genre.find_or_create_by_name(song_split[2].gsub(".mp3",""))
    song = self.new(song_split[1],artist,genre)
    song
  end


  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end


end
