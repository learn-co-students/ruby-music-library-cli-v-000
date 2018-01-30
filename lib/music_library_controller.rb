require "pry"

class MusicLibraryController

  def initialize (path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input  = nil
    until input == "exit"
      input = gets.chomp
      if input == "list songs"
        Song.all.each.with_index(1) do |song, index| 
          puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      elsif input == "list artists"
        Artist.all.each {|artist| puts "#{artist.name}"}
      elsif input == "list genres"
        Genre.all.each {|genre| puts "#{genre.name}"}
      elsif input == "play song"
        input = gets.chomp
        input = input.to_i
        input -= 1
        puts "Playing #{Song.all[input].artist.name} - #{Song.all[input].name} - #{Song.all[input].genre.name}"
      elsif input == "list artist"
        input = gets.chomp
        Artist.find_by_name(input).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      elsif input == "list genre"
        input = gets.chomp
        Genre.find_by_name(input).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
          
      end
        
    end
  end


end