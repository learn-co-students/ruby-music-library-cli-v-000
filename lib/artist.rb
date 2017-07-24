class Artist
  attr_accessor :name, :songs
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def add_song(song)
    song.artist ||= self
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end
<<<<<<< HEAD
 
=======

>>>>>>> 2dbfac2cbce8289218d3409c72fc89f33be75725
end
