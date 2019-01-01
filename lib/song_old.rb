# class Song
#     extend Findable # Take all of the methods in the Findable module and add them as class methods
#     extend Persistable::ClassMethods
#     extend Nameable::ClassMethods
#     include Persistable::Instance Methods
#
#     attr_accessor :name, :genre
#
#     def self.all # Class Reader
#         @@all
#     end
#
#     def initialize
#         save
#     end
#
#
# end
#
#
#
# Refactor all the things
#
# class Song
#   attr_accessor :name, :genre, :artist
#
#   @@all = []
#
#   def initialize(name)
#     @name = name
#   end
#
#   def name
#     @name
#   end
#
#   def self.create(name)
#     new_song = self.new(name, artist, genre)
#     new_song.save
#     new_song
#   end
#
#   end
#
#   def save
#     @@all << self
#   end
#
#   def self.destroy_all
#     @@all.clear
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.count
#     @@all.size
#   end
