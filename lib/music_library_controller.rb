# require 'pry'
#
# class MusicLibraryController
#
#   def initialize(path = './db/mp3s')
#     @path = path
#     MusicImporter.new(path).import
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
#     # binding.pry
#     while  x = gets.chomp
#       case x
#         when "exit"
#           break
#         when "list songs"
#           list_songs
#         when "list artists"
#           list_artists
#         when "list artist"
#           list_songs_by_artist
#         when "play song"
#           play_song
#         when "exit"
#           break
#         when "list genres"
#           list_genres
#         when "list genre"
#           list_songs_by_genre
#         end
#       end
#   end
#
#   # f = filename.gsub(".mp3","")
#   # f = f.split(" - ")
#
#   def list_songs
#     x = Song.all.sort_by!{ |song| song.name}.uniq
#     i = 0
#     until i == x.size
#       puts "#{i + 1}. " + "#{x[i].artist.name}" + " - " + "#{x[i].name}" + " - " + "#{x[i].genre.name}"
#       # binding.pry
#       i += 1
#     end
#   end
#
#   def list_artists
#     x = Artist.all.sort_by!{ |artist| artist.name}.uniq
#     i = 0
#     until i == x.size
#       puts "#{i + 1}. " + "#{x[i].name}"
#       # binding.pry
#       i += 1
#     end
#   end
#
#   def list_genres
#     x = Genre.all.sort_by!{ |genre| genre.name}
#     i = 0
#     until i == x.size
#       puts "#{i + 1}. " + "#{x[i].name}"
#       i += 1
#     end
#   end
#
#
#
#
#   def list_songs_by_artist
#     puts "Please enter the name of an artist:"
#     response = gets.chomp
#     # binding.pry
#     artist = Artist.find_by_name(response)
#     # binding.pry
#     if artist
#       #binding.pry
#
#       song_array = artist.songs.sort_by!{ |song| song.name}
#       # binding.pry
#
#       # binding.pry
#       # i = 0
#       #   until i == song_array.size
#       #     puts "#{i + 1}. " + "#{song_array[i].name}"
#       #     i += 1
#       #   end
#       # end
#       #binding.pry
#       song_array.each_with_index {   |song, i|
#          puts "#{i + 1}. #{song.name} - #{song.genre.name}"
#
#       }
#     end
#
#   end
#
#   def list_songs_by_genre
#     puts "Please enter the name of a genre:"
#     response = gets.chomp
#
#     genre = Genre.find_by_name(response)
#
#     if genre
#       song_array = genre.songs.sort_by!{ |song| song.name}
#
#       song_array.each_with_index {   |song, i|
#          puts "#{i + 1}. #{song.artist.name} - #{song.name}"
#
#       }
#     end
#
#
#     def play_song
#       puts "Which song number would you like to play?"
#       response = gets.chomp.to_i
#       # binding.pry
#
#       x = Song.all.sort_by!{ |song| song.name}.uniq
#       # binding.pry
#       i = 0
#       # listed_array = []
#       until i == x.size
#         # listed_array <<  "#{i}. " + "#{x[i].artist.name}" + " - " + "#{x[i].name}" + " - " + "#{x[i].genre.name}"
#         # binding.pry
#         if i == response - 1
#           # i += 1
#           puts "Playing #{x[i].name} by #{x[i].artist.name}"
#           # binding.pry
#           break
#         end
#         i += 1
#       end
#
#
#
#     end
#
#   end
#
#
#
# end
