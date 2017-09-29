class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :genre
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
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def artists
    self.songs.collect{|song|song.artist}.uniq
  end

end










# class Genre
#   extend Concerns::Findable
  

# attr_accessor :name, :songs, :genre
#   @@all = []
#   def initialize(name)
#      @name = name 
#      @songs = []
#   end 

#   def self.all
#     @@all
#   end 

#   def self.destroy_all
#     @@all.clear
#   end 

#   def save
#     @@all << self
#   end

#   def self.create(name)
#     new_genre = Genre.new(name)
#     @@all << new_genre
#     new_genre
#   end 


#   def artists
#     self.songs.collect {|genre| genre.artist}.uniq
#   end

# end 