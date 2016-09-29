class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre = nil)
    @name = name
    self.artist = artist if artist  # self.artist links to Artist class by sending artist message
    self.genre = genre if genre  #self.genre links to Genre class by sending genre message
  end

  def artist=(artists_name)
    @artist = artists_name
    if self.artist.songs.include?(self) == false
      self.artist.add_song(self)
    end
  end

  def genre=(genre_name)
    @genre = genre_name
     if self.genre.songs.include?(self) == false
      self.genre.add_song(self)
    end
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    genre_name = filename.split(" - ")[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)  #if artist already exists, need to not create a new one
    genre = Genre.find_or_create_by_name(genre_name) # same with genre

    song = self.new(song_name, artist, genre)

    song

  end

  def self.create_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    genre_name = filename.split(" - ")[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)  #if artist already exists, need to not create a new one
    genre = Genre.find_or_create_by_name(genre_name) # same with genre

    song = self.create(song_name, artist, genre)

    song

  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end
