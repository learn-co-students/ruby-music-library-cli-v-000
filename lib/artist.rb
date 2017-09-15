class Artist
	extend Concerns::Findable

	attr_accessor :name, :songs
	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def genres
		songs.collect{|o| o.genre}.uniq
	end

	def add_song(song)
		song.artist = self unless song.artist
		songs << song unless songs.include?(song)
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
		new(name).tap{ |a| a.save }
	end

	
	def self.create_by_name(name)
		self.new.tap do |o|
			o.name =name
		end
	end





end
