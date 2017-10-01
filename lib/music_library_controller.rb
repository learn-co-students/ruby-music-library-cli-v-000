require 'pry'

class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
      puts "Welcome to your music library!"
      until input == "exit"
        puts "What would you like to do?"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
          input = gets.strip

      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
    end
  end

  def list_songs
    songs = Song.all
    songs = songs.sort_by { |s| s.name }
    songs.each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
}
  end

  def list_artists
    artists = Artist.all
    artists = artists.sort_by { |a| a.name } #sort artists list alphabetically
    artists.each_with_index { |artist, index| puts "#{index + 1}. #{artist.name}" } #print all artists in a numbered list
  end

  def list_genres
    genres = Genre.all
    genres = genres.sort_by { |g| g.name } #sort genres list alphabetically
    genres.each_with_index { |genre, index| puts "#{index + 1}. #{genre.name}" } #print all genres in a numbered list
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:" #prompts user to enter an artist
    a_name = gets.chomp #accepts user input
     artist = Artist.find_by_name(a_name)
      if artist != nil
        songs = artist.songs.sort_by {|s| s.name}
        songs.each_with_index {|s, i| puts "#{i + 1}. #{s.name} - #{s.genre.name}"} #prints all songs by a particular artist in a numbered, alphabetized list
      #does nothing if no matching artist is found
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:" #prompts user to enter a genre
    g_name = gets.chomp #accepts user input
     genre = Genre.find_by_name(g_name)
      if genre != nil
        songs = genre.songs.sort_by {|s| s.name} #prints all songs by a particular genre in a numbered, alphabetized list
        songs.each_with_index {|s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name}"}
      end
    #does nothing if no matching genre is found
  end

  def play_song
    puts "Which song number would you like to play?" #prompts user to choose a song from the alphabetized list output by #list_songs
    number = gets.strip.to_i #accepts user input
    songs = Song.all
    songs = songs.sort_by { |s| s.name }
    if number > 0 && number < songs.length #checks that the user entered a number between 1 and the total number of songs
      puts "Playing #{songs[number - 1].name} by #{songs[number - 1].artist.name}"  #upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
      #does not 'puts' anything out if a matching song is not found
    end
  end

end
