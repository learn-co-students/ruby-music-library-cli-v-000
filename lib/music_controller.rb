require "pry"
class MusicLibraryController

  attr_accessor :path
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    user_input = ""
    puts "Hi there, what would you like to do? Use the following commands: list songs, list artists, list genres, play song, list artist, list genre, or exit."

    until user_input == "exit"
    puts "Please choose an option: list songs, list artists, list genres, play song, list artist, list genre, or exit."
    user_input = gets.chomp.strip.downcase

    case user_input
    when "list songs"
      Song.all.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    when "list artists"
      Artist.all.each {|artist| puts artist.name}
    when "list genres"
      Genre.all.each {|genre| puts genre.name}
    when "play song"
      puts "Which song?"
      song_choice = gets.chomp.to_i
      song = Song.all[song_choice - 1]
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    when "list artist"
      puts "Which artist?"
      requested_artist = gets.chomp
      if Artist.find_by_name(requested_artist)
        Artist.find_by_name(requested_artist).songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      else
        puts "Sorry we don't have that artist."
      end
    when "list genre"
      puts "Which genre?"
      requested_genre = gets.chomp
      if Genre.find_by_name(requested_genre)
        Genre.find_by_name(requested_genre).songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    else
      puts "Sorry we don't have that genre."
    end
    when "exit"
      puts "Thank you! Come again!"
    else
      puts "Sorry, could you repeat that?"
    end
  end
end
end