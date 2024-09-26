class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists
  @@all = []


  def initialize(genre)
    @name = genre
    @songs = []

  end

  def artists
    x = []
    @songs.each {|song|
      x << song.artist
      }
    x.uniq!
    x
  end

	def save
		@@all << self
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def self.create(name)
		x = Genre.new(name)
		x.save
    x
	end
end