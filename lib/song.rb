class Song

  extend Concerns::Findable

  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      @artist = artist
      @artist.add_song(self)
    end
    if genre != nil
      @genre = genre
      @genre.add_song(self)
    end
    if genre != nil && artist != nil
      @genre.add_genre(self)
    end
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

  def self.create(name, artist = nil)
    song = Song.new(name, artist)
    song.save
    song
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def self.new_from_filename(file)
    file_split = file.split(" - ")
    artist_name, song_name, genre_name = file_split[0], file_split[1], file_split[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(song_name, artist, genre)
    song
  end

  def create_from_filename

  end

end
