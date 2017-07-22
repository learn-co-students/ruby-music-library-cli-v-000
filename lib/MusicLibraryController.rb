class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to Music Library 3000!"
    menu_commands
  end

  def menu_commands
    puts "Please enter one of the follow:"
    puts " 'list songs' to list the songs"
    puts " 'list artists' to list the artists"
    puts " 'list genres' to list the genres"
    puts " 'play song' to play a song"
    puts " 'list artist' to play a song by an artist"
    puts " 'list genre' to play a song by an artist"
    input = gets.strip
    case(input)
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'play song'
        play_song
      when 'exit'
        return
      when 'list artist'
        list_artist_songs
      when 'list genre'
        list_genre_songs
      else
        puts "Invalid input"
        menu_commands
    end
  end

  def list_songs
    Song.sorted_songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    menu_commands
  end

  def list_artists
    Artist.all.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end

    menu_commands
  end

  def list_genres
    Genre.all.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
    menu_commands
  end

  def play_song
    puts "Please enter the number associated with the Song you'd like to listen to!"
    index = gets.strip.to_i - 1
    song = Song.sorted_songs[index]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    menu_commands
  end

  def list_artist_songs
    puts "Enter Artist name to view their songs"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist.songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
    menu_commands
  end

  def list_genre_songs
    puts "Enter Genre name to view their songs"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
    menu_commands
  end

end
