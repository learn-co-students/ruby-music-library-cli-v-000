class Song
  attr_accessor :name, :artist, :genre

  extend Concerns::Findable

  @@all = []

  def initialize(name, artist=0, genre=0)
    @name = name
    artist.add_song(self) if artist != 0
    self.genre = genre if genre != 0 
    self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
   Song.new(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.detect{|song_object| song_object.name == self.name }
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
  end

  def Song.new_from_filename(filename)
    file_array = filename.split(" - ")
    song = Song.new(file_array[1])
    song.artist_name=(file_array[0])
    song.genre=Genre.find_or_create_by_name(file_array[2].chomp('.mp3'))
    song
  end

  def Song.create_from_filename(filename)
    data = filename.chomp(".mp3").split(" - ")
    name = data[1]
    artist_name = data[0]
    genre = data[2]

    song_object = self.create(name)
    song_object.name = name
    song_object.artist_name= artist_name
    song_object.genre= Genre.find_or_create_by_name(genre)
    song_object
  end

end