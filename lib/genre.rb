class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []
 
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  #resets the @@all class variable to an empty array
  def self.destroy_all
    @@all.clear
  end

  #adds the genre instance to the @@all class variable
  def save
    @@all << self
  end

  #initializes and saves the genre
  def self.create(name)
    self.new(name).tap{|new_genre| new_genre.save}
  end

  #genres have many artists through songs
  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end
end
