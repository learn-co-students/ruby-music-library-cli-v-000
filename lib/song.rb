require_relative '../config/environment'

class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

########## Instance Methods ##########

  def initialize(name, artist=nil, genre=nil)
    @name = name
    #Send to artist= and genre= only if not nil A.K.A, user specified.
      self.artist = artist if artist != nil
      self.genre = genre if genre != nil
  end

  def artist=(artist) #sets song artist for this instance and adds self to artist's songs
      @artist = artist
      artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre) #sets song genre for this instance and adds self to genre's songs
      @genre = genre
      genre.add_song(self) unless genre.songs.include?(self)
  end

  def save #saves song to the all encompassing class array that stores all the songs ever created
    self.class.all << self
  end

########## Class Methods ##########

  def self.all #returns the class array
    @@all
  end

  def self.create(name) #constructor to simultaneously create AND save the song
    Song.new(name).tap {|new_instance| new_instance.save}
  end

  def self.new_from_filename(filename) #takes a filename, chop it up, finds or creates the artist & genre, then associates them to a new song
      song_data = filename.gsub(".mp3","").split(" - ")

      name = song_data[1]
      artist = Artist.find_or_create_by_name(song_data[0])
      genre = Genre.find_or_create_by_name(song_data[2])

      Song.new(name, artist, genre)
  end

  def self.create_from_filename(filename) #same as above but saves the song as well
    new_from_filename(filename).tap {|file| file.save}
  end

end
