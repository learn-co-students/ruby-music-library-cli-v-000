require 'pry'

class Song
extend Concerns::Findable
attr_accessor :name
  @@all = []

  def genre= (genre)
    @genre = genre
    until genre.songs.include?(self)
      genre.songs << self
    end
  end

  def genre
    @genre
  end

  def artist= (artist)
      @artist = artist
      artist.add_song(self)
  end

  def artist
    @artist
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.name = name
    if artist != nil
       self.artist = artist
    end
    if genre != nil
      self.genre=(genre)
    end
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
    name = self.new(name)
    name.save
    name
  end

  def self.new_from_filename(file)
    parsed = file.gsub(".mp3","").split(" - ")
    song_name = parsed[1]
    song = self.find_or_create_by_name(song_name)
    artist = Artist.find_or_create_by_name(parsed[0])
    genre = Genre.find_or_create_by_name(parsed[2])
    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    new_song.save
    new_song
  end
end
