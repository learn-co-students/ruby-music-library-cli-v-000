require 'pry'
class MusicLibraryController

 # attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def musicimporter(path)
    Musicimporter.new(path)
  end
  def call
    input = ""
    while input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
         songs
#          Song.all
#          Song.all.each_with_index  {|song, index| puts "#{index + 1}. #{song.artist} - #{song.name} - #{song.genre}"}


    #    binding.pry
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end

  def artists
#     list_artists
#        puts Artist.all
    Artist.all.each.with_index(1) do |a, i|
#       binding.pry
      puts "#{i}. #{a}"
    end
  end

  def genres
#     list_genre
#     puts Genre.all
    Genre.all.each.with_index(1) do |g, i|
      puts "#{i}. #{g}"
    end
  end

  def list_artist
    puts "What artist by name you like to list songs for?"
    artist_input = gets.strip
#     Song.all.select {|song| song.artist.name == input_artist}.each {|song| puts "#{song.artist} - #{song.name} - #{song.genre}"}

#    binding.pry

    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |s,i|
        puts "#{i}. #{s}"
      end
    end
  end

  def list_genre
    puts "What genre by name you like to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |s,i|
        puts "#{i}. #{s}"
      end
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_input = gets.strip
    puts "Playing #{Song.all[song_input.to_i-1]}"
  end

  def songs
    Song.all.sort_by {|s, i| puts "#{i}. #{s}" }
binding.pry
#   def songs
#     Song.all.each.with_index(1) do |s, i|
#       puts "#{i}. #{s}"
#     end
  end
end
#   def call
#     input = ""
#     while input != "exit"
#       puts "Welcome to Your Music Library!"
#       puts "What would you like to do?"
#       input = gets.strip
#       case input
#         when "list songs"
#             Song.all.each.with_index(1) do |s, i|
#             puts "#{i}. #{s}"
#          #binding.pry
#             end
#         when "list artists"
#           Artist.all.each.with_index(1) do |a, i|
#             puts "#{i}. #{a}"

#           end
#         when "list genres"
#            Genre.all.each.with_index(1) do |g, i|
#              puts "#{i}. #{g}"
#            end
# #         when "list artist"
# #             puts "What artist by name would you like to list songs for?"
# #             artist_input = gets.strip
# #             if artist = Artist.find_by_name(artist_input)
# #               artist.songs.each do |s,i|
# #                 puts "#{i}. #{s}"
# #               end  #do
# #             end #if
#          end  #case
#       end  #call

#   def play_song
#     puts "What song number would you like to play?"
#     song_input = gets.strip
#     puts "Playing #{Song.all[song_input.to_i-1]}"
#   end

# #   def songs
# #     Song.all.each.with_index(1) do |s, i|
# #       puts "#{i}. #{s}"
# #     end
# #   end

#   end  #case
# end #class