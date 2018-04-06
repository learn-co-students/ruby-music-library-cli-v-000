# class Genre
#
#   extend Concerns::Findable
#
#
#   attr_accessor :name
#
#   @@all = []
#
#   def initialize(name)
#     @name = name
#     @songs = []
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.destroy_all
#     @@all.clear
#   end
#
#   def save
#     @@all << self
#   end
#
#   def self.create(name)
#     x = Genre.new(name)
#     x.save
#     x
#     # binding.pry
#   end
#
#   def songs
#     @songs
#   end
#
#   def artists
#     @artists = []
#     self.songs.each do |song|
#       @artists << song.artist unless @artists.include?(song.artist)
#     end
#     @artists
#   end
#
#
# end
