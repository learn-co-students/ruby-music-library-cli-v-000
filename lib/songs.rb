require "pry"

class Song

  attr_accessor :name, :artist
  attr_reader :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre!=nil
  end

  def self.all 
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def save
    @@all << self
    self
  end
  def self.create(name)
    song = self.new(name)
    song.save
  end
  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre= (genre)
    @genre = genre
    genre.add_song(self)
  end
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.new_by_name(title)
    song = self.create(title)
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new_by_name(title)
    song.save
  end

  def self.find_or_create_by_name(title)
      self.create_by_name(name)
      self.find_by_name(name)
  end

  def self.new_from_filename(file)
    song_info = file.split(" - ").map {|s| s.gsub(/.mp3$/,"")}
    song = self.new(song_info[1])
    song.artist = Artist.find_or_create_by_name(song_info[0])
    song.genre = Genre.find_or_create_by_name(song_info[2])
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end

end
