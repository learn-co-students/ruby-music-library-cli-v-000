# Song Class
#
#

class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self 
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
  end

  def artist=(artist)
    @artist = artist unless @artist != nil 
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre 
    @genre
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      song = self.create(name)
    end
    song 
  end

  def self.new_from_filename(filename)
    file = filename.split(' - ')
    file = file.map {|f| f.strip}
    song = self.new(file[1])
    artist = Artist.find_or_create_by_name(file[0])
    genre = Genre.find_or_create_by_name(file[2].chomp('.mp3'))
    song.artist = artist
    song.genre = genre
    song 
  end
 
  def self.create_from_filename(file)
    @@all << self.new_from_filename(file)
  end
  
  
    

  





end


