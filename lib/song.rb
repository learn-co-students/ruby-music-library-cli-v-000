class Song
  attr_accessor :name
  attr_reader  :artist, :genre

  extend Concerns::Findable
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.genre=(genre) if genre
    self.artist=(artist) if artist
    @name = name
  end

  def self.all
    @@all
  end


  def self.destroy_all
   Song.all.clear
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
    @artist = artist
   artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    files = Song.new(filename.split(" - ")[1])
    files.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    files.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].gsub(".mp3",""))
    files
  end

  def self.create_from_filename(filename)
    files = Song.new_from_filename(filename)
    files.save
    files
  end

  
end