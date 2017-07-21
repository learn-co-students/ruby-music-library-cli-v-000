class Song

  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @artist = artist
    @name = name
    @genre = genre
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def name
    "#{@name}"
  end

  def self.all
    @@all
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
   genre.songs << self unless genre.songs.include?(self)
 end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
  end

  def self.find(name)
    self.all.detect {|song| song.name == name }
  end
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name }
  end

  def self.new_from_filename(filename)
     array = filename.split(" - ")
     artist_name, song_name, genre_name = array[0], array[1], array[2].gsub(".mp3", "")
     artist = Artist.find_or_create_by_name(artist_name)
     genre = Genre.find_or_create_by_name(genre_name)
     self.new(song_name, artist, genre)
   end

   def self.create_from_filename(filename)
       new_from_filename(filename).tap{ |s| s.save }
   end

  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre).tap {|song| song.save}
  end

  def self.destroy_all
    @@all.clear
  end

  def to_s
   self.name
 end

end
