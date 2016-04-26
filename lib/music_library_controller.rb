class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "7"
      puts "Welcome to the Music Library!"
      puts "Please enter a number: "
      puts ""
      puts "1. List songs\n2. List artists\n3. List genres"
      puts "4. List artist's songs\n5. List genre's songs\n6. Play song\n7. Exit"
      input = gets.chomp
      case input
      when "1"
        songs
      when "2"
        artists
      when "3"
        genres
      when "4"
        list_artist
      when "5"
        list_genre
      when "6"
        play_song
      end
    end
  end

  def songs
    Song.all.each.with_index(1) do |s,i|
      puts "#{i}. #{s.name}"
    end
  end

  def artists
    Artist.all.each.with_index(1) do |a,i|
      puts "#{i}. #{a.name}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |g,i|
      puts "#{i}. #{g.name}"
    end
  end

  def list_artist
    puts "Please type the name of the artist whose songs you would like to list:"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      artist.songs.each.with_index(1) do |s,i|
        puts "#{i}. #{s.name}"
      end
    end
  end

  def list_genre
    puts "Please type the name of the genre whose songs you would like to list:"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      genre.songs.each.with_index(1) do |s,i|
        puts "#{i}. #{s.name}"
      end
    end
  end

  def play_song
    puts "Please type the number of the song you would like to play:"
    input = gets.chomp
    puts "Now playing: #{Song.all[input.to_i-1].name}"
  end
end
# require 'pry'
# class MusicLibraryController

#  # attr_accessor :path

#   def initialize(path='./db/mp3s')
# #     @path = path
#     music_importer = MusicImporter.new(path)
#     music_importer.import
#   end

#   def musicimporter(path)
#     Musicimporter.new(path)
#   end
#   def call
#     input = ""
#     while input != "exit"
#       puts "Welcome to Your Music Library!"
#       puts "What would you like to do?"
#       input = gets.strip
#       case input
#       when "list songs"
#         list_songs
#       when "list songs"
#         songs
#       when "list artists"
#         artists
#       when "list genres"
#         genres
#       when "list artist"
#         list_artist
#       when "list genre"
#         list_genre
#       when "play song"
#         play_song
#       end
#     end
#   end

#   def artists
# #     list_artists
# #        puts Artist.all
#     Artist.all.each.with_index(1) do |a, i|
# #       binding.pry
#       puts "#{i}. #{a}"
#     end
#   end

#   def genres
# #     list_genre
# #     puts Genre.all
#     Genre.all.each.with_index(1) do |g, i|
#       puts "#{i}. #{g}"
#     end
#   end


#   def list_artist
#     puts "What artist by name you like to list songs for?"
#     artist_input = gets.strip
# #     Song.all.select {|song| song.artist.name == input_artist}.each {|song| puts "#{song.artist} - #{song.name} - #{song.genre}"}

# #    binding.pry

#     if artist = Artist.find_by_name(artist_input)
#       artist.songs.each do |s,i|
#         puts "#{i}. #{s}"
#       end
#     end
#   end

#   def list_genre
#     puts "What genre by name you like to list songs for?"
#     genre_input = gets.strip
#     if genre = Genre.find_by_name(genre_input)
#       genre.songs.each do |s,i|
#         puts "#{i}. #{s}"
#       end
#     end
#   end

#   def play_song
#     puts "What song number would you like to play?"
#     song_input = gets.strip
#     puts "Playing #{Song.all[song_input.to_i-1]}"
#   end

# #    def list_songs
# #     self.all_files.each_with_index do |filename, index|
# #       puts "#{index + 1}. #{filename.sub(/.mp3/, "")}"
# #     end
# #   end

#   def list_songs
#     Song.all.each.with_index do |s, i|
#       puts "#{i + 1}. #{s}"
#    end
#   end

#   def songs

# #     Song.all.each_with_index do |s, i|
#      Song.all.each.with_index(1) do |s, i|
#       puts "#{i}. #{s}"
#     end

#   end
# end


