class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    save
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

  def self.create(name)
    Song.new(name)
  end 

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end  

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end  

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end 

  def self.new_from_filename(file_name)
    array = file_name.split(" - ")
    artist = Artist.find_or_create_by_name(array[0])
    genre = Genre.find_or_create_by_name(array[2].gsub(".mp3", ""))
    Song.new(array[1], artist, genre)
  end  

  def self.create_from_filename(file_name)
    Song.new_from_filename(file_name)
  end
end  