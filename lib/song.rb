class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @songs = []
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s| s.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

  def to_s
    self.name
  end

  def save
    @@all << self
  end

  def self.new_from_filename(file_name)
    array = file_name.split(" - ")
    artist_name = array[0]
    artist = Artist.find_or_create_by_name(artist_name)
    title = array[1]
    genre_name = (array[2].chomp(".mp3"))
    genre = Genre.find_or_create_by_name(genre_name)
    new_song = Song.new(title, artist, genre)
 end

   def self.find_by_name(name)
     self.all.detect do |song|
     song.name == name
     end
   end


 def self.find_or_create_by_name(name)
   self.find_by_name(name) ||
     self.create(name)
 end

   def self.create_from_filename(file_name)
     self.new_from_filename(file_name).save
   end

end
