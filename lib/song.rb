class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
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
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    unless self.artist == artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
      @genre = genre
      genre.add_song(self)
  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
   find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
   artist_name = filename.split(" - ")[0]
   song_name = filename.split(" - ")[1]
   genre_name = filename.split(" - ")[2].chomp(".mp3")
   artist = Artist.find_or_create_by_name(artist_name)
   genre = Genre.find_or_create_by_name(genre_name)
   Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save[0]
  end


end