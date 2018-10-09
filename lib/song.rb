class Song
  attr_accessor :name, :artist, :genre

  

  @@all = []

  def initialize(name, artist=nil)
    @name = name
    
    
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
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
    file = filename.chomp(".mp3").split(" - ")
    song = Song.create(file[1])
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2])
    song
  end


  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

 
end