
class Song
  attr_accessor :name, :artist, :genre, :file_name

  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist= artist unless artist.nil?
    self.genre= genre unless genre.nil?
  end

  def save
    self.class.all << self
  end

  def self.new_from_filename(file_name)
    files = file_name.split(" - ")
    genre = files[2].gsub(".mp3", "")
    if Song.find_by_name(files[1]).nil?
      song = Song.new(files[1], Artist.find_or_create_by_name(files[0]),
      Genre.find_or_create_by_name(genre))
      # song.artist = Artist.find_or_create_by_name(files[0])
      # files[2].slice!(".mp3")
      # song.genre = Genre.find_or_create_by_name(files[2])
    end
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil?
      self.create(name)
    else
      self.find_by_name(name)
    end
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

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
end
