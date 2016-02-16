require 'pry'
class Song
  #extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
    self
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ") # data[0]: artist, data[1]: song, data[2]: genre
    artist = Artist.find_or_create_by_name(data[0])
    genre = Genre.find_or_create_by_name(data[2].split(".")[0])  # take off the ".mp3" by splitting with "." delimiter
    song = Song.new(data[1], artist, genre)
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ") # data[0]: artist, data[1]: song, data[2]: genre
    if data.size != 3
      puts "Filename format not correct."
      return nil
    end
    artist = Artist.find_or_create_by_name(data[0])
    genre = Genre.find_or_create_by_name(data[2].split(".")[0])  # take off the ".mp3" by splitting with "." delimiter
    song = Song.create(data[1], artist, genre)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name, artist=nil, genre=nil)
    myobj = self.new(name, artist, genre)
    @@all << myobj
    myobj
  end

  def artist=(artist)
   if @artist != artist
     @artist = artist
   end
   artist.add_song(self)
   artist
  end

  def genre=(genre)
   if @genre != genre
     @genre = genre
   end
   genre.add_song(self)
   genre
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    foundsong = @@all.find {|song| song.name == name}
    if foundsong == nil
      self.create(name)
    else
      foundsong
    end
  end



end
