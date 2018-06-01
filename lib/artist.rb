


class Artist
	extend Concerns::Findable
	extend Memorable::ClassMethods
	include Memorable::InstanceMethods
	
	attr_accessor :name, :songs

	@@all = [] 

	def self.all 
		@@all
	end


	# def self.destroy_all
	#  all.clear
	# end

	def initialize(name)
	 @name = name 
	 @songs = []
	end

	# def save
	# 	@@all << self
	# end

	# def create(name)
	# 	created_artist = Artist.new(name)
	# 	save(created_artist)
	# 	created_artist
	# end

	def add_song(song)
		@songs << song unless @songs.include?(song)
		song.artist = self if song.artist == nil
	end

	def genres
		genres = @songs.collect {|song| song.genre}.uniq
		genres
	end

	# def self.find_by_name(name)
 #  		@@all.detect?{|artist| artist.name == name}
 #  	end



end



