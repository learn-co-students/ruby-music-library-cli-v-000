class Genre
  attr_accessor :name
  @@all = []
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def artists
    artists = self.songs.map do |x| x.artist
    end
    artists.uniq
  end


  def save
    @@all << self 
  end

  def self.destroy_all
    @@all.clear
    @@all
  end

  def self.create(new_name)
  new_genre = self.new(new_name)
  @@all << new_genre
  new_genre
  end

  def self.all
    @@all
  end


end
