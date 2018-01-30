require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  @@songs_with_details = []
  @@unnumbered_songs_with_details = []


  def list_songs
    Song.all.each_with_index do |song, i|
      song_with_index = "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      @@songs_with_details << song_with_index
    end
    Song.all.each do |song|
      song_without_index = "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      @@unnumbered_songs_with_details << song_without_index
    end
    puts @@songs_with_details
  end


  def call

    input = ""

    until input == "exit"
      puts
      puts "What would you like to do with your music library?"
      puts
      input = gets.chomp.downcase

      if input == "list songs"
        puts
        list_songs
      elsif input == "list artists"
        puts
        Artist.all.each{|artist| puts artist.name}
      elsif input == "list genres"
        puts
        Genre.all.each{|genre| puts genre.name}
      elsif input == "play song"
        puts
        list_songs
        puts
        puts "Please enter the number of the song you'd like to play from the list above."
        puts
        song_input = gets.chomp.to_i
        puts
        puts "Playing #{@@unnumbered_songs_with_details[song_input - 1]}"
        puts
      elsif input == "list artist"
        puts
        puts "Which artist's songs should I list?"
        puts
        artist_input = gets.chomp
        puts
        Artist.find_by_name(artist_input).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
        puts
      elsif input == "list genre"
        puts
        puts "Which genre's songs should I list?"
        puts
        genre_input = gets.chomp
        puts
        Genre.find_by_name(genre_input).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
        puts

      end
    end

  end

end
