require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name,artist=nil,genre=nil)
    @name = name
    # @artist = artist
    self.artist=(artist) if !artist.nil?
    # @genre = genre
    self.genre=(genre) if !genre.nil?
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    song = self.all.select {|song| song.name == name}
    if song.length() > 0
      song[0]
    end
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if !song
      self.create(name)
    else
      song
    end
  end

  def self.new_from_filename(name)
    song_parts = name.split(' - ')

    song = self.create(song_parts[1])
    song.artist=(Artist.find_or_create_by_name(song_parts[0]))
    song.genre=(Genre.find_or_create_by_name(song_parts[2].gsub(".mp3","")))

    song
  end

  def self.create_from_filename(name)
    if !self.find_by_name(name.split(' - ')[1])
      song = self.new_from_filename(name)
      song
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

end
