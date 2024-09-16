class MusicLibraryController
  
  def initialize(path = './db/mp3s')
  	importer = MusicImporter.new(path)
  	importer.import
  end

  def call
  	input = ""
  	until input == "exit"
  	  puts "Hi, welcome to your Music Library."
  	  puts "How can I help you?"
  	  input = gets.strip
  	  case input

      when "list songs"
  	    Song.all.each.with_index(1) do |s, i|
  	      puts "#{i}. #{s}"
  	    end

  	  when "list artists"
  	  	Artist.all.each.with_index(1) do |a, i|
  	  	  puts "#{i}. #{a}"
  	    end

  	  when "list genres"
  	  	Genre.all.each.with_index(1) do |g, i|
  	  	  puts "#{i}. #{g}"
  	  	end

  	  when "play song"
  	  	puts "Enter the song number:"
  	  	input = gets.strip.to_i
  	  	Song.all.each.with_index do |s, i|
  	  	  if input == i + 1
  	  		puts "Playing #{s}"
  	  	  end
  	  	end

  	  when "list artist"
  	  	puts "Enter artist's name:"
  	  	artist = gets.strip
  	  	artist = Artist.find_or_create_by_name(artist)
  	  	artist.songs.each {|s| puts "#{s}"}
  	 
  	 

  	  when "list genre"
  	  	puts "Enter genre:"
        genre = gets.strip
        genre = Genre.find_or_create_by_name(genre)
        genre.songs.each {|s| puts "#{s}"}
      end
    end
  end
end
