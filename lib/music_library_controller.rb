require 'pry'

class MusicLibraryController

    attr_reader :files

    def initialize(path = "./db/mp3s")
    #    @files = MusicImporter.new(path).import  # drop .import, add .files; add import later
        @files = MusicImporter.new(path).import
   #    binding.pry
    end

    def call
        puts "Welcome to Ruby Music Library"
        puts
        puts "These are your choices:"
        puts "list songs"
        puts "list artists"
        puts "list genres"
        puts "play song"
        puts "list artist"
        puts "list genre"
        puts "exit"
        puts

        input = ""
        until input == "exit"
   #         puts "enter choice: "
            input = gets.chomp
            case input
            when "list songs"
              self.files.each_with_index do |file, index|
     #           binding.pry
                number = index + 1
                song_name = file.name
                artist_name = file.artist.name
                genre_name = file.genre.name
                puts "#{number}. #{artist_name} - #{song_name} - #{genre_name}"
              end
            when "list artists"
               self.files.each {|file| puts "#{file.artist.name}"}
        #       binding.pry
            when "list genres"
                self.files.each {|file| puts "#{file.genre.name}"}
            when "play song"
                puts "list the number of your song"
                second_input = gets.chomp.to_i
                song = self.files[second_input - 1]
                puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
            when "list artist"
                second_input = gets.chomp
                self.files.each do |file|
                    if file.artist.name == second_input
                        puts "#{file.artist.name} - #{file.name} - #{file.genre.name}"
                    end
                end
            when "list genre"
                second_input = gets.chomp
                self.files.each do |file|
                    if file.genre.name == second_input
                        puts "#{file.artist.name} - #{file.name} - #{file.genre.name}"
                    end
                end
            end
        end
    end
end
