#require_relative "./concerns/findable.rb"
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :genre, :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
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

  def self.create(song_name)
    song = Song.new(song_name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_songs(self) if !genre.songs.include?(self)
  end
=begin
  def self.find_by_name(name)
    @@all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create(name)
    end
  end
=end

  def self.new_from_filename(file)
    parts = []
    parts = file.split(" - ")
    song = parts[1]
    artist_string = parts[0]
    genre_string = parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_string)
    genre = Genre.find_or_create_by_name(genre_string)

    self.new(song, artist, genre)

  end

  def self.create_from_filename(file)
    new_from_filename(file).save
  end

end
