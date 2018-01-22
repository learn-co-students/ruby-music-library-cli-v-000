# #SongArtist module
# module SongArtists
#   module InstanceMethods
#     def save
#       self.class.all<<self
#     end
#   end
#
#   module ClassMethods
#
#     def create(name)
#       new_instance = self.new(name)
#       new_instance.save
#       self.all[0]
#     end
#
#     def destroy_all
#       self.all.clear
#     end
#   end
# end
#
#
# class MusicImporter
#   attr_accessor :path
#
#   def initialize(path)
#     @path = path
#   end
#
#   def files
#     file_name_array = Dir.entries(self.path)
#     file_name_array.collect do |file|
#       if !file.include?(".mp3")
#         file_name_array.delete(file)
#       end
#     end
#     file_name_array
#
#   end
#
#   def import
#     #binding.pry
#     self.files.collect do |file|
#       Song.create_from_filename(file)
#     end
#   end
# end
#
# #musiclibrarycontroller class
# class MusicLibraryController
#
#   def initialize(path = "./db/mp3s")
#     new_a = MusicImporter.new(path)
#     new_a.import
#
#   end
#
#   def call
#     puts "Welcome to your music library!"
#     puts "To list all of your songs, enter 'list songs'."
#     puts "To list all of the artists in your library, enter 'list artists'."
#     puts "To list all of the genres in your library, enter 'list genres'."
#     puts "To list all of the songs by a particular artist, enter 'list artist'."
#     puts "To list all of the songs of a particular genre, enter 'list genre'."
#     puts "To play a song, enter 'play song'."
#     puts "To quit, type 'exit'."
#     puts "What would you like to do?"
#
#     input = nil
#     until input == "exit"
#       input = gets.strip
#     end
#   end
#
#   def list_songs
#     binding.pry
#     Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
#
#       puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
#     end
#
#   end
#
#
#
#
#
#
#
# end
