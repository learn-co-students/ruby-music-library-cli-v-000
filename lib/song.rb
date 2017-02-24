require 'pry'

class Song
<<<<<<< HEAD

  attr_accessor :name, :artist, :genre
=======
extend Concerns::Findable
  attr_accessor :name, :artist, :genre

@@all = []
>>>>>>> 6197a1617fb2d89b09bd81d034e133eed61f6d13

  @@all= []

<<<<<<< HEAD
  def initialize(name, artist= nil, genre= nil)
    @name= name
    self.artist= artist if artist
    self.genre= genre if genre
  end

=======
>>>>>>> 6197a1617fb2d89b09bd81d034e133eed61f6d13
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
<<<<<<< HEAD
  end

  def save
    @@all << self
  end

  def self.create(name)
    song= Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist= artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre= genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    parts= filename.split(" - ")
    song= self.new(parts)
    song.name= parts[1]
    song.artist_name= parts[0]
    song.genre_name= parts[2].gsub(".mp3", "")
    song
  end

  def artist_name=(artist_name)
    self.artist= Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
  end

  def genre_name=(genre_name)
    self.genre= Genre.find_or_create_by_name(genre_name)
    genre.add_song(self)
  end

  def self.create_from_filename(filename)
    parts= filename.split(" - ")
    song= self.create(parts)
    song.name= parts[1]
    song.artist_name= parts[0]
    song.genre_name= parts[2].gsub(".mp3", "")
    song
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
=======
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
   new(name, artist, genre).tap{|s| s.save}
 end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
end

#


def self.new_from_filename(filename)
  parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    self.new(song_name, artist, genre)

  end

    def self.create_from_filename(filename)
        parts = filename.split(" - ")
        artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        self.create(song_name, artist, genre)
      end

      def to_s
  "#{self.artist.name} - #{self.name} - #{self.genre.name}"
end
>>>>>>> 6197a1617fb2d89b09bd81d034e133eed61f6d13
end
