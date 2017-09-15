require 'pry'

class Song
  # inherit find_by_name && find_or_create_by_name methods
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []


  # Initialize #

  # Set name to argument, instance.artist = artist, instance.genre = genre
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  # Assign artist if initialized without one
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist === nil
  end

  # Assign genre if initialized without one
  # Add the genre to list of genre.songs if not found
  def genre=(genre)
    @genre = genre
    if genre != nil && !genre.songs.include?(self)
      genre.songs << self
    end
  end


  # Instance Methods #
  def save
    @@all << self
    self
  end


  # Class Methods #
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
  end

  # Parse filename, slice off file extension
  # Call Findable module methods on each distinct Class
  # Create new Song instance, assign artist, genre to Song instance if not exist
   def self.new_from_filename(filename)
    filename_data = filename.slice(0..-5).split(" - ")

    new_song = self.find_or_create_by_name(filename_data[1])
    new_song.artist = Artist.find_or_create_by_name(filename_data[0])
    new_song.genre = Genre.find_or_create_by_name(filename_data[2])
    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end


end
