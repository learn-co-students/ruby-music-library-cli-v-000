require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if genre != nil
      self.genre = genre
    else
      @genre = nil
    end

    if artist != nil
      self.artist = artist
    else
      @artist = nil
    end

    @@all << self
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
    Song.new(name)
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
    song_by_name = all.select{|song| song.name == name}
    song_by_name[0]
  end

  def self.find_or_create_by_name(name)
    if all.collect{|song| song.name == name}
      existing_song = find_by_name(name)
      existing_song
    else
      new_song = Song.new(name)
      new_song
    end
    #binding.pry
  end

end
