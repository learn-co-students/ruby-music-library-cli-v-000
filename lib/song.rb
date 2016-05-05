require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end

  def self.new_from_filename(file)
    parts = file.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist_name, genre_name)
  end

  def artist=(artist)
    @artist = artist
    #artist.songs << self    #ask question, why need both VVV
    artist.add_song(self)
  end
  def add_song

  end
  def genre=(genre)
    @genre = genre

    genre.songs << self unless genre.songs.include?(self)

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

  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end


end
