require 'pry'

class MusicLibraryController

    def initialize(path = "./db/mp3s")
      music_importer = MusicImporter.new(path)
      music_importer.import
    end

    def play_song
      puts "Song number?"
      number = gets.strip.to_i
      Song.all.each_with_index {|song, index| puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}" if number == index + 1}
    end

    def list_artist
      puts "Artist?"
      input = gets.strip
      Song.all.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if input == song.artist.name}
    end

    def list_genre
      puts "Genre?"
      input = gets.strip
      Song.all.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if input == song.genre.name}
    end

    def call
      puts "Welcome to your music library! My name is Bradbury, your personal music-care companion. How can I help you today?"
      while (input = gets.strip)!= "exit"
        case input.downcase
          when "list songs"
            Song.print_songs
          when "list artists"
            Artist.print_artists
          when "list genres"
            Genre.print_genres
          when "play song"
            play_song
          when "list artist"
            list_artist
          when "list genre"
            list_genre
        end
      end
    end

end

