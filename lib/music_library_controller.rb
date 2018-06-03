require "pry"
class MusicLibraryController

  #attr_accessor :path

  #@@path = []

  def initialize(path = './db/mp3s')
    music_importer_object = MusicImporter.new(path)
    music_importer_object.import
    #binding.pry

  end

  def call
    #@@path
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = gets.strip
      if  input == 'list songs'
        song.each_with_index do |value, key|
          binding.pry
          puts value
        end
      elsif input == 'list artists'
           artist.each_with_index do |value, key|
             puts gets.value
         end
      elsif input == 'list genres'
             genre.each_with_index do |value, key|
               puts gets.value
           end
      elsif input == 'list artist'
             artist.each_with_index do |value, key|
               puts gets.value
           end
      elsif input == 'list genre'
             genre.each_with_index do |value, key|
               puts gets.value
           end
      # elsif input == 'play song'
      #        music_importer_object.import
      elsif input == 'exit'
             exit
        end
    end
      #
end
