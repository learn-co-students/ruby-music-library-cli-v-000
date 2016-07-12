

class Song
  attr_accessor :name, :artist, :genre

  @@all=[]

  def initialize(name,artist=nil,genre=nil)
    @name=name
    @artist=artist
    self.artist=artist unless artist == nil
    self.genre=genre unless genre == nil
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

  def self.create(name)
    song=self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name ==name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    artist_name=filename.split(" - ")[0]
    song_name=filename.split(" - ")[1]
    genre_name=filename.gsub(".mp3","").split(" - ")[2]
    song=self.new(song_name)
    song.artist_name=artist_name
    song.genre_name=genre_name
    song
  end

  def artist_name=(name)
    self.artist=Artist.find_or_create_by_name(name)
  end

  def genre_name=(name)
    self.genre=Genre.find_or_create_by_name(name)
  end

  def self.create_from_filename(name)
    song=self.new_from_filename(name)
    song.save
    song
  end

end
