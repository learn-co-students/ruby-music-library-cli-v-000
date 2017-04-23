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
            sort_artists = Song.all.sort_by { |song| song.artist.name }.uniq
            sort_artists.each do |song|
                puts "#{song.artist.name}"
              end
          elsif input == "list genres"
            # sort_genres = Artist.all.sort_by { |song| song.artist.name }
            Song.all.each do |song|
                puts "#{song.genre.name}"
              end
              # binding.pry
          elsif input == "play song"
            puts "Which number?"
            index = gets.chomp
            Song.all["#{index}"]
              puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
            #play_song.each.with_index do |song, index|
              #puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}" if index == number
          end
        end
      end

end
