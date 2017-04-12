require 'pry'

class MusicLibraryController
  attr_accessor :music

  def initialize(path = "./db/mp3s")
    @music = MusicImporter.new(path)
    @music.import
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def gets
    #puts "What would you like to do?"
    user_input = gets.chomp
  end

  def call
    input = gets
    case input
    when "list songs"
      @list_of_songs = @music.files.sort
      @list_of_songs.each_with_index do|elem, i|
        puts "#{i+1}. #{elem}"
      end
      gets
    when  "list artists"
      Artist.all.each do |artist|
        puts artist.name
      end
      gets
    when "list genres"
      Genre.all.each do |genre|
        puts genre.name
      end
      gets
    when "play song"
      user_input = gets
      index = input_to_index(user_input)
      songs = @music.files.sort
      playing_song = songs[index]
      puts "Playing #{playing_song}"
      gets
    when "list artist"
      array = []
      @music.files.each do |file|
        song = file.split(" - ")[1]
        split_artist = file.split(" - ")[0]
        split_genre = file.split(" - ")[2].chomp(".mp3")
        array << [song, split_artist, split_genre]
      end
      user_input = gets
      artist = Artist.find_by_name(user_input)
      array.each do |song|
        if song[1] == artist.name
          puts "#{song[1]} - #{song[0]} - #{song[2]}"
        end
      end
      gets
    when "list genre"
      array = []
      @music.files.each do |file|
        song = file.split(" - ")[1]
        split_artist = file.split(" - ")[0]
        split_genre = file.split(" - ")[2].chomp(".mp3")
        array << [song, split_artist, split_genre]
      end
      user_input = gets
      genre = Genre.find_by_name(user_input)
      array.each do |song|
        if song[2] == genre.name
          puts "#{song[1]} - #{song[0]} - #{song[2]}"
        end
      end
      gets
    when "exit"
      puts "Exiting..."
    else
      call
    end
  end
end
