class Song
  extend Concerns::Findable

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
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(file_name)
    file_elements = file_name.split(/[\-\.]/).map(&:strip)
    song_artist = file_elements[0]
    song_name = file_elements[1]
    song_genre = file_elements[2]
    artist = Artist.find_or_create_by_name(song_artist)
    genre = Genre.find_or_create_by_name(song_genre)
    song = self.new(song_name, artist, genre)
    song
  end

  def self.create_from_filename(file_name)
    song = Song.new_from_filename(file_name)
    song.save
    song
  end

end