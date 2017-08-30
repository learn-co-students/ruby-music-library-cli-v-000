require 'pry'
class MusicLibraryController
  def initialize(path = './db/mp3s')
    @path = path
    new = MusicImporter.new(path)
    new.import
  end

  def call
    welcome = [
       "Welcome to your music library!",
       "To list all of your songs, enter 'list songs'.",
        "To list all of the artists in your library, enter 'list artists'.",
         "To list all of the genres in your library, enter 'list genres'.",
          "To list all of the songs by a particular artist, enter 'list artist'.",
           "To list all of the songs of a particular genre, enter 'list genre'.",
            "To play a song, enter 'play song'.",
             "To quit, type 'exit'.",
              "What would you like to do?"
            ]

     welcome.each {|x| puts x }

     while user_input = gets.chomp
      case user_input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      when "exit"
      break
      end
      end
      end

      def list_songs
         Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
           puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
         end
      end

      def list_artists
        Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |a, i|
          puts "#{i}. #{a.name}"
        end
      end

      def list_genres
        Genre.all.sort{ |a, b| a.name <=> b.name}.each.with_index(1) do |g, i|
          puts "#{i}. #{g.name}"
        end
      end

      def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end

        def list_songs_by_genre
          puts "Please enter the name of a genre:"
          input = gets.strip

          if genre = Genre.find_by_name(input)
            genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
              puts "#{i}. #{s.artist.name} - #{s.name}"
            end
          end
        end

        def play_song
    puts "Which song number would you like to play?"

    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end

end
