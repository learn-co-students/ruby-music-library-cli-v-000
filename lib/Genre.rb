class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def artists
    @artists = []
    @songs.collect do |song|
      if @artists.include?(song.artist) == false
        @artists << song.artist
      end
    end
    @artists
  end
  
  def self.find_or_create_by_name(genre_name)
    if self.find_by_name(genre_name)
      self.find_by_name(genre_name)
    else
      self.create(genre_name)
    end
  end
  
  def self.find_by_name(genre_name)
    @@all.detect {|i| i.name == genre_name}
  end
  
  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.all
    @@all
  end
end