class MusicLibraryController

  def initialize(path = './db/mp3s')
    new_import = MusicImporter.new(path)
    new_import.import
  end

  def call
    command = ""
    while command != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      command = gets.strip

      if command == "list songs"
        list_songs
      elsif command == 'list artists'
        list_artists
      elsif command == 'list genres'
        list_genres
      elsif command == 'list artist'
        list_songs_by_artist
      elsif command == 'list genre'
        list_songs_by_genre
      elsif command == 'play song'
        play_song
      end
    end
  end

  def list_songs
    list = Song.all.sort {|a,b| a.name <=> b.name}
    list.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    list = Artist.all.sort {|a,b| a.name <=> b.name}
    list.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end

  def list_genres
    list = Genre.all.sort {|a,b| a.name <=> b.name}
    list.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_command = gets.strip

    if artist = Artist.find_by_name(artist_command)
      songs_by_artist = artist.songs.sort {|a,b| a.name <=> b.name}
      songs_by_artist.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_command = gets.strip

    if genre = Genre.find_by_name(genre_command)
      songs_by_genre = genre.songs.sort {|a,b| a.name <=> b.name}
      songs_by_genre.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    which_song = gets.strip.to_i
    list = Song.all
    if which_song <= list.length && which_song > 0
      list = Song.all.sort{ |a, b| a.name <=> b.name }
      selection = list[which_song - 1]
      puts "Playing #{selection.name} by #{selection.artist.name}"
    end
  end


end
