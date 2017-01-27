class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.save
    if genre !=nil
      self.genre=(genre)
    end
    if artist !=nil
      self.artist=(artist)
    end
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name)
  end

  def self.new_from_filename(filename)
    splitfile = filename.split(" - ")
    artist = Artist.find_or_create_by_name(splitfile[0])
    genre = Genre.find_or_create_by_name(splitfile[2].chomp(".mp3"))
    name = splitfile[1]
    self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    splitfile = filename.split(" - ")
    genre = Genre.find_or_create_by_name(splitfile[2].chomp(".mp3"))
    name = splitfile[1]
    artist = Artist.find_or_create_by_name(splitfile[0])
    self.new(name, artist, genre)
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

end
