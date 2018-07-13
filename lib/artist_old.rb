# require_relative "../lib/artist.rb"
# require_relative "../lib/song.rb"
#
# class Artist
# 	extend Concerns::Findable
# 	attr_accessor :name, :songs
#
# 	@@all = []
#
# 	def initialize(name)
# 		@name = name
# 		@songs = []
# 	end
#
# 	def save
# 		@@all << self
# 	end
#
# 	def self.all
# 		@@all
# 	end
#
# 	def self.destroy_all
# 		@@all.clear
# 	end
#
# 	def self.create(name)
# 		s = self.new(name)
# 		s.save
# 		s
# 	end
#
# 	def add_song(song)
# 		if song.artist == nil
# 			song.artist = self
# 		end
# 		unless songs.include?(song)
# 			songs << song
# 		end
# 	end
#
# 	def genres
# 		songs.map do |song|
# 			song.genre
# 		end
# 	end
# end



# Refactor this
#
# class Artist
#   attr_accessor :name, :songs
#
#   @@all = []
#
#   def initialize
#
#   end
#
#   def save
#     @@all << self
#   end
#
#   def self.reset_all
#     @@all.clear
#   end
#
#   def self.count
#     @@all.size
#   end
#
#   def self.find_by_name(name)
#     @@all.detect { |artist| artist.name == name }
#   end
#
#   def self.all
#     @@all
#   end
#
# end
