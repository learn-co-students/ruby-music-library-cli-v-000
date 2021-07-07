require 'pry'
class Song
  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
    if artist != nil
      artist.songs << self
    end
    if genre != nil
      genre.songs << self
    end
  end
  def artist=(artist)
    @artist = artist
    if artist != nil
      artist.add_song(self)
    end
  end
  def genre=(genre)
    @genre = genre
    if genre != nil
      if genre.songs.include?(self) != true
        genre.songs << self
      end
    end
  end

  def save
    @@all << self
  end
  def self.all
    return @@all
  end
  def self.destroy_all
    @@all = []
  end
  def self.create(name)
    song = Song.new(name)
    song.save
    return song
  end
  def Song.find_by_name(aname)
    @@all.each do |song|
      if song.name == aname
        return song
      end
    end
    return nil
  end
  def Song.find_or_create_by_name(name)
    match = Song.find_by_name(name)
    if match != nil
      return match
    end
    Song.create(name)
  end
  def self.new_from_filename(file)
    array = file.split(" - ")
    genre = Genre.find_or_create_by_name(array[2].split(".mp3")[0])
    artist = Artist.find_or_create_by_name(array[0])
    song = Song.new(array[1],artist,genre)
    song.artist.add_song(song)
    song.genre.songs << song
    return song
  end
  def self.create_from_filename(file)
    song = Song.new_from_filename(file)
    song.save
    return song
  end
end
