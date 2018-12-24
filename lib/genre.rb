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
  
  def self.destroy_all 
    @@all = []
  end

  def save 
    @@all << self
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save 
    new_genre
  end
  def add_song(song)
    if song.genre != self && !songs.include?(song)
      song.genre = self
      @songs << song
    end
  end
  def artists #collect all the artists of a genre
		self.songs.collect do |song|
			song.artist
		end.uniq
	end
end 
