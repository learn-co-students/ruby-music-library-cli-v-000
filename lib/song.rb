require 'pry'
class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = "", genre = "")
    @name = name
    @artist = artist

    if genre.is_a? Genre
      genre.songs << self
      @genre = genre
    end

    if artist.is_a? Artist
      artist.add_song(self)
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
    new(name).tap { |instance| instance.save}
    #binding.pry
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    if !genre.songs.include?(self)
      genre.songs << self
    end
    @genre = genre
  end

  def self.new_from_filename(file)

    #Parse file name
    file_split = file.split(' - ')
    song_artist = file_split[0]
    song_name = file_split[1]
    song_genre = file_split[2].gsub('.mp3', '')

    #binding.pry
    #find or create objects
    new_song = self.find_or_create_by_name(song_name)
    new_artist = Artist.find_or_create_by_name(song_artist)
    new_genre = Genre.find_or_create_by_name(song_genre)

    #create relationships
    new_song.artist=(new_artist)
    new_song.genre=(new_genre)
    new_song
  end

  def self.create_from_filename(file)
    new_from_filename(file)
  end
end

Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")
