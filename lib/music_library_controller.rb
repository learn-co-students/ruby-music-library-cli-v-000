require 'pry'

class MusicLibraryController
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def list_songs
    counter = 1
    alphabetical = Song.all.sort_by!{|song| song.artist.name}
    alphabetical.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
    puts "\n\n\ntype 'back' to return to the main menu\nor type 'exit' to leave"
    print ":"
    exit_back
  end

  def list_artists
    alphabetical = Artist.all.sort_by!{|artist| artist.name}
    alphabetical.each do |artist|
      puts artist.name
    end
    puts "\n\n\ntype 'back' to return to the main menu\nor type 'exit' to leave"
    print ":"
    exit_back
  end

  def list_genres
    alphabetical = Genre.all.sort_by!{|genre| genre.name}
    alphabetical.each do |genre|
      puts genre.name
    end
    puts "\n\n\ntype 'back' to return to the main menu\nor type 'exit' to leave"
    print":"
    exit_back
  end

  def play_song
    puts "\n\nenter the number of the song from the song list that you would like to play:\ntype 'back' to return to the menu\ntype 'exit' to leave\n\n\n"
    print ":"
    input = gets.strip
    until input == "back" || input == "exit"
      if input.to_i - 1 < 0
        until input.to_i - 1 >= 0
          puts "\nplease enter a song number"
          print ":"
          input = gets.strip
        end
      end
      song_num = input.to_i - 1
      alphabetical = Song.all.sort_by!{|song| song.artist.name}
      puts "\n\n\nPlaying #{alphabetical[song_num].artist.name} - #{alphabetical[song_num].name} - #{alphabetical[song_num].genre.name}"
      puts "\n\nenter a song number to play a new song\ntype 'back' to go back to the main menu\nor type 'exit' to leave the program\n\n"
      print ":"
      input = gets.strip
    end
    call if input == "back"
  end

  def artist_songs
    puts "\n\nPlease type the name of the artist to display their songs"
    print ":"
    input = gets.strip
    unless input == "exit"
      if artist = Artist.find_by_name(input)
        artist.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      else
        artist_songs
      end
      puts "\nenter 'exit' to leave app or press any button to return to the main menu"
      print ":"
      exit_back
    end
  end

  def genre_songs
    puts "\n\nPlease type the name of the genre to display its songs"
    print ":"
    input = gets.strip
    unless input == "exit"
      if genre = Genre.find_by_name(input)
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      else
        genre_songs
      end
      puts "\nenter 'exit' to leave app or press any button to return to the main menu"
      print ":"
      exit_back
    end
  end

  def call
    puts  "Type 'list songs' for a list of songs.\nType 'list artists' for a list of artists.\nType 'list genres' for a list of genres.\nType 'play song' and enter the corresponding number from the song list to play a song.\nType 'list artist' followed by an artist's name to see their songs.\nType 'list genre' followed by a genre to see all songs in a genre.\n  Or type 'exit' to leave.\n\n"
    print ":"
    input = gets.strip
    unless input == "exit"
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "play song"
        play_song
      elsif input == "list artist"
        artist_songs
      elsif input == "list genre"
        genre_songs
      else
        call unless input == "exit"
      end
    end
  end

  def exit_back
    input = gets.strip
    call if input != "exit"
  end
end
