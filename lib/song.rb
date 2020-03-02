require 'pry'

class Song
@@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      artist.add_song(self)
   end
    if genre
      genre.add_song(self)
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
    song = self.all.detect {|song| song.name == name}
    if song == nil
       song = Song.new(name)
       song.save
      end
     return song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name ==name}
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name)
      self.create(name)
  end

    def self.new_from_filename(filename)
      info = filename.split(" - ")
      artist, song_name = info[0], info[1]
      genre = info[2].gsub(".mp3", "")

      song = self.new(song_name)
      song.artist = Artist.find_or_create_by_name(artist)
      song.genre = Genre.find_or_create_by_name(genre)
      song
    end



  def self.create_from_filename(file)
    var = self.new_from_filename(file)
    var.save
  end

end
