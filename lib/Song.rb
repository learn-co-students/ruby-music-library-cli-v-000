class Song

  extend Concerns::Findable

  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    if artist
      artist.add_song(self)
    end
    if genre
      genre.add_song(self)
    end
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

def self.create(name)
    new(name).tap{|x| x.save}
  end

  def genre
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.find{|n| n.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    genre.gsub!(".mp3","")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    self.new(song, artist, genre)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

 def self.create_from_filename(filename)
     song = new_from_filename(filename)
     song.save
     song
   end
  end
