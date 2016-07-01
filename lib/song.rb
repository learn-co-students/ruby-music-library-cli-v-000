require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
    artist.add_song(self)
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

  def self.create(song_name)
    song = Song.new(song_name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist

    artist.songs << self
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)

      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    genre_to_split = filename.split(" - ")[2]
    genre = genre_to_split.split(".")[0]
    song = @@all.detect{|a| a.artist == artist}
    if song.nil?
      song = Song.new(name)
      @artist = Artist.new(artist)

      song.artist = @artist

      @genre = Genre.new(genre)
      song.genre = @genre
#"Thundercat - For Love I Come - dance.mp3"    

   end
    song

  end


  def self.create_from_filename(filename)
    name = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    genre_to_split = filename.split(" - ")[2]
    genre = genre_to_split.split(".")[0]

    found = self.all.detect{|a| a.artist == artist}
    if found.nil?
      found = Song.create(name)

      @artist = Artist.create(artist)

      found.artist = @artist
      @genre = Genre.create(genre)
      found.genre = @genre

      # found


   end
    found




  end






end
