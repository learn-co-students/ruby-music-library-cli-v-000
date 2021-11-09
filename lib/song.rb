class Song
  extend  Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Song.new(name).tap {|s| s.save}
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
   name = filename.split(" - ")[1]
   artist_name = filename.split(" - ")[0]
   genre_name = filename.split(" - ")[2].chomp(".mp3")
   artist = Artist.find_or_create_by_name(artist_name)
   genre = Genre.find_or_create_by_name(genre_name)
   song = Song.new(name, artist, genre)
   song
   end

   def self.create_from_filename(filename)
     self.new_from_filename(filename).save
   end
end
