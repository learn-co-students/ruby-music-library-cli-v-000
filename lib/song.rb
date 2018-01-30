class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    self.save
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

  def self.create(name, artist=nil, genre=nil)
    Song.new(name, artist, genre)
  end



  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.create_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    genre = genre.gsub(".mp3", "")
    artist_name = Artist.find_or_create_by_name(artist)
    genre_name = Genre.find_or_create_by_name(genre)
    self.create(song, artist_name, genre_name)

  end

  def self.new_from_filename(filename)
   artist, song, genre = filename.split(" - ")
   genre = genre.gsub(".mp3", "")
   artist_name = Artist.find_or_create_by_name(artist)
   genre_name = Genre.find_or_create_by_name(genre)
   self.new(song, artist_name, genre_name)

end


def to_s
   "#{self.artist.name} - #{self.name} - #{self.genre.name}"
 end


end
