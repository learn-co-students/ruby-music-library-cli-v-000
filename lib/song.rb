class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def artist=(artist)
    if artist.is_a?(Artist)
      @artist = artist
    else
      @artist = Artist.find_or_create_by_name(artist)
    end
    self.artist.add_song(self)
  end

  def genre=(genre)
    if genre.is_a?(Genre)
      @genre = genre
    else
      @genre = Genre.find_or_create_by_name(genre)
    end
    @genre.songs << self if !@genre.songs.include?(self)
  end

  def self.create(name)
     song = self.new(name)
     @@all << song
     song
  end

  def self.new_from_filename(filename)
    filename_split = filename.split(" - ")
    song = self.find_or_create_by_name(filename_split[1])
    song.artist =  filename_split[0]
    song.genre = filename_split[2][0..-5]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
end
