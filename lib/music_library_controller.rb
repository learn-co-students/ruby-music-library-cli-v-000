require "pry"

class MusicLibraryController
  attr_accessor :path, :music
  
  def initialize(path = "./db/mp3s", import = true)
    @path = path
    @import = import
    @music = MusicImporter.new(path)
    music.import
  end
  
  def call
    user_input_1 = " "
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      while user_input_1 != "exit"
        puts "What would you like to do?"
        user_input_1 = gets.strip
      end
    end
    
  def list_songs
    song_array = []
    alpha_file_list = []
    final_file_list = []
    music.files.each do |song|
      song_array << song.scan(/(?<=-\s).*?(?=\s-)/)[0]
    end
    song_array.sort.each do |song|
      music.files.each do |file|
        if file.include? "#{song}"
          alpha_file_list << file
        end
      end
    end 
    x = 1
    alpha_file_list.each do |file|
      final_file_list << "#{x}. #{file.gsub(".mp3", "")}"
      x += 1
    end
    z = 0 
    while z <= final_file_list.length - 1
      puts final_file_list[z]
      z += 1
    end
  end
  
  def list_artist
    artist_array = []
    music.files.each do |item|
      if !artist_array.include?(item.scan(/(?<=\A).*?(?= -)/)[0])
        artist_array << item.scan(/(?<=\A).*?(?= -)/)[0]
      end
    end
    x = 1
    new_array = artist_array.sort
    new_array.each do |artist|
      puts "#{x}. #{artist}"
      x += 1
    end
  end
end

    
    
    
    
    
    
    
