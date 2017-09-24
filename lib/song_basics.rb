require 'pry'

class Song

  attr_accessor :name, :artist, :genre
  @@all = []

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

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    @@all << song
    song
  end

  def artist=(artist)
    if !artist.songs.include?(self)
      artist.add_song(self)
    end
      @artist = artist
  end

  def genre=(genre)
     if !genre.songs.include?(self)
       genre.add_song(self)
     end
       @genre = genre
   end

   def self.find_by_name(name)
     @@all.detect { |song| song.name == name }
   end

   def self.find_or_create_by_name(name)
     existing_song = @@all.detect { |song| song.name == name }
     if existing_song
       return existing_song
     else
       self.create(name)
     end
   end

   def self.new_from_filename(filename)
     song_name = filename.split(" - ")[1]
     artist_name = filename.split(" - ")[0]
     genre_name = filename.split(" - ")[-1].gsub(".mp3", "")
     new_instance = self.new(song_name)
     artist_object = Artist.find_or_create_by_name(artist_name)
     new_instance.artist=(artist_object)
     genre_object = Genre.find_or_create_by_name(genre_name)
     new_instance.genre=(genre_object)
     new_instance
   end

   def self.create_from_filename(filename)
     song_name = filename.split(" - ")[1]
     artist_name = filename.split(" - ")[0]
     genre_name = filename.split(" - ")[-1].gsub(".mp3", "")
     new_instance = self.new(song_name)
     artist_object = Artist.find_or_create_by_name(artist_name)
     new_instance.artist=(artist_object)
     genre_object = Genre.find_or_create_by_name(genre_name)
     new_instance.genre=(genre_object)
     @@all << new_instance
     new_instance
   end
#binding.pry
end
