require "pry"


class MusicLibraryController

  attr_accessor :path
  
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call

    final_input = false
    until final_input == true
     final_input = gets.chomp
    case final_input
    when "list songs"
      Song.all.each_with_index do |song, index|
         puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end  
    when "list artists"
      Artist.all.each {|artist| puts artist.name}
    when "list genres"
      Genre.all.each {|genre| puts genre.name}
   
    when "play song"
       song_choice = gets.chomp.to_i
       song = Song.all[song_choice - 1]
       puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"

     when "list artist"
        artist_choice = gets.chomp
        if Artist.find_by_name(artist_choice)
          Artist.find_by_name(artist_choice).songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
         end
       end
     when "list genre"
      genre_choice = gets.chomp
      if Genre.find_by_name(genre_choice)
        Genre.find_by_name(genre_choice).songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
    when "exit"
      final_input = true
    
    end
      
  end 
 end 
end