class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
  	@name = name
  	self.artist = artist if artist
  	self.genre = genre if genre
  end

  def self.all
  	@@all
  end

  def save
  	@@all << self
  end

  def self.destroy_all
  	@@all.clear
  end

  def self.create(name)
  	song = self.new(name)
    self.all << song
  	song
  end

  def artist=(artist)
  	@artist = artist
  	artist.add_song(self)
  end

  def genre=(genre)
  	@genre = genre
  	genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    array = filename.rpartition('.').first.split(" - ")

    new_instance = self.new(array[1])
    new_instance.artist=Artist.find_or_create_by_name(array[0])
    new_instance.genre=Genre.find_or_create_by_name(array[2])

    new_instance
  end

  def self.create_from_filename(filename)
    nu_song = self.new_from_filename(filename)
    self.all << nu_song

    nu_song
  end
end
