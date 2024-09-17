class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable


  @@all = []

  def initialize(name,artist = nil ,genre= nil)
    @name = name
    @artist = artist
    self.artist = artist if artist
    @genre = genre
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

   def genre=(genre)
    @genre = genre
    genre.add_song(self)
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
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(file)
   title = file.split(" - ")[1]
   song = self.new(title)
   artist = file.split(" - ")[0]
   song.artist = Artist.find_or_create_by_name(artist)
   genre = file.split(" - ")[2].gsub(".mp3","")
   song.genre = Genre.find_or_create_by_name(genre)
   song
 end

 def self.create_from_filename(file)
   song = new_from_filename(file)
   song.save
   song
 end





end
