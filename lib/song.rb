class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist
      @artist = artist
      artist.add_song(self)
    end

    if genre
      @genre = genre
      genre.add_song(self)
    end
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    name_array = filename.split(" - ")
    artist = Artist.find_or_create_by_name(name_array[0])
    genre_name = name_array[2].split(".")[0]
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(name_array[1], artist, genre)
  end

  def self.create_from_filename(filename)
    name_array = filename.split(" - ")
    artist = Artist.find_or_create_by_name(name_array[0])
    genre_name = name_array[2].split(".")[0]
    genre = Genre.find_or_create_by_name(genre_name)
    song = self.new(name_array[1], artist, genre)
    song.save
    song
  end

end
