require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist unless !artist
    self.genre= genre unless !genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    self.new(name).tap{|song| song.save}
  end

  def artist=(artist)
      @artist = artist unless !!@artist
      artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    all.find{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    search = find_by_name(name)
    if search
      search
    else
      create(name)
    end
  end


end
