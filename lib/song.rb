require 'pry'

class Song
attr_accessor :name
attr_reader :genre, :artist

  @@all = []

  def initialize (name, artist= nil, genre= nil)
    @name = name
  #  artist?(!nil)
  #    self.artist if artist


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

 def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    name = self.new(name)
    name.save
    name
  end

 def genre=(genre)
   @genre = genre
   if self.genre.songs.count(self) == 0
      self.genre.songs << self

    end
 end

  def artist=(artist)
   @artist = artist
   artist.add_song(self)
  end

  def find_by_name(song)
  #  @@all.find do |song| == song
  #    puts song
  #  end
  end

end
