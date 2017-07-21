class Song

  #setter and getters, readers and writers
  attr_accessor :name, :artist, :genre

  #class variable set to empty array
  @@all = []

  #initialized with 3 arguments, 2 are optional
  def initialize(name, artist = nil, genre = nil)
    @name = name
    #@artist = artist
    self.artist = artist if artist
    #@genre = genre
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
    @@all.clear
  end

  #saves each class instance
  def save
    self.class.all << self
  end

  #class method, creates new song and saves new song
  def self.create(song)
    new_song = self.new(song)
    new_song.save
    new_song
  end

  #class method, finds class song in class variable, interates until name = name
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  #class method, add on to self.find_by_name - creates new song if song is not detected
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  
  def self.new_from_filename(filename)
    filename_song = self.new(filename.split(" - ")[1])
    filename_song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    filename_song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
    @@all << filename_song
    filename_song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
  end
end
