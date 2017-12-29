require 'pry'

class Song




  attr_accessor :name, :artist, :genre

  @@all = []


  def initialize(name, artist = nil, genre = nil)
    @name = name
    # @@all << self
    self.artist = artist if artist
    self.genre = genre if genre

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
    x = Song.new(name)
    x.save
    x
  end

  def artist=(artist)
    @artist = artist
    # artist = Artist.new(artist)
    artist.add_song(self)
    # binding.pry

  end

  # binding.pry

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
    # binding.pry
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    x = self.find_by_name(name)
    if x == nil
      self.create(name)
    else
      x
    end

   end


  def self.new_from_filename(filename)
    # use regex, snip off the .mp3 at the end and break the string into three pieces,
    # using the first (by index number maybe) to set to song.artist, etc.
    f = filename.gsub(".mp3","")
    f = f.split(" - ")
    # binding.pry
    # x = Song.new("#{f[1]}", "#{f[0]}", "#{f[2]}")

    # binding.pry
    artist = Artist.find_or_create_by_name("#{f[0]}")
    # binding.pry
    genre = Genre.find_or_create_by_name("#{f[2]}")
    Song.new("#{f[1]}", artist, genre)
    
    # binding.pry
  end

  def self.create_from_filename(filename)
    x = self.new_from_filename(filename)
    x.save
    x
  end
end
