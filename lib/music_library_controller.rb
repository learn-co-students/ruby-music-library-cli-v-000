require 'pry'

class MusicLibraryController

    attr_accessor :path

    def initialize(path = './db/mp3s')
        @path = path
        MusicImporter.new(@path).import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."

        puts  "What would you like to do?"
        input = gets
        until input == 'exit'
            puts  "What would you like to do?"
            input = gets
        end
    end

    def list_songs
        song_sort_array = Song.all.collect.sort{|x,y| x.name <=> y.name}
        count = 1
        song_sort_array.each do |song|
            puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            count +=1
            #binding.pry
        end
    end

    def list_artists
        sort_array = Song.all.collect.sort{|x,y| x.artist.name <=> y.artist.name}
        final_array = sort_array.collect do |song|
             song.artist.name
        end.uniq

        count = 1
        final_array.each do |artist|
            puts "#{count}. #{artist}"
             count += 1
         end

        binding.pry

    end
end
