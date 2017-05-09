class MusicLibraryController


def initialize(path = './db/mp3s')
  @path = path
  music_importer = MusicImporter.new(path)
  @music = []
  @music = music_importer.import
end

def call
  puts "Welcome to your Computer's Music Library"
  input = ""
  until input == "exit"
    puts "Type in one of the following commands:"
     puts "List Songs"
     puts "List Artists"
     puts "List Genres"
     puts "Play Song"
     puts "List Artist"
     puts "List Genre"

    input = gets.strip
    case input
    when "list songs"
      @music.sort.each.with_index(1) do |song, index|
    
        puts "#{index}. #{song}"
      end
    when "list artists"
      puts "The artists are: "
      @music.sort.each.with_index(1) do |song, index|
        song = song.split(" - ")
        puts "#{index}. #{song[0]}"
      end
    when "list genres"
      puts "The genres are: "
      @music.sort.each.with_index(1) do |song, index|
        song = song.split(" - ")
        puts "#{index}. #{song[2]}"
      end
    when "list artist"
      puts "Who's songs are you looking for?"
      input = gets.strip
      puts "Here is a list of the songs by them."
      @music.sort.each.with_index(1) do |song, index|
        x = song.split(" - ")
        puts "#{song}" if input == x[0]
      end
    when "list genre"
      puts "What genres are you looking for?"
    
      input = gets.strip
      puts "Here is a list of songs in that genre."
      @music.sort.each.with_index(1) do |song, index|
        x = song.split(" - ")
        genre = x[2].split(".")
        puts "#{song}" if input == genre[0]
      end
    when "play song"
      array = []
      puts "What song would you like to play?"
      input = gets.strip
      input = input.to_i
      @music.sort.each.with_index(1) do |song, index|
    
        array <<  song
      end
    
      puts "Playing #{array[input - 1]}"
    end
    end
  end
end
