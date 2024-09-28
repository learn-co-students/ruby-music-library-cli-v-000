class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def artist=(artist)
    if artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0]) #artist_name
    song_name = data[1].split(".")[0] #song name.mp3 -> song name
    genre_name = data[2].split(".")[0]
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(song_name, artist, genre)
    genre.add_song(song)
    artist.add_song(song)
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    @@all << song
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

end
