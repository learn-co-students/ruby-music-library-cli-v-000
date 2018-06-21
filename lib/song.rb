class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def self.find_by_name(name)
    all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.detect {|song| song == self}
      genre
    else
      genre.songs << self
    end
    genre
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end

  def self.all
    @@all
  end

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist)
    song.save
    song
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    artist = Artist.find_or_create_by_name(filename_array[0])
    genre = Genre.find_or_create_by_name(filename_array[2].chomp(".mp3"))
    song = self.new(filename_array[1], artist, genre)
    artist.add_song(song)
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end
end
