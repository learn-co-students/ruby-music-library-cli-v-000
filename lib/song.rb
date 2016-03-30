require_relative 'concerns/findable.rb'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    
    # Sets artist and genre. Updates artists and genres to include song if it isn't already included
    if !artist.nil?
      @artist = artist
      artist.add_song(self) if !artist.songs.include?(self)
      artist.genres << genre if !artist.genres.include?(genre)
    end
    if !genre.nil?
      @genre = genre
      genre.songs << self if !genre.songs.include?(self)
      genre.artists << artist if !genre.artists.include?(artist)
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) if !artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
    # Splits info inside filename and stores song artist, song name, and song genre
    song_info = filename.split(" - ")
    song_artist = song_info[0]
    song_name = song_info[1]
    song_genre = song_info[2].gsub!(".mp3", "")

    # Creates instances of artist, genre and song using info from above
    artist = Artist.find_or_create_by_name(song_artist)
    genre = Genre.find_or_create_by_name(song_genre)
    song = Song.new(song_name, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end

end
