class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call

    input=nil
    loop do 
      prompt_for_input
      input=gets.strip
      case input

      when "list songs"
      	list_songs
      	
      when "list artists"
        Artist.all.each_with_index{|artist| puts "#{artist.name}"}
      
      when "list genres"
        Genre.all.each_with_index{|genre| puts "#{genre.name}"}
      
      when "play song"
        play_song
      
      when "list artist"
        song_by_artist
      
      when "list genre"
        song_by_genre
      
      when "exit"
        break
      
      else 
        invalid_input
      
      end 
    end
  end

  def list_songs
	s = Song.all.sort_by {|f| f.artist.name}
	s.each_with_index do |f, index|
		puts "#{index + 1}. #{f.artist.name} - #{f.name} - #{f.genre.name}"
	end
  end

  def play_song
    input = gets.strip.to_i - 1
    s = Song.all.sort_by {|f| f.artist.name}
    puts "Playing #{s[input].artist.name} - #{s[input].name} - #{s[input].genre.name}"
  end

  def invalid_input
  	  puts "invalid input, Please enter:"
      call
  end

  def song_by_artist
  	puts "Pick an artist"
    input=gets.strip

    Artist.find_by_name(input).songs.each do |song|
    	puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

  end

  def song_by_genre
  	puts "Pick a genre"
    input=gets.strip

    Genre.find_by_name(input).songs.each do |song|
    	puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

  end

  def prompt_for_input
  	  puts "Please make a Choice"
      puts "list songs"
      puts "list artists"
      puts "list genres"
      puts "play a song"
      puts "list artist"
      puts "list genre"
      puts "To exit, please type exit"
  end

end