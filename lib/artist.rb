class Artist

  attr_accessor :name, :songs

<<<<<<< HEAD
  @@all= []
=======
  attr_accessor :name, :songs
>>>>>>> 6197a1617fb2d89b09bd81d034e133eed61f6d13

  extend Concerns::Findable

<<<<<<< HEAD
  def initialize(name)
    @name= name
    @songs= []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist= self unless song.artist== self
=======
  def initialize(name, artist = nil)
    @name = name
    @songs = []
  end

  def songs
    @songs
>>>>>>> 6197a1617fb2d89b09bd81d034e133eed61f6d13
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
<<<<<<< HEAD
  end

  def self.create(name)
    artist= Artist.new(name)
    artist.save
    artist
  end

  def genres
    self.songs.collect  do |song|
    song.genre
  end.uniq
end

def to_s
  self.name
end
=======
  end

  def self.create(artist)
    artist = Artist.new(artist)
    @@all << artist
    artist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
   self.songs.collect {|s| s.genre}.uniq
 end

 def to_s
   self.name
 end
>>>>>>> 6197a1617fb2d89b09bd81d034e133eed61f6d13
end
