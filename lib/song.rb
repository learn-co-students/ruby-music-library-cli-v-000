class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.new_from_filename(filename)
    names = filename.split(" - ")
    new_song = self.new(names[1])
    new_song.artist = Artist.find_or_create_by_name(names[0])
    new_song.genre = Genre.find_or_create_by_name(names[2].gsub(".mp3", ""))
    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end


  def self.destroy_all
    @@all.clear
  end
end
