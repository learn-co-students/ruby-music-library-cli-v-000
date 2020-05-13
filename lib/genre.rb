class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Genre.new(name)
  end

  def songs
    @songs
  end

  def add_song(song)
     song.genre = self unless song.genre
     songs << song unless songs.include?(song)
   end

   def artists
     self.songs.map{|song| song.artist if song.genre == self}.uniq
   end

end
