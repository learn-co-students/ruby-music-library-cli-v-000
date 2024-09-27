
class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
  end
  
  def call
    puts "Would you like to:\nList Songs\nList Artists\nList Genres\nSay Exit to Exit Program"
    input = gets.strip
    until input.to_s.downcase == "exit"
      if input.to_s.downcase == "list songs"
        Song.print_all
        input = gets.strip
      elsif input.to_s.downcase == "list artists"
        Artist.print_all
        input = gets.strip
      elsif input.to_s.downcase == "list genres"
        Genre.print_all
        input = gets.strip
      elsif input.to_s.downcase == "play song"
        puts "song number:"
        song_input = gets.chomp.to_i
        song = Song.all[song_input -1]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        input = gets.strip
      elsif input.to_s.downcase == "list artist"
        puts "Arist Name:"
        name = gets.strip
        result = Artist.find_by_name(name)
        if result != nil
          result.songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        else 
          puts "please enter a valid artist"
        end  
        input = gets.strip
      elsif input.to_s.downcase == "list genre"
        puts "Genre Name:"
        name = gets.strip
        result = Genre.find_by_name(name)
        if result != nil
          result.songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        else 
          puts "please enter a valid genre"
        end
        input = gets.strip
      else
        puts "please choose one of the valid options above"
        input = gets.strip
      end
    end
  end
end