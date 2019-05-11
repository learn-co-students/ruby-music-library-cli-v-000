class Song
  attr_accessor :name, :artist, :genre

  extend Concerns::Findable
  extend Concerns::Findable::ClassMethods

  @@all =[]

  def initialize(name, artist=nil, genre=nil)
    self.name = name
    self.artist = artist unless artist==nil
    self.genre = genre unless genre==nil
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
    song = Song.new(name)
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
    file = filename.chomp(".mp3").split(" - ")
    song = Song.create(file[1])
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2])
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end


end
