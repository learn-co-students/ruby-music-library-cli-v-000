class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end
  
  def call
    input = ""
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      
      input = gets.strip
      
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end
  
  def list_songs
    Song.all.sort{|a, b| a.name <=> b.name}.each.with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  def list_artists
    Artist.all.sort{|a, b| a.name <=> b.name}.each.with_index{|artist, index| puts "#{index + 1}. #{artist.name}"}
  end
  def list_genres
    Genre.all.sort{|a, b| a.name <=> b.name}.each.with_index{|genre, index| puts "#{index + 1}. #{genre.name}"}
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    Song.all.detect{|song| Artist.find_by_name(artist).songs.sort{|a, b| a.name <=> b.name}.each.with_index{|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}  if song.artist.name == artist}
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    Genre.find_by_name(genre).songs.sort{|a, b| a.name <=> b.name}.each.with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"} if Song.all.detect{|song| song.genre.name == genre}
  end
  def play_song
    puts "Which song number would you like to play?"
    song_choice = gets.strip.to_i-1
    song = Song.all.sort{|a, b| a.name <=> b.name}[song_choice] if song_choice > 0 && song_choice < Song.all.length
    puts "Playing #{song.name} by #{song.artist.name}" if song != nil
  end

end