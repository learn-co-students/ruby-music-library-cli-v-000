# class Artist
# 	extend Concerns::Findable
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
# 		artist=Artist.new(name)
# 		artist.name = name
# 		artist.save
# 		artist
# 	end

	 

# 	def songs
# 		@songs
# 	end

# 	def add_song(song)
# 		 song.artist = self unless song.artist == self
#     	@songs << song unless @songs.include?(song)
# 	end


# 	def genres
# 		self.songs.collect {|song| song.genre}.uniq
# 	end

	

# end

class Artist
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

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

  def to_s
    self.name
  end

  def save
    @@all << self
  end
end

