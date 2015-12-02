require 'pry'


class MusicLibraryController
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "What do you want to do?"
    command = gets

    unless command == "exit"
      case command
      when "list songs"
        Song.all.each_with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end

      when "list artists"
        Artist.all.each do |artist|
          puts artist.name
        end 

      when "list genres"
        Genre.all.each do |type| 
          puts type.name
        end 
      
      when "play song"
        input= gets
        Song.all.each_with_index do |song, index|
          if index+1 == input.to_i 
            puts "Playing " + format_song(song)
          end
        end 

      when "list artist"
        puts "what artists"
        name = gets.strip
        
        Artist.all.each do |artist| 
          if name == artist.name
            artist.songs.each do |song|
              puts format_song(song)
            end
          end  
        end 
      

      when "list genre"
        puts "what genre"
        name = gets.strip

        Genre.all.each do |genre|
          if name == genre.name
            genre.songs.each do |song|
              puts format_song(song)
            end 
          end 
        end
      end

    call

       
    end
  end

  def format_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end 




