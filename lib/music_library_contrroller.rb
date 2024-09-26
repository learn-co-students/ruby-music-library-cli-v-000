require 'pry'

class MusicLibraryController


  def initialize(path = "./db/mp3s")

    music_import = MusicImporter.new(path)
    music_import.import
  end

  def call
    input = ""

     while input != "exit"
      puts "Welcome To Your Music Library"
      puts "What Would You Like To Do"

        input = gets.strip

        case input
        when "list songs"

          sorted_songs = Song.all.sort{|a, b| a.artist.name <=> b.artist.name}

            sorted_songs.each_with_index do |s, i|
              puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
            end



         when "list artists"
           Artist.all.each{|artist| puts "#{artist.name}"}

         when "list genres"
         Genre.all.each{|genre| puts "#{genre.name}"}

         when "list artist"
           Artist.all.each do |a|
             a.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" }
           end #each

         when "play song"
           Song.all.each{|s| puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"}

         when "list genre"
           Genre.all.each do |a|
             a.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" }
           end #each
           end#case
      end #while loop
    end #call Method

  # def call
  #   input = ""
  #   while input != "exit"
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
  #     input = gets.strip
  #
  #     case input
  #     when "list songs"
  #
  #     #  1. Action Bronson - Larry Csonka - indie
  #      list_songs
  #     when "list artists"
  #       list_artists
  #     when "list genres"
  #       list_genres
  #     when "list artist"
  #       list_songs_by_artist
  #     when "list genre"
  #       list_songs_by_genre
  #     when "play song"
  #       play_song
  #     end
  #   end
  # end
  #
  #  def list_songs
  #    Song.all.each_with_index do |song, index|
  #         puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  #     end
  # end
  #
  # def list_artists
  #  Artist.all.each do |artist|
  #    puts "#{artist.name}"
  #   end
  # end
  #
  # def list_genres
  #
  # end
  #
  # def list_songs_by_artist
  #
  # end
  #
  #
  # def list_songs_by_genre
  #
  # end
  #
  # def play_song
  #
  # end
  #
  #
  #

end
