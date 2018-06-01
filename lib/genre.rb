



class Genre

	extend Concerns::Findable
	extend Memorable::ClassMethods
	include Memorable::InstanceMethods


	
	attr_accessor :name, :songs

	@@all = [] 

	def self.all 
	 @@all
	end 

# 	def self.destroy_all
# 	  all.clear
# 	end

	def initialize(name)
	 @name = name 
	 @songs = []
	end

	# def save
	# 	@@all << self
	# end

	# def create(name)
	# 	created_genre = Genre.new(name)
	# 	save
	# 	created_genre
	# end


	def artists
		artists = @songs.collect {|song| song.artist}.uniq
		artists
	end

	# def self.find_by_name(name)
 #  		@@all.detect{|genre| genre.name == name}
 #  	end

end



