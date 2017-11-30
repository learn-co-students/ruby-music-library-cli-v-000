require 'pry'
class Song
  attr_accessor :name, :artist, :genre

  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist
    self.genre= genre if genre
    # if genre != nil && artist != nil
    #   artist.genres << self.genre
    # end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.none? { |s| s == self}
      genre.songs << self
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

  def self.create(song_name)
    song = self.new(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name)
      find_by_name(song_name)
    else
      create(song_name)
    end
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    genre_name = filename.split(" - ")[2][/[^.]+/]

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

end

# song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")
# binding.pry
