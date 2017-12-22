#require_relative './concerns/artist_and_genre_methods'

class Genre
extend Concerns::Findable
# include Concerns::InstanceMethods
  attr_accessor :name, :songs


  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end


  def self.create(name)
    name = self.new(name)
    name.save
    name
  end

  def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end



end
