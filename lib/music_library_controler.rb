class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end
  
  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    exit_selected = false 
    until exit_selected do
      input = gets.strip
      if input == 'exit'
        exit_selected = true
      else 
        handle_inputs(input)
      end
    end
  end 
  
  def handle_inputs(input)
    if input == "list songs"
      list_songs
    elsif 
      input == "list artists"
      list_artists
    elsif 
      input == "list genres"
      list_genres
    elsif
      input == "list artist" 
      list_songs_by_artist 
    elsif 
      input == "list genre"
      list_songs_by_genre 
    elsif 
      input == "play song"
      play_song 
    end
  end
  
  def list_songs
    all_songs = Song.all.sort_by{ |song| song.name }
    all_songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end 
  
  def list_artists 
    all_artists = Artist.all.sort_by{ |artist| artist.name }
    all_artists.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end
  
  def list_genres
    all_genres = Genre.all.sort_by{ |genre| genre.name }
    all_genres.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.all.select{ |a| a.name == input }[0]
    if artist
      artist_songs = artist.songs.sort{ |a, b| a.name <=> b.name } 
      artist_songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip 
    genre = Genre.all.select{ |a| a.name == input }[0]
    if genre
      genres = genre.songs.sort{ |a, b| a.name <=> b.name } 
      genres.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    all_songs = Song.all.sort_by{ |song| song.name }
    selected_song = all_songs[input.to_i-1]
    if selected_song && input.to_i > 0 && input.to_i < 6
        puts "Playing #{selected_song.name} by #{selected_song.artist.name}" 
    end
  end
end