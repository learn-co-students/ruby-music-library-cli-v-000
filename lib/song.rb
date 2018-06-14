require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  @@all = []


  def initialize(name, artist=nil, genre=nil)
    @name = name

    if genre != nil
    self.genre = genre
    end

    if artist != nil
    self.artist = artist
    end
  #  binding.pry

  end

  def genre=(genre)
#    binding.pry
    if genre == nil
      return nil
    elsif genre.songs == nil
          genre.songs << self
    elsif genre.songs.include?(self)
    else
      genre.songs << self
    end

    @genre = genre
  end

  def genre
    @genre
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
#    binding.pry
  end


  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song =self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect do
      |song| song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
      sfilename = filename[0..-5].split(" - ")
      artist = Artist.find_or_create_by_name(sfilename[0])

      genre = Genre.find_or_create_by_name(sfilename[2])
      song = self.new(sfilename[1],artist,genre)
      song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
