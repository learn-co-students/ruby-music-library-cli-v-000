require "pry"
class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all=[]
  def initialize(name)
    @name=name
    @songs =[]
    @@all << self

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
    created_genre=self.new(name)
    created_genre.save
    created_genre
  end
  def songs
    @songs
  end
  def add_song(song)
    if ! (@songs.include? (song))
      @songs << song
      song.genre = self
    end
  end
  def artists
    array=@songs.select {|song|  song.artist != nil}
    array1=array.map{|song| song.artist}
    array2=array1.uniq
  end

end
