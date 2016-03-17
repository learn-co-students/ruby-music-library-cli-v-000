require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "You've opened the Music Library."
    commands 
    response = ""
    

    while response 
    puts "Please enter a command: (Type 'commands' for a list of commands)"
    response = gets.strip

    case response 
    when "list songs"
      list_songs
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "list artist"
      songs_by_artist
    when "list genre"
      songs_by_genre
    when "play song"
      play_song
    when commands
      commands
    when "exit"
      exit
      break
    end
  end
  end

  def commands
    puts "==========================================="
    puts "|                 COMMANDS                |"
    puts "==========================================="
    puts "| I accept the following commands:        |"
    puts "| *list songs                             |"
    puts "| *list artists                           |"
    puts "| *list genres                            |"
    puts "| *list artist : list songs by artist     |"
    puts "| *list genre : list songs by genre       |"
    puts "| *play song                              |"
    puts "| *commands : list these commands         |"
    puts "| *exit : exits the program               |"
    puts "=========================================="
  end

  def list_songs
    Song.all.each_with_index{|song, index| puts "#{index+1}. #{song.filename}"}
  end

  def list_artists
    Artist.all.each_with_index{|artist, index| puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    Genre.all.each_with_index{|genre, index| puts "#{index+1}. #{genre.name}"}
  end

  def play_song
    nums =* (1..99)
    puts "Input a song number to play a song."
    song_input = gets.strip

    if nums.include?(song_input.to_i)
      puts "Playing #{Song.all[song_input.to_i-1].filename}"
    else
      puts "Invalid input. Try again."
    end
  end

  def songs_by_genre
    puts "What genre of music would you like to check out?"

    genre_input = gets.strip
    if Genre.find_by_name(genre_input) 
      genre = Genre.find_by_name(genre_input) 
      genre.songs.each_with_index{|song, index| puts "#{index+1}. #{song.filename}"}
    else 
      puts "Invalid input. Try again."
    end
  end

  def songs_by_artist
    puts "Which artist's songs would you like to check out?"
    artist_input = gets.strip
    if Artist.find_by_name(artist_input) 
      artist = Artist.find_by_name(artist_input) 
      artist.songs.each_with_index{|song, index| puts "#{index+1}. #{song.filename}"}
    else 
      puts "Invalid input. Try again."
    end
  end

  def exit
    puts "Goodbye!"
  end

end