# require 'pry'
# class MusicLibraryController
#
#  # attr_accessor :path
#
#   def initialize(path='./db/mp3s')
#     @path = path
#     music_importer = MusicImporter.new(path)
#     music_importer.import
#   end
#
#   def musicimporter(path)
#     Musicimporter.new(path)
#   end
#   def call
#     input = ""
#     while input != "exit"
#       puts "Welcome to Your Music Library!"
#       puts "What would you like to do?"
#       input = gets.strip
#       case input
#       when "list songs"
#          songs
# #          Song.all
# #          Song.all.each_with_index  {|song, index| puts "#{index + 1}. #{song.artist} - #{song.name} - #{song.genre}"}
#
#     #    binding.pry
#       when "list artists"
#         artists
#       when "list genres"
#         genres
#       when "list artist"
#         list_artist
#       when "list genre"
#         list_genre
#       when "play song"
#         play_song
#       end
#     end
#   end
#
#   def artists
# #     list_artists
# #        puts Artist.all
#     Artist.all.each.with_index(1) do |a, i|
# #       binding.pry
#       puts "#{i}. #{a}"
#     end
#   end
#
#   def genres
# #     list_genre
# #     puts Genre.all
#     Genre.all.each.with_index(1) do |g, i|
#       puts "#{i}. #{g}"
#     end
#   end
#
#   def list_artist
#     puts "What artist by name you like to list songs for?"
#     artist_input = gets.strip
# #     Song.all.select {|song| song.artist.name == input_artist}.each {|song| puts "#{song.artist} - #{song.name} - #{song.genre}"}
#
# #    binding.pry
#
#     if artist = Artist.find_by_name(artist_input)
#       artist.songs.each do |s,i|
#         puts "#{i}. #{s}"
#       end
#     end
#   end
#
#   def list_genre
#     puts "What genre by name you like to list songs for?"
#     genre_input = gets.strip
#     if genre = Genre.find_by_name(genre_input)
#       genre.songs.each do |s,i|
#         puts "#{i}. #{s}"
#       end
#     end
#   end
#
#   def play_song
#     puts "What song number would you like to play?"
#     song_input = gets.strip
#     puts "Playing #{Song.all[song_input.to_i-1]}"
#   end
#
#   def songs
#
#     Song.all.each.with_index(1) do |s, i|
#       puts "#{i}. #{s}"
#     end
# #     Song.all.sort_by {|name| name}
# # binding.pry
# #   def songs
# #     Song.all.each.with_index(1) do |s, i|
# #       puts "#{i}. #{s}"
# #     end
#   end
# end
# #   def call
# #     input = ""
# #     while input != "exit"
# #       puts "Welcome to Your Music Library!"
# #       puts "What would you like to do?"
# #       input = gets.strip
# #       case input
# #         when "list songs"
# #             Song.all.each.with_index(1) do |s, i|
# #             puts "#{i}. #{s}"
# #          #binding.pry
# #             end
# #         when "list artists"
# #           Artist.all.each.with_index(1) do |a, i|
# #             puts "#{i}. #{a}"
#
# #           end
# #         when "list genres"
# #            Genre.all.each.with_index(1) do |g, i|
# #              puts "#{i}. #{g}"
# #            end
# # #         when "list artist"
# # #             puts "What artist by name would you like to list songs for?"
# # #             artist_input = gets.strip
# # #             if artist = Artist.find_by_name(artist_input)
# # #               artist.songs.each do |s,i|
# # #                 puts "#{i}. #{s}"
# # #               end  #do
# # #             end #if
# #          end  #case
# #       end  #call
#
# #   def play_song
# #     puts "What song number would you like to play?"
# #     song_input = gets.strip
# #     puts "Playing #{Song.all[song_input.to_i-1]}"
# #   end
#
# # #   def songs
# # #     Song.all.each.with_index(1) do |s, i|
# # #       puts "#{i}. #{s}"
# # #     end
# # #   end
#
# #   end  #case
# # end #class
