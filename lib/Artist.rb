class Artist
	extend Concerns::Findable
	attr_accessor :name, :songs, :genres
	@@all = []



	def initialize(name)
		@name = name
		@songs = []
	end

  def genres
    x = []
    @songs.each {|song|
      x << song.genre
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
		x = Artist.new(name)
		x.save
    x
	end

	def add_song(song)
    if @songs.include?(song) == false
		  @songs << song
    end
    if song.artist != self
		  song.artist = self
    end
    if self.genres.include?(song.genre) == false
		  self.genres << song.genre
    end
	end


end