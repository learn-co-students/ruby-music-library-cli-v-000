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
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Genre.new(name)
    song.save
    song
  end

  def artists
    songs.map{|song| song.artist}.uniq
  end

end


# # require_relative "../lib/artist.rb"
# # require_relative "../lib/song.rb"
# class Genre
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
# 		if song.genre == nil
# 			song.genre = self
# 		end
# 		unless songs.include?(song)
# 			songs << song
# 		end
# 	end
#
# 	def artists
# 		songs.map do |song|
# 			song.artist
# 		end
# 	end
#
#
# end


# class Genre
#     extend Findable # Take all of the methods in the Findable module and add them as class methods
#     extend Persistable::ClassMethods
#     extend Nameable::ClassMethods
#     include Persistable::Instance Methods
#
#     attr_accessor :name, :songs
#
#     @@all = []
#
#     def self.all # Class Reader
#         @@all
#     end
#
#     def initialize
#         save
#         @songs = []
#     end
#
#     # Genres have Artists through Songs. "Has-Many-Through"
#     def artists
#         @songs.collect {|s| s.artist}.uniq
#     end
#
#
# end
