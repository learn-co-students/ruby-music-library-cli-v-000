class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist_name = "", genre_array = "")
    @name = name
    @artist = artist_name || ""
    @genre_array = genre_array ||  ""

    artist_name.add_song(self) if @artist != ""
    genre_array.add_song(self) if genre_array != ""
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    split_file = filename.split(" - ")
    song = self.new(split_file[1], Artist.find_or_create_by_name(split_file[0]), Genre.find_or_create_by_name(split_file[2].split(".")[0]))
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
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
end