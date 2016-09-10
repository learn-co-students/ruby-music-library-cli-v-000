class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = nil
    until input == "exit"
      puts "enter user input"
      input = gets.chomp

      case input
      when "list songs"
        Song.all.each_with_index do |song, index|
          puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list artists"
        Song.all.each do |song|
          puts "#{song.artist.name}"
        end
      when "list genres"
        Song.all.each do |song|
          puts "#{song.genre.name}"
        end
      when "play song"
        puts "enter the number of the song to play"
        song_number = gets.chomp
        #need more code here...
      when "list artist" #needs more code, based on artist entered by user
      when "list genre" #needs more code, based on genre entered by user
      end

    end
  end

end
