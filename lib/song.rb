class Song
  extend Concerns::Findable 
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @songs = []
    @songs << self
    self.artist = artist if artist
    self.genre = genre if genre
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
    # self.new.tap do |i|
    #   i.name = name
    # end



    s = self.new(name)
    s.save
    s

  end


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.detect do |g|
      g.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end




  # def self.new_from_filename(filename)
  #   a = filename.split(" - ")[0]
  #   s = filename.split(" - ")[1]
  #   g = filename.split(" - ")[2]

  #   artist = Artist.find_or_create_by_name(a)
  #   genre = Genre.find_or_create_by_name(g)
  #   self.new(s, a, g)
  # end
 








end
