class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      @artist = artist
      self.artist.add_song(self)
    end

    if genre != nil
      @genre = genre
      self.genre.add_song(self)
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

  def artist=(artist)
    @artist = artist if self.artist != artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre if self.genre != genre
    self.genre.add_song(self)
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    return song
  end

  def self.new_from_filename(filename)
    @song_data = filename.split (" - ")
    song = Song.new(@song_data[1], Artist.find_or_create_by_name(@song_data[0]), Genre.find_or_create_by_name(@song_data[2].sub(".mp3", "")))
    return song
  end

  def self.create_from_filename(filename)
    @song_data = filename.split (" - ")
    song = Song.new(@song_data[1], Artist.find_or_create_by_name(@song_data[0]), Genre.find_or_create_by_name(@song_data[2].sub(".mp3", "")))
    song.save
    return song
  end

end
