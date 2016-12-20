require 'pry'
class MusicLibraryController

  def initialize(path= "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = nil
    until input == "exit"
      puts "What would you like to do?"
      input = gets.strip
      if input == "list songs"
        n = 1
        Song.all.each do |song|   #EACH WITH INDEX
          puts "#{n}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          n +=1
        end

      elsif input == "list artists"
        Artist.all.each {|artist| puts artist.name}

      elsif input == "list genres"
        Genre.all.each {|genre| puts genre.name}

      elsif input == "play song"
        puts "Enter the corresponding number:"
        num = gets.strip.to_i - 1
        puts "Playing #{Song.all[num].artist.name} - #{Song.all[num].name} - #{Song.all[num].genre.name}"

      elsif input == "list artist"
        puts "What artist should I list?"
        artist_input = gets.strip
        Artist.find_by_name(artist_input).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end

      elsif input == "list genre"
        puts "Which genre would you like me to list?"
        genre_input = gets.strip
        if Genre.find_by_name(genre_input)
          Genre.find_by_name(genre_input).songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
        else
          puts "Error"
        end
      end
    end
  end
end
