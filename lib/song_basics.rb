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

end
