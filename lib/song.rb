require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    if @artist != nil && @artist.class != Array
       @artist.songs << self
    end
    if @genre != nil && @genre.class != Array
      @genre.songs << self
    end
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(name)
    @genre = name
    @genre.songs << self
  end

  def self.create(name)
    newb = self.new(name)
    @@all << newb
    newb
  end

  def self.print_all
    self.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def self.all
    if @@all.uniq == @@all
      @@all
    else
      @@all.uniq!
    end
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(nameval)
    self.all.detect {|a| a.name == nameval}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create(name)
    end
  end
  
  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    gen_name = filename.split(" - ")[2]
    gen_name = gen_name.split(".")[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(gen_name)
    song = self.new(name, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    x = self.new_from_filename(filename)
    @@all << x 
    x
  end
end
