require 'pry'
class MusicLibraryController

  def initialize(path_to_files = './db/mp3s')
    @path_to_files = path_to_files
    MusicImporter.new(path_to_files).import
  end

  def call
    while true
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip.downcase
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
      elsif input == "exit"
        break
      end
    end

  end

  def list_songs
    Song.all
      .sort_by{|song| song.name}
      .each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all
      .sort_by{|artist| artist.name}
      .each_with_index do |artist, index|
        puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all
      .sort_by{|genre| genre.name}
      .each_with_index do |genre, index|
        puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name_of_artist = gets.chomp
    if Artist.find_by_name(name_of_artist)
      Artist.find_by_name(name_of_artist).songs
        .sort_by{|song| song.name}
        .each_with_index do |song, index|
          puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name_of_genre = gets.chomp
    if Genre.find_by_name(name_of_genre)
      Genre.find_by_name(name_of_genre).songs
        .sort_by{|song| song.name}
        .each_with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_to_play = gets.chomp.to_i
    #binding.pry
    if song_to_play > 0 && song_to_play <= Song.all.length
      puts "Playing #{Song.all.sort_by{|song| song.name}[song_to_play-1].name} by #{Song.all.sort_by{|song| song.name}[song_to_play-1].artist.name}"
    end
  end

end
