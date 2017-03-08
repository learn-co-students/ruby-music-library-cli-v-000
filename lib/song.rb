class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @artist.add_song(self) if @artist
    @genre = genre
    @genre.songs << self if @genre
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
    this_song = self.new(song)
    this_song.save
    this_song
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include? self
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

  def parse(filename)
    parsed_name = filename.split(" - ")
    @parsed_song = parsed_name[1]
    @parsed_artist = parsed_name[0]
    @parsed_genre = parsed_name[2]
  end

  def self.new_from_filename(filename)
    parsed_name = filename.split(" - ")

    song = self.new(parsed_name[1])
    song.artist = Artist.find_or_create_by_name(parsed_name[0])
    song.genre = Genre.find_or_create_by_name(parsed_name[2].chomp(".mp3"))
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
