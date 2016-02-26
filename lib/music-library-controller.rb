require 'artist.rb'
require_all './lib'
require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    cli_import = MusicImporter.new(path)
    cli_import = cli_import.import
  end

  def call
    puts 'What would you like to do?'
    puts "Enter 1 to list songs\nEnter 2 to list artists\nEnter 3 to to list genres\nEnter 4 to play a song\nEnter 5 to list an artist's songs\nEnter 6 to list a genre's songs\nEnter 7 to exit"
    user_input = gets.strip.to_i
    case user_input
      when 1
        puts Songs.all
      when 2
        puts Artists.all
      when 3
        puts Genres.all
      when 4
        puts "pick a song"
        puts Songs.all
        user_song = gets.strip
        puts user_song
      when 5
        puts 'pick an artist to list their songs'
        puts Artists.all
        user_artist = gets.strip
        puts user_artist
      when 6
        puts 'pick a genre to list their songs'
        puts Genre.all
        user_genre = gets.strip
        puts user_genre
      when 7
        puts 'hope to see you soon!'
        exit
    end
  end
end