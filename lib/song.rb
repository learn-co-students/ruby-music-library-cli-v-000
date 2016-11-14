class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name, artist=nil, genre=nil)
    self.new(name, artist, genre).save
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    artist = Artist.find_or_create_by_name(info[0])
    genre = Genre.find_or_create_by_name(info[2].chomp(".mp3"))
    self.new(info[1], artist, genre)
  end

  def self.create_from_filename(filename)
    info = filename.split(" - ")
    song = self.find_or_create_by_name(info[1])
    song.artist = Artist.find_or_create_by_name(info[0])
    song.genre = Genre.find_or_create_by_name(info[2].chomp(".mp3"))
    song
  end

  def initialize(name, artist=nil, genre=nil)
    self.name = name
    self.artist = artist
    self.genre = genre
  end

  def save
    self.class.all << self unless self.class.all.include?(self)
    self
  end

  def artist=(artist)
    if artist.is_a?(Artist)
      @artist = artist
      artist.add_song(self)
    end
    # if it calls for real enforcement, raise a TypeError (or custom)
  end

  def genre=(genre)
    if genre.is_a?(Genre)
      @genre = genre
      genre.add_song(self)
    end
    # if it calls for real enforcement, raise a TypeError (or custom)
  end

  def full_string
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
end
