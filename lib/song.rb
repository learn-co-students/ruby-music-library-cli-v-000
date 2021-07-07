require "pry"
class Song
  extend Concerns::Findable

  @@all = []

  attr_accessor :name

  def initialize(name, artist= nil, genre= nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def self.all
    @@all
    #binding.pry
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist
    @artist
  end

  def genre
    @genre
  end

  def genre=(genre)
    if @genre == nil
      @genre = genre
    else
      @genre = @genre
    end
    if self.genre != nil
      @genre.add_song(self)
    end
    @genre
  end

  def artist=(artist)
      if @artist == nil
        @artist = artist
      else
        @artist = @artist
      end
      if self.artist != nil
        @artist.add_song(self)
      end
      @artist
  end

  def self.new_from_filename(name)
    song_name = name.split(" - ")[1]
    artist_name = name.split(" - ")[0]
    genre_name = name.split(" - ")[2].chomp(".mp3")
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(name)
    song = new_from_filename(name)
    song.save
    song
  end

end
