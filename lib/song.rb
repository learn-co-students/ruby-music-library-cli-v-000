class Song
  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  @@all = []

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
    Song.new(name).tap do |song|
      song.save
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    file_parts = filename.split(" - ")
    artist_n = file_parts[0]
    song_n = file_parts[1]
    genre_n = file_parts[2].gsub(".mp3","")

    artist = Artist.find_or_create_by_name(artist_n)
    genre = Genre.find_or_create_by_name(genre_n)

    Song.new(song_n, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap do
      |song| song.save
    end
  end

end
