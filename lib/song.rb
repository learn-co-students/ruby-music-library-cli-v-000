class Song
  #Songs belongs to an artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
     self.artist=(artist)
    end
    if genre
      self.genre=(genre)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def artist=(artist_name)
    artist_name.songs << self unless artist_name.songs.include?(self)
    @artist = artist_name
    artist_name.add_song(self)
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end

  def self.create(name)
    song = self.new(name).tap do |song|
      song.save
    end
  end

  def self.new_from_filename(file_name)
    song = file_name.split(" - ")[1]
    split_artist = file_name.split(" - ")[0]
    split_genre = file_name.split(" - ")[2].chomp(".mp3")

    artist = Artist.find_or_create_by_name(split_artist)
    genre = Genre.find_or_create_by_name(split_genre)

    new_song = self.new(song, artist, genre)
    new_song
  end

  def self.create_from_filename(file_name)
    song = file_name.split(" - ")[1]
    split_artist = file_name.split(" - ")[0]
    split_genre = file_name.split(" - ")[2].chomp(".mp3")

    found_artist = Artist.find_or_create_by_name(split_artist)
    found_genre = Genre.find_or_create_by_name(split_genre)
    new_song = self.create(song)


    new_song.artist = found_artist
    new_song.genre = found_genre
    new_song
  end

end
