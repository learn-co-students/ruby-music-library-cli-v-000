class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist=nil, genre=nil)
    @name = name
    save
    artist.add_song(self) if artist != nil
    self.genre = genre if genre != nil
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

   def genre=(genre)
    @genre = genre
    genre.songs << self
    genre.songs.uniq!
  end

  def self.new_from_filename(filename)
    artist_string = filename.split(" - ")[0]
    song_string = filename.split(" - ")[1]
    genre_string = filename.split(" - ")[2].chomp(".mp3")
      song = Song.new(song_string)
      song.genre = Genre.find_or_create_by_name(genre_string)
      song.artist = Artist.find_or_create_by_name(artist_string)    
    song
  end

  def self.create_from_filename(filename)
     artist_string = filename.split(" - ")[0]
    song_string = filename.split(" - ")[1]
    genre_string = filename.split(" - ")[2].chomp(".mp3")
      song = Song.new(song_string)
      song.genre = Genre.find_or_create_by_name(genre_string)
      song.artist = Artist.find_or_create_by_name(artist_string)    
    song
  end

end 