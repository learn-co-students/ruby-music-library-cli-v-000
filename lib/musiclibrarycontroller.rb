class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    music_importer =  MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = nil
    while input != "exit"
      input = gets.chomp
      if input == "list songs"
        Song.all.each_with_index do |song, index|
          puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      elsif input == "list artists"
        Artist.all.each_with_index do |artist, index|
          puts "#{index + 1}. #{artist.name}"
        end
      elsif input == "list genres"
        Genre.all.each_with_index do |genre, index|
          puts "#{index + 1}. #{genre.name}"
        end
      elsif input == "play song"
        input = gets.chomp
        input_to_index = input.to_i - 1
        puts "Playing #{Song.all[input_to_index].artist.name} - #{Song.all[input_to_index].name} - #{Song.all[input_to_index].genre.name}"
      elsif input == "list artist"
        input = gets.chomp
        Artist.find_by_name(input).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      elsif input == "list genre"
        input = gets.chomp
        Genre.find_by_name(input).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end



end
