# class Genre
# 		extend Concerns::Findable
# 	attr_accessor :name, :songs

# 	@@all = []

# 	def initialize(name)
# 		@name = name
# 		@songs = []

# 	end

# 	def self.all
# 		@@all
# 	end

# 	def self.destroy_all
# 		self.all.clear
# 	end

# 	def save
# 		self.class.all << self
# 	end


# 	def self.create(name)
# 		genre=Genre.new(name)
# 		genre.name = name
# 		genre.save
# 		genre
# 	end

# 	def artists
# 		self.songs.collect {|song| song.artist}.uniq
# 	end


# end


class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end

  def to_s
    self.name
  end
  
  def save
    @@all << self
  end
end