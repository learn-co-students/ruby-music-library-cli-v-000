require 'pry'
class MusicLibraryController

  def initialize(path="./db/mp3s")
    @files = MusicImporter.new(path).import
  end

  def call
    input = ""
    until input == "exit"
    puts "Welcome to the music controller. What would you like to do?"
    puts "I accept: list songs, list artists, list genres, play a song, list an artist's song, or list a genre's song"
      input = gets.chomp.downcase
      if input == "list songs"
        @files.each_with_index {|f, i| puts "#{i + 1}. #{f}"}
      elsif input == "list artists"
        @files.collect do |f|
          puts f.split(" - ")[0]
        end
      elsif input == "list genres"
        @files.collect do |f|
          puts f.split(" - ")[2].gsub(".mp3", "")
        end
      elsif input == "play song"
        puts "Which song would you like to hear?"
        which_song = gets.chomp.to_i
        list_songs
        play_song(which_song)
      elsif input == "list an artist's songs"






      end
    end
  end

  def list_songs
    @files.each_with_index {|f, i| puts "#{i + 1}. #{f}"}
  end

  def play_song(which_song)
    puts "Playing #{@files[which_song - 1].gsub(".mp3", "")}"
  end
end
