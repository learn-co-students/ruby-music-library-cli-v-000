require 'pry'
class MusicLibraryController
  attr_reader :files

  def initialize(path="./db/mp3s")
    @files = MusicImporter.new(path).import
  end

  def call
    input = ""
    until input == "exit"
    puts "Welcome to the music controller. What would you like to do?"
    puts "I accept: list songs, list artists, list genres, play song, list artist, or list genre"
      input = gets.chomp.downcase
      case input
      when "list songs"
        @files.each_with_index {|f, i| puts "#{i + 1}. #{f}"}
      when "list artists"
        @files.collect do |f|
          puts f.split(" - ")[0]
        end
      when "list genres"
        @files.collect do |f|
          puts f.split(" - ")[2].gsub(".mp3", "")
        end
      when "play song"
        puts "Which song would you like to hear?"
        to_play = gets.chomp.to_i
        list_songs
        play_song(to_play)
      when "list artist"
        puts "Which artist?"
          chosen_artist = gets.chomp
          puts list_artist_songs(chosen_artist)
        when "list genre"
          puts "What genre?"
            genre = gets.chomp.downcase
            puts list_genre_songs(genre)
        when "exit"
          puts "goodbye"
      else
        puts "That's not a valid option."
      end
    end
  end
  
  def find_artist_songs(artist)
    self.files.collect {|f| f.split(" - ")[0]}.select {|a| a == artist}
  end

  def list_songs
    self.files.each_with_index {|f, i| puts "#{i + 1}. #{f}"}
  end

  def list_artist_songs(chosen_artist)
    files_without_mp3.select {|f| f.include?(chosen_artist)}
  end

  def play_song(which_song)
    puts "Playing #{files_without_mp3[which_song - 1]}"
  end

  def files_without_mp3
    self.files.collect {|f| f.gsub(".mp3", "")}
  end

  def list_genre_songs(genre)
    files_without_mp3.select {|f| f.include?(genre)}
  end
end
