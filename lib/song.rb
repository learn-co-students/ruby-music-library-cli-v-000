class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    artist.add_song(self) if self.artist
    @genre = genre
    genre.add_song(self) if self.genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !(genre.songs.include?(self))
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) if self.artist
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist=nil, genre=nil)
    self.new(name, artist, genre).tap {|song| song.save}
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(/\.|\s-\s/)
    artist_name = filename_array[0]
    song_name = filename_array[1]
    genre_name = filename_array[2]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    filename_array = filename.split(/\.|\s-\s/)
    artist_name = filename_array[0]
    song_name = filename_array[1]
    genre_name = filename_array[2]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end
end
