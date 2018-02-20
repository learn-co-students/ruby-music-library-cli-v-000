require_relative '../config/environment'

class Song

  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist= artist
    end
    if genre
      self.genre= genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all <<  self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre= genre
    genre.songs= self
  end


  #def self.find_or_create_by_name(song_name)
  #  song_match = find_by_name(song_name)
  #  if song_match == nil
  #    song_match = Song.create(song_name)
  #  end
  #  song_match
  #end

end
