class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end 

  def call
    input = ""

    until input == "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do? The options are:"
      puts "list songs"
      puts "list artists"
      puts "list genres"
      puts "play song"
      puts "list artist"
      puts "list genre"
      puts "Please enter your selection now!"

      input = gets.strip

      case input
      when "list songs"   
        Song.all.each_with_index{|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      when "list artists"  
        Artist.all.each {|artist| puts artist.name }
      when "list genres"  
        Genre.all.each {|genre| puts genre.name }  
      when "play song"
        puts "Which number song?"
        input = gets.strip
        now_playing = Song.all[input.to_i - 1]
        puts "Playing #{now_playing.artist.name} - #{now_playing.name} - #{now_playing.genre.name}"
      when "list artist"  
        puts "Which Artist?"
        input = gets.strip
        artist = Artist.find_by_name(input)
        artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      when "list genre"  
        puts "Which Genre?"
        input = gets.strip
        genre = Genre.find_by_name(input)
        genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}  
      end
    end    
  end 
end 

