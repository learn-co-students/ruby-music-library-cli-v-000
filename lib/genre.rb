class Genre
  attr_accessor :name             #retrieves the name of a genre and sets a new name
  attr_reader :songs              #returns the genre's 'songs' collection
  extend Concerns::Findable       #extends the Concerns::Findable module class methods
  @@all = []              #genre @@all is initialized as an empty array

  def initialize(name)    #accepts a name for the new genre
    @name = name
    @songs = []           #initialize a songs property set to an empty array
  end

  def self.all            #returns the class variable @@all
    @@all
  end

  def self.destroy_all    #resets the @@all class variable to an empty array
    @@all.clear
  end

  def save                #adds the Genre instance to the @@all class variable
    @@all << self
  end

  def self.create(instance)     #Genre.create initializes and saves the genre instance to @@all
    genre = Genre.new(instance)
    genre.save
    genre
  end

  def artists                                    #returns a collection of artists for all of the genre's songs and collects artists through its songs instead of maintaining its own @artists instance variable
    self.songs.map {|song| song.artist}.uniq     #does not return duplicate artists if the genre has more than one song by a particular artist
  end
end


# rspec --f-f
