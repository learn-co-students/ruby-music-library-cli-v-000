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
          puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
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
       song_number = (gets.chomp.to_i)-1 #based on import order of files/correction for indexing array of songs relative to user-displayed list
       puts "Playing #{Song.all[song_number].artist.name} - #{Song.all[song_number].name} - #{Song.all[song_number].genre.name}"
      when "list artist"
        puts "enter the artist"
        name = gets.chomp
        Artist.find_by_name(name).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list genre"
        puts "enter the genre"
        genre = gets.chomp
        Genre.find_by_name(genre).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end

    end
  end

end
