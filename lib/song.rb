class Song
  attr_accessor :name, :artist, :genre

  @@all=[]

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist=artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    genre.songs<<self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
  end

  def self.create(song)
    newsong= Song.new(song)
    newsong.save
    newsong
  end

def self.find_by_name(name)

  self.all.detect {|song| song.name == name}
end

def self.find_or_create_by_name(name)

   find_by_name(name) || create(name)
 end

def self.new_from_filename(file)
  splitfile=file.gsub(".mp3","").split(" - ")

  artist=Artist.find_or_create_by_name(splitfile[0])
  genre=Genre.find_or_create_by_name(splitfile[2])
  Song.new(splitfile[1],artist,genre)
end

def self.create_from_filename(file)
    new_song=new_from_filename(file)
    new_song.save
end

end
