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

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1]
    genre = filename.split(" - ")[2].gsub(".mp3", "")

    # song = find_by_name(name)
    # song = self.new(name)

    song.artist=(artist)
    song.genre=(genre)
    song
  end

  def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
  end

end
