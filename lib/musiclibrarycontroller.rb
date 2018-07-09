require 'pry'
class MusicLibraryController
    attr_accessor :path

    def initialize(path = './db/mp3s')
        @path = path
        MusicImporter.new(path).import
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
        puts "What would you like to do?"
        input = gets.chomp
        unless input == "exit"
            call
        end
    end

    def list_songs
        # binding.pry
        list = MusicImporter.new(path).files.sort {|file1, file2| file1.split(" - ")[1] <=> file2.split(" - ")[1]}.map { |e| e.gsub(".mp3","")}
        list.each_with_index {|file, index| puts "#{index+1}. #{file}"}
        list

        # list = Song.all.sort!{|i, e| i.name <=> e.name}
        # list.each_with_index{|i,e|
        #     puts "#{e+1}. #{i.artist.name} - #{i.name} - #{i.genre.name}"}
        # list
    end

    def list_artists
        Artist.all.map {|artist| artist.name}.uniq.sort!.each_with_index {|file, index| puts "#{index+1}. #{file}"}
        # binding.pry
    end

    def list_genres
        Genre.all.map {|genre| genre.name}.uniq.sort!.each_with_index {|file, index| puts "#{index+1}. #{file}"}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        if Artist.find_by_name(input)
            Song.all.select{|e| e.artist.name == "#{input}"}.sort!{|i, e| i.name <=> e.name}.each_with_index{|i,e|
                puts "#{e+1}. #{i.name} - #{i.genre.name}"}
            end
        end

        def list_songs_by_genre
            puts "Please enter the name of a genre:"
            input = gets.strip
            if Genre.find_by_name(input)
                Song.all.select{|e| e.genre.name == "#{input}"}.sort!{|i, e| i.name <=> e.name}.each_with_index{|i,e|
                    puts "#{e+1}. #{i.artist.name} - #{i.name}"}
                end
            end

            def play_song
                # binding.pry
                puts "Which song number would you like to play?"
                input = gets.strip.to_i
                if input > 0 && input <= 5
                    puts "Playing #{list_songs[input-1].split(" - ")[1]} by #{list_songs[input-1].split(" - ")[0]}"
                    # "Playing #{list_songs[input].name} by #{list_songs[input].artist.name}"
                end
            end

            def MusicLibraryController - CLI Commands

        end
