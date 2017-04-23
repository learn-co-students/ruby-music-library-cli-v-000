require 'pry'

class MusicLibraryController
  attr_reader :path, :song, :artist, :genre

    def initialize(path="./db/mp3s")
      music_importer = MusicImporter.new(path)
      music_importer
      music_importer.import
    end

    def call
      input = " "
      while input != "exit"
        input = gets.chomp
        puts "What would you like?"
          if input == "list songs"
            sorted = Song.all.sort_by { |song| song.artist.name }
            sorted.each.with_index do |song, index|
                puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
              end
          elsif input == "list artists"
            sort_artists = Artist.all.sort_by { |song| song.artist.name }
            sort_artists.each do |song|
                puts "#{song.artist.name}"
              end
          elsif input == "list genres"
            # sort_genres = Artist.all.sort_by { |song| song.artist.name }
            Genre.all.each do |song|
                puts "#{song.genre.name}"
              end
          elsif input == "play song"
            puts "Which number?"
            number = gets.chomp
            play_song = Song.all.sort_by { |song| song.artist.name }
            play_song.all.each.with_index do |song, index|
              puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}" if index == number
            end
          end
        end
      end

end
