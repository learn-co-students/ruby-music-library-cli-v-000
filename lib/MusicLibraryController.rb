

class MusicLibraryController

  attr_accessor :path 

  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import  
  end

  def call
      puts "Welcome to Your Music Library!"
      listing_methods 
  end 

  def listing_methods
    @input = nil
    while @input != "exit"
      puts "What would you like to do?"
      @input = gets.strip 
    case @input 
    when "list songs"
      Song.all.each.with_index(1) do |x, y|
        puts "#{y}. #{x.artist.name} - #{x.name} - #{x.genre.name}"          
    end
    when "list artists"
      Song.all.each do |x|
        puts "#{x.artist.name}"
    end
    when "list genres"
      Song.all.each do |x|
        puts "#{x.genre.name}"
    end

    when "play song"
      Song.all.each.with_index(1) do |x, y|
        puts "#{y}. #{x.name}" 
        end
      puts "Choose a song by number."
      @input2 = gets.strip.to_i  
      songplay = Song.all[@input2-1]
      puts "Playing #{songplay.artist.name} - #{songplay.name} - #{songplay.genre.name}"

    when "list artist"
        Song.all.each do |x|
        puts "#{x.artist.name}"
      end
        puts "Choose an artist."
        @input3 = gets.strip   
        ugh = []
        Song.all.each do |a| 
          if a.artist.name == @input3 
            ugh << a.artist
        end
      end
        ugh.first.songs.each do |singing|
        puts "#{ugh.first.name} - #{singing.name} - #{singing.genre.name}"
      end  
 
    when "list genre"
      Genre.all.each do |x|
        puts "#{x.name}"
      end 
        puts "Choose a genre."
        @input4 = gets.strip
        ugh2 = []
      Genre.all.each do |a|
        if a.name == @input4
          ugh2 << a
        end
      end
      ugh2.first.songs.each do |gen|
        puts "#{gen.artist.name} - #{gen.name} - #{ugh2.first.name}"
    end
 

  end
  end 

end

end

