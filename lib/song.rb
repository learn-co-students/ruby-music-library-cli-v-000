class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def artist=(artist)
    @artist = artist
  end

  def genre=(genre)
    @genre = genre
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    all.detect{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file)
    self.create(file.split("-")[1].split(".")[0].strip)
    self.artist = file.split("-")[0].strip
    self.genre = file.split("-")[2].split(".")[0].strip
    self.save
    self
  end

  def self.create_from_filename(file)
    song = self.create
    song.name = file.split("-")[1].split(".")[0].strip
    song.artist = file.split("-")[0].strip
    song.save
    song
  end
end
