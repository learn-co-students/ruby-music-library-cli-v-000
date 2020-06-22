require 'pry'

class Song
  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist = nil, genre=nil)
    @name = name
    self.artist = artist if artist #instance artist is the one input if it has an artist
    self.genre = genre if genre
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

  def self.create(name, artist=nil, genre=nil)
    s = Song.new(name, artist)
    s.save
    s
  end


#  Song and Artist: Song #artist= invokes Artist#add_song to add itself to
  # the artist's collection of songs (artist has many songs)

  def artist=(artist)

		if artist == nil
			@artist = artist
		elsif artist != nil
			@artist = artist
			artist.add_song(self)
		end
	end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file)
    a = file.split(" - ")

    artname, songname, genrename = a[0], a[1], a[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artname)
    genre = Genre.find_or_create_by_name(genrename)

    #binding.pry

    self.new(songname, artist, genre)
  end

  def self.create_from_filename(file)
    s = new_from_filename(file)
    s.save
  end







end
