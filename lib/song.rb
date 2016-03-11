class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name, artist=nil, genre=nil)
    new(name, artist, genre).tap {|song| song.save}
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

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    new_song = filename.chomp(".mp3").split(" - ")
    new_artist = Artist.find_or_create_by_name(new_song[0])
    new_genre = Genre.find_or_create_by_name(new_song[2])
    self.new(new_song[1], new_artist, new_genre)
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename).tap{|song| song.save}
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def to_s
    self.name
  end

end
