require 'pry'

class MusicLibraryController

  def initialize(path='./db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = ""

    while input != "exit"
      puts "What would you like to do?"
      input = gets.chomp

      case input
      when "list songs"
        Song.all.each_with_index do |song, i|
          puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list artists"
        Artist.all.each { |artist| puts artist.name }
      when "list genres"
        Genre.all.each { |genre| puts genre.name }
      when "play song"
        puts "Which song number would you like to play?"
        song_number = gets.chomp.to_i
        song = Song.all[song_number-1]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      when "list artist"
        puts "Which artist's songs would you like to find?"
        artist_name = gets.chomp
        artist = Artist.find_by_name(artist_name)
        artist.songs.each do |song| 
          puts "#{artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list genre"
        puts "Which genre of songs would you like listed?"
        genre_name = gets.chomp
        genre = Genre.find_by_name(genre_name)
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{genre.name}"
        end
      end
    end
  end

end

