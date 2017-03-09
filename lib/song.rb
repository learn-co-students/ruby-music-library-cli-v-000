class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    artist.add_song(self) if @artist
    @genre = genre
    genre.songs << self if @genre
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

  def self.create(song)
    self.new(song).tap { |o| o.save }
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless @genre.songs.include? self
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    parsed_name = filename.split(" - ")

    song = self.new(parsed_name[1]).tap do |o|
      o.artist = Artist.find_or_create_by_name(parsed_name[0])
      o.genre = Genre.find_or_create_by_name(parsed_name[2].chomp(".mp3"))
    end
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename).tap { |o| o.save }
  end

end
