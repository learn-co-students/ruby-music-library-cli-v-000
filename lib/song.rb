class Song
  attr_accessor :artist, :genre, :name
  extend Concerns::Findable
  @@all = []

  def initialize(new_song_name, artist= nil, genre= nil)
    @name = new_song_name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def save
      @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name) #class method creates & stores instances vs initializing
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
    genre.add_song(self)
  end

  def self.find_by_name(name)   #method finds first match of song property name with name arugment
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)   #class method uses find/create class
    if find_by_name(name).nil?            #methods to detect or create instances
      create(name)                   #self.detect(name) ? self.detect(name) : self.create(name)
    else
      find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    file = filename.chomp(".mp3").split(" - ")
    song = Song.new(file[1])
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2])
    song.save
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

end
