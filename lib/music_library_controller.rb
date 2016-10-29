require 'pry'

class MusicLibraryController

  attr_accessor :controller_path

  def initialize(controller_path = "./db/mp3s")
    @controller_path = controller_path
    MusicImporter.new(@controller_path).import
  end

  def call

    loop do

      input = gets.chomp.downcase
      break if input == 'exit'

      case input
      when 'list songs'
        Song.all.each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      when 'list artists'
        Artist.all.each_with_index { |artist, index| puts "#{index + 1}. #{artist.name}"}
      when 'list genres'
        Genre.all.each_with_index { |genre, index| puts "#{index + 1}. #{genre.name}"}
      when 'play song'
        song_choice = gets.chomp.to_i
        song = Song.all[song_choice - 1]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      when 'list artist'
        artist = gets.chomp
        artist = Artist.find_by_name(artist)
        artist.songs.each { |song| puts "#{artist.name} - #{song.name} - #{song.genre.name}" }
      when 'list genre'
        genre = gets.chomp
        genre = Genre.find_by_name(genre)
        genre.songs.each { |song| puts "#{song.artist.name} - #{song.name} - #{genre.name}" }
      end # end case

    end # end loop

  end # end call

end # end class
