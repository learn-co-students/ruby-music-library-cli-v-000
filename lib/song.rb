require_relative '../lib/concerns/findable.rb'

class Song

extend Concerns::Findable

attr_accessor :name, :genre, :artist, :song

@@all = []

  def initialize(name,artist="",genre="")
    @name = name
    #@song = name
    if artist != ""
      @artist = artist
      artist.songs << self
    end
    if genre != ""
      @genre = genre
      genre.songs << self
      if artist.genres_collection.include?(genre) == false
        artist.genres_collection << genre
      end
    end
    if (genre !="") && (artist !="")
      if genre.artists_collection.include?(artist) == false
        genre.artists_collection << artist
      end
    end
    save
  end

  def artist=(artist)
    @artist=artist
    if artist.songs.include?(song) == false
      artist.add_song(self)
    end
  end

  def self.create(name)
    Song.new(name)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
     artist = Artist.create(filename.split(" - ")[0])

     genre_mp3 = filename.split(" - ")[2]
     genre_womp3 = genre_mp3.split(".")[0]
     genre = Genre.create(genre_womp3)

     Song.new(filename.split(" - ")[1],artist,genre)

  end

  def self.create_from_filename(filename)
    artist = Artist.create(filename.split(" - ")[0])

    genre_mp3 = filename.split(" - ")[2]
    genre_womp3 = genre_mp3.split(".")[0]
    genre = Genre.create(genre_womp3)

    Song.new(filename.split(" - ")[1],artist,genre)
  end
end
