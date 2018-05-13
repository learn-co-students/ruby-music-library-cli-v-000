class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    self.songs = []
  end

  def self.all
    @@all
  end

  #def self.destroy_all
  #  self.all.clear
  #end

  def save
    @@all << self
  end

#  def self.create(name)
#    self.new(name).tap { |genre| genre.save }
#  end

  def songs
    @songs
  end

  def artists
    self.songs.map {|song| song.artist}.uniq
    #@songs.collect do |song|
    #  song.artist
    #end.uniq
  end


end
